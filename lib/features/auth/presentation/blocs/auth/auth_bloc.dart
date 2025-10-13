import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/usecases/check_auth_usecase.dart';
import '../../../domain/usecases/login_usecase.dart';
import '../../../domain/usecases/logout_usecase.dart';
import '../../../domain/usecases/refresh_token_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final LogoutUseCase _logoutUseCase;
  final CheckAuthUseCase _checkAuthUseCase;
  final RefreshTokenUseCase _refreshTokenUseCase;

  AuthBloc(
    this._loginUseCase,
    this._logoutUseCase,
    this._checkAuthUseCase,
    this._refreshTokenUseCase,
  ) : super(const AuthState.initial()) {
    on<CheckAuthEvent>(_onCheckAuth);
    on<LoginEvent>(_onLogin);
    on<LogoutEvent>(_onLogout);
    on<RefreshTokenEvent>(_onRefreshToken);
  }

  Future<void> _onCheckAuth(
    CheckAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    
    final result = await _checkAuthUseCase();
    
    result.fold(
      (failure) => emit(AuthState.error(message: failure.userFriendlyMessage)),
      (user) {
        if (user != null) {
          emit(AuthState.authenticated(user: user));
        } else {
          emit(const AuthState.unauthenticated());
        }
      },
    );
  }

  Future<void> _onLogin(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    
    final result = await _loginUseCase(
      email: event.email,
      password: event.password,
    );
    
    result.fold(
      (failure) => emit(AuthState.error(message: failure.userFriendlyMessage)),
      (user) => emit(AuthState.authenticated(user: user)),
    );
  }

  Future<void> _onLogout(
    LogoutEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    
    final result = await _logoutUseCase();
    
    result.fold(
      (failure) => emit(AuthState.error(message: failure.userFriendlyMessage)),
      (_) => emit(const AuthState.unauthenticated()),
    );
  }

  Future<void> _onRefreshToken(
    RefreshTokenEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _refreshTokenUseCase();
    
    result.fold(
      (failure) {
        // If refresh fails, user needs to log in again
        emit(const AuthState.unauthenticated());
      },
      (newToken) {
        // Token refreshed successfully, maintain current state
        // The actual token is handled by the repository
      },
    );
  }
}