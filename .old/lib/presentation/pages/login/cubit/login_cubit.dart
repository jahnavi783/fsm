import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsm_flutter/core/constants.dart';
import 'package:fsm_flutter/data/client.dart';
import 'package:fsm_flutter/data/entity/user_entity.dart';
import 'package:fsm_flutter/data/response/login_request.dart';
import 'package:fsm_flutter/injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginLoadingState());

  final RestClient _client = serviceLocator<RestClient>();
  final _prefs = serviceLocator<SharedPreferences>();

  Future<void> loginUser(String email, String password) async {
    emit(LoginLoadingState());
    try {
      final response = await _client.login(
        LoginRequest(email, password),
      );
      await _saveTokens(response.accessToken, response.refreshToken);
      emit(LoginSuccessState(user: response.user));
    } on DioException catch (e) {
      // Handle DioException specifically
      final response = e.response;
      if (response != null && response.statusCode == 401) {
        return emit(LoginErrorState(errorMessage: "Invalid credentials"));
      } else {
        return emit(
            LoginErrorState(errorMessage: e.message ?? "An error occurred"));
      }
    } catch (e) {
      return emit(LoginErrorState(errorMessage: e.toString()));
    }
  }

  _saveTokens(String accessToken, String refreshToken) async {
    await _prefs.clear();
    await _prefs.setString(AppConstants.accessToken, accessToken);
    await _prefs.setString(AppConstants.refreshToken, refreshToken);
  }
}
