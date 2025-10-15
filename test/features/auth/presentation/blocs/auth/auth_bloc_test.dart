import 'package:bloc_test/bloc_test.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/auth/domain/entities/user_entity.dart';
import 'package:fsm/features/auth/domain/usecases/check_auth_usecase.dart';
import 'package:fsm/features/auth/domain/usecases/login_usecase.dart';
import 'package:fsm/features/auth/domain/usecases/logout_usecase.dart';
import 'package:fsm/features/auth/domain/usecases/refresh_token_usecase.dart';
import 'package:fsm/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:fsm/features/auth/presentation/blocs/auth/auth_event.dart';
import 'package:fsm/features/auth/presentation/blocs/auth/auth_state.dart';

// Mock classes
class MockLoginUseCase extends Mock implements LoginUseCase {}

class MockLogoutUseCase extends Mock implements LogoutUseCase {}

class MockCheckAuthUseCase extends Mock implements CheckAuthUseCase {}

class MockRefreshTokenUseCase extends Mock implements RefreshTokenUseCase {}

void main() {
  group('AuthBloc', () {
    late AuthBloc authBloc;
    late MockLoginUseCase mockLoginUseCase;
    late MockLogoutUseCase mockLogoutUseCase;
    late MockCheckAuthUseCase mockCheckAuthUseCase;
    late MockRefreshTokenUseCase mockRefreshTokenUseCase;

    // Test data
    const testEmail = 'ayush.kumar@global-csg.com';
    const testPassword = '123456';
    const testUser = UserEntity(
      id: 1,
      firstName: 'John',
      lastName: 'Doe',
      email: testEmail,
    );
    const testFailure = NetworkFailure(message: 'Network error');

    setUp(() {
      mockLoginUseCase = MockLoginUseCase();
      mockLogoutUseCase = MockLogoutUseCase();
      mockCheckAuthUseCase = MockCheckAuthUseCase();
      mockRefreshTokenUseCase = MockRefreshTokenUseCase();

      authBloc = AuthBloc(
        mockLoginUseCase,
        mockLogoutUseCase,
        mockCheckAuthUseCase,
        mockRefreshTokenUseCase,
      );
    });

    tearDown(() {
      authBloc.close();
    });

    test('initial state should be AuthInitial', () {
      expect(authBloc.state, equals(const AuthState.initial()));
    });

    group('CheckAuthEvent', () {
      blocTest<AuthBloc, AuthState>(
        'emits [loading, authenticated] when check auth succeeds with user',
        build: () {
          when(() => mockCheckAuthUseCase()).thenAnswer(
            (_) async => const Right(testUser),
          );
          return authBloc;
        },
        act: (bloc) => bloc.add(const AuthEvent.checkAuth()),
        expect: () => [
          const AuthState.loading(),
          const AuthState.authenticated(user: testUser),
        ],
        verify: (_) {
          verify(() => mockCheckAuthUseCase()).called(1);
        },
      );

      blocTest<AuthBloc, AuthState>(
        'emits [loading, unauthenticated] when check auth succeeds with null user',
        build: () {
          when(() => mockCheckAuthUseCase()).thenAnswer(
            (_) async => const Right(null),
          );
          return authBloc;
        },
        act: (bloc) => bloc.add(const AuthEvent.checkAuth()),
        expect: () => [
          const AuthState.loading(),
          const AuthState.unauthenticated(),
        ],
        verify: (_) {
          verify(() => mockCheckAuthUseCase()).called(1);
        },
      );

      blocTest<AuthBloc, AuthState>(
        'emits [loading, error] when check auth fails',
        build: () {
          when(() => mockCheckAuthUseCase()).thenAnswer(
            (_) async => const Left(testFailure),
          );
          return authBloc;
        },
        act: (bloc) => bloc.add(const AuthEvent.checkAuth()),
        expect: () => [
          const AuthState.loading(),
          const AuthState.error(
              message:
                  'No internet connection. Please check your network and try again.'),
        ],
        verify: (_) {
          verify(() => mockCheckAuthUseCase()).called(1);
        },
      );
    });

    group('LoginEvent', () {
      blocTest<AuthBloc, AuthState>(
        'emits [loading, authenticated] when login succeeds',
        build: () {
          when(() => mockLoginUseCase(
                email: any(named: 'email'),
                password: any(named: 'password'),
              )).thenAnswer(
            (_) async => const Right(testUser),
          );
          return authBloc;
        },
        act: (bloc) => bloc.add(const AuthEvent.login(
          email: testEmail,
          password: testPassword,
        )),
        expect: () => [
          const AuthState.loading(),
          const AuthState.authenticated(user: testUser),
        ],
        verify: (_) {
          verify(() => mockLoginUseCase(
                email: testEmail,
                password: testPassword,
              )).called(1);
        },
      );

      blocTest<AuthBloc, AuthState>(
        'emits [loading, error] when login fails',
        build: () {
          when(() => mockLoginUseCase(
                email: any(named: 'email'),
                password: any(named: 'password'),
              )).thenAnswer(
            (_) async => const Left(testFailure),
          );
          return authBloc;
        },
        act: (bloc) => bloc.add(const AuthEvent.login(
          email: testEmail,
          password: testPassword,
        )),
        expect: () => [
          const AuthState.loading(),
          const AuthState.error(
              message:
                  'No internet connection. Please check your network and try again.'),
        ],
        verify: (_) {
          verify(() => mockLoginUseCase(
                email: testEmail,
                password: testPassword,
              )).called(1);
        },
      );

      blocTest<AuthBloc, AuthState>(
        'emits [loading, error] when login fails with authentication error',
        build: () {
          const authFailure =
              AuthenticationFailure(message: 'Invalid credentials');
          when(() => mockLoginUseCase(
                email: any(named: 'email'),
                password: any(named: 'password'),
              )).thenAnswer(
            (_) async => const Left(authFailure),
          );
          return authBloc;
        },
        act: (bloc) => bloc.add(const AuthEvent.login(
          email: testEmail,
          password: testPassword,
        )),
        expect: () => [
          const AuthState.loading(),
          const AuthState.error(
              message: 'Authentication failed. Please log in again.'),
        ],
        verify: (_) {
          verify(() => mockLoginUseCase(
                email: testEmail,
                password: testPassword,
              )).called(1);
        },
      );
    });

    group('LogoutEvent', () {
      blocTest<AuthBloc, AuthState>(
        'emits [loading, unauthenticated] when logout succeeds',
        build: () {
          when(() => mockLogoutUseCase()).thenAnswer(
            (_) async => const Right(null),
          );
          return authBloc;
        },
        act: (bloc) => bloc.add(const AuthEvent.logout()),
        expect: () => [
          const AuthState.loading(),
          const AuthState.unauthenticated(),
        ],
        verify: (_) {
          verify(() => mockLogoutUseCase()).called(1);
        },
      );

      blocTest<AuthBloc, AuthState>(
        'emits [loading, error] when logout fails',
        build: () {
          when(() => mockLogoutUseCase()).thenAnswer(
            (_) async => const Left(testFailure),
          );
          return authBloc;
        },
        act: (bloc) => bloc.add(const AuthEvent.logout()),
        expect: () => [
          const AuthState.loading(),
          const AuthState.error(
              message:
                  'No internet connection. Please check your network and try again.'),
        ],
        verify: (_) {
          verify(() => mockLogoutUseCase()).called(1);
        },
      );
    });

    group('RefreshTokenEvent', () {
      blocTest<AuthBloc, AuthState>(
        'emits [unauthenticated] when refresh token fails',
        build: () {
          when(() => mockRefreshTokenUseCase()).thenAnswer(
            (_) async => const Left(testFailure),
          );
          return authBloc;
        },
        act: (bloc) => bloc.add(const AuthEvent.refreshToken()),
        expect: () => [
          const AuthState.unauthenticated(),
        ],
        verify: (_) {
          verify(() => mockRefreshTokenUseCase()).called(1);
        },
      );

      blocTest<AuthBloc, AuthState>(
        'maintains current state when refresh token succeeds',
        build: () {
          when(() => mockRefreshTokenUseCase()).thenAnswer(
            (_) async => const Right('new_token'),
          );
          return authBloc;
        },
        act: (bloc) => bloc.add(const AuthEvent.refreshToken()),
        expect: () => [],
        verify: (_) {
          verify(() => mockRefreshTokenUseCase()).called(1);
        },
      );
    });

    group('State transitions', () {
      blocTest<AuthBloc, AuthState>(
        'handles multiple events correctly',
        build: () {
          when(() => mockLoginUseCase(
                email: any(named: 'email'),
                password: any(named: 'password'),
              )).thenAnswer(
            (_) async => const Right(testUser),
          );
          when(() => mockLogoutUseCase()).thenAnswer(
            (_) async => const Right(null),
          );
          return authBloc;
        },
        act: (bloc) {
          bloc.add(const AuthEvent.login(
            email: testEmail,
            password: testPassword,
          ));
          bloc.add(const AuthEvent.logout());
        },
        expect: () => [
          const AuthState.loading(),
          const AuthState.authenticated(user: testUser),
          const AuthState.loading(),
          const AuthState.unauthenticated(),
        ],
      );
    });
  });
}
