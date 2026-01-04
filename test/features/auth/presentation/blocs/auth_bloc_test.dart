import 'package:bloc_test/bloc_test.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/auth/domain/entities/user_entity.dart';
import 'package:fsm/features/auth/domain/usecases/check_auth_usecase.dart';
import 'package:fsm/features/auth/domain/usecases/login_usecase.dart';
import 'package:fsm/features/auth/domain/usecases/logout_usecase.dart';
import 'package:fsm/features/auth/domain/usecases/refresh_token_usecase.dart';
import 'package:fsm/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:fsm/features/auth/presentation/blocs/auth/auth_event.dart';
import 'package:fsm/features/auth/presentation/blocs/auth/auth_state.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginUseCase extends Mock implements LoginUseCase {}

class MockLogoutUseCase extends Mock implements LogoutUseCase {}

class MockCheckAuthUseCase extends Mock implements CheckAuthUseCase {}

class MockRefreshTokenUseCase extends Mock implements RefreshTokenUseCase {}

void main() {
  late AuthBloc bloc;
  late MockLoginUseCase mockLoginUseCase;
  late MockLogoutUseCase mockLogoutUseCase;
  late MockCheckAuthUseCase mockCheckAuthUseCase;
  late MockRefreshTokenUseCase mockRefreshTokenUseCase;

  setUp(() {
    mockLoginUseCase = MockLoginUseCase();
    mockLogoutUseCase = MockLogoutUseCase();
    mockCheckAuthUseCase = MockCheckAuthUseCase();
    mockRefreshTokenUseCase = MockRefreshTokenUseCase();
    bloc = AuthBloc(
      mockLoginUseCase,
      mockLogoutUseCase,
      mockCheckAuthUseCase,
      mockRefreshTokenUseCase,
    );
  });

  const tEmail = 'test@example.com';
  const tPassword = 'password123';
  const tUser = UserEntity(
    id: 1,
    firstName: 'John',
    lastName: 'Doe',
    email: tEmail,
    accessToken: 'access_token',
    refreshToken: 'refresh_token',
  );

  group('LoginEvent', () {
    blocTest<AuthBloc, AuthState>(
      'emits [loading, authenticated] when login is successful',
      build: () {
        when(() => mockLoginUseCase(
              email: any(named: 'email'),
              password: any(named: 'password'),
            )).thenAnswer((_) async => const Right(tUser));
        return bloc;
      },
      act: (bloc) => bloc.add(const LoginEvent(
        email: tEmail,
        password: tPassword,
      )),
      expect: () => [
        const AuthState.loading(),
        const AuthState.authenticated(user: tUser),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [loading, error] when login fails',
      build: () {
        when(() => mockLoginUseCase(
              email: any(named: 'email'),
              password: any(named: 'password'),
            )).thenAnswer((_) async => const Left(
              AuthenticationFailure(message: 'Invalid credentials'),
            ));
        return bloc;
      },
      act: (bloc) => bloc.add(const LoginEvent(
        email: tEmail,
        password: tPassword,
      )),
      expect: () => [
        const AuthState.loading(),
        const AuthState.error(
            message: 'Authentication failed. Please log in again.'),
      ],
    );
  });

  group('CheckAuthEvent', () {
    blocTest<AuthBloc, AuthState>(
      'emits [loading, authenticated] when user is authenticated',
      build: () {
        when(() => mockCheckAuthUseCase())
            .thenAnswer((_) async => const Right(tUser));
        return bloc;
      },
      act: (bloc) => bloc.add(const CheckAuthEvent()),
      expect: () => [
        const AuthState.loading(),
        const AuthState.authenticated(user: tUser),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [loading, unauthenticated] when user is not authenticated',
      build: () {
        when(() => mockCheckAuthUseCase())
            .thenAnswer((_) async => const Right(null));
        return bloc;
      },
      act: (bloc) => bloc.add(const CheckAuthEvent()),
      expect: () => [
        const AuthState.loading(),
        const AuthState.unauthenticated(),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [loading, error] when check auth fails',
      build: () {
        when(() => mockCheckAuthUseCase()).thenAnswer(
          (_) async => const Left(CacheFailure(message: 'Cache error')),
        );
        return bloc;
      },
      act: (bloc) => bloc.add(const CheckAuthEvent()),
      expect: () => [
        const AuthState.loading(),
        const AuthState.error(
            message: 'Failed to access local data. Please try again.'),
      ],
    );
  });

  group('LogoutEvent', () {
    blocTest<AuthBloc, AuthState>(
      'emits [loading, unauthenticated] when logout is triggered',
      build: () => bloc,
      act: (bloc) => bloc.add(const LogoutEvent()),
      expect: () => [
        const AuthState.loading(),
        const AuthState.unauthenticated(),
      ],
    );
  });

  group('RefreshTokenEvent', () {
    blocTest<AuthBloc, AuthState>(
      'emits [unauthenticated] when token refresh fails',
      build: () {
        when(() => mockRefreshTokenUseCase()).thenAnswer(
          (_) async => const Left(
            AuthenticationFailure(message: 'Session expired'),
          ),
        );
        return bloc;
      },
      act: (bloc) => bloc.add(const RefreshTokenEvent()),
      expect: () => [
        const AuthState.unauthenticated(),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'maintains current state when token refresh succeeds',
      build: () {
        when(() => mockRefreshTokenUseCase())
            .thenAnswer((_) async => const Right('new_token'));
        return bloc;
      },
      act: (bloc) => bloc.add(const RefreshTokenEvent()),
      expect: () => [],
    );
  });
}
