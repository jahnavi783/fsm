import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsm_flutter/data/client.dart';
import 'package:fsm_flutter/data/entity/user_entity.dart';
import 'package:fsm_flutter/injection.dart';

part 'profile_screen_state.dart';

class ProfileCubit extends Cubit<ProfileScreenState> {
  UserEntity? _user;
  final RestClient _restClient = serviceLocator<RestClient>();
  ProfileCubit() : super(ProfileScreenInitial());

  UserEntity get user {
    if (_user == null) {
      fetchUser();
      return UserEntity(
        id: 0,
        firstName: '',
        lastName: '',
        email: '',
      );
    }
    return _user!;
  }

  void setUser(UserEntity user) {
    _user = user;
    emit(ProfileScreenSuccessState(user: user));
  }

  void fetchUser() {
    final userId = 4;
    if (userId == null) {
      emit(ProfileScreenErrorState(errorMessage: "User ID not found"));
      return;
    }
    emit(ProfileScreenLoadingState());
    _restClient.getUserById().then((user) {
      setUser(user);
    }).catchError((error) {
      emit(ProfileScreenErrorState(errorMessage: error.toString()));
    });
  }
}
