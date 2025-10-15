import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:either_dart/either.dart';

import '../../lib/app.dart';
import '../../lib/core/error/failures.dart';
import '../../lib/features/auth/domain/entities/user_entity.dart';
import '../../lib/features/auth/domain/repositories/i_auth_repository.dart';
import '../../lib/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'integration_test_helpers.dart';

void main() {
  group('Authentication Flow Integration Tests', () {
    late MockAuthRepository mockAuthRepository;

    setUpAll(() async {
      await IntegrationTestHelpers.setupIntegrationTest();
    });

    tearDownAll(() async {
      await IntegrationTestHelpers.tearDownIntegrationTest();
    });

    setUp(() {
      mockAuthRepository = MockAuthRepository();
    });

    testWidgets('Complete authentication flow - successful login',
        (tester) async {
      // Arrange
      final testUser = IntegrationTestHelpers.createTestUser();

      when(mockAuthRepository.login(any, any)).thenAnswer(
        (_) async => Right(testUser),
      );
      when(mockAuthRepository.checkAuthStatus()).thenAnswer(
        (_) async => const Right(null),
      );

      // Act - Launch app
      await tester.pumpWidget(const FSMApp());
      await tester.pumpAndSettle();

      // Assert - Should show splash screen initially
      expect(find.byKey(const Key('splash_page')), findsOneWidget);

      // Wait for navigation to login
      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('login_page')),
      );

      // Assert - Should show login page
      expect(find.byKey(const Key('login_page')), findsOneWidget);
      expect(find.byKey(const Key('email_field')), findsOneWidget);
      expect(find.byKey(const Key('password_field')), findsOneWidget);
      expect(find.byKey(const Key('login_button')), findsOneWidget);

      // Act - Enter valid credentials
      await tester.enterText(
        find.byKey(const Key('email_field')),
        'test@example.com',
      );
      await tester.enterText(
        find.byKey(const Key('password_field')),
        'password123',
      );
      await tester.pumpAndSettle();

      // Act - Tap login button
      await tester.tap(find.byKey(const Key('login_button')));
      await tester.pump();

      // Assert - Should show loading indicator
      IntegrationTestHelpers.verifyLoadingIndicator();

      // Wait for login completion
      await tester.pumpAndSettle();

      // Assert - Should navigate to dashboard
      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('dashboard_page')),
      );
      expect(find.byKey(const Key('dashboard_page')), findsOneWidget);

      // Verify login was called with correct parameters
      verify(mockAuthRepository.login('test@example.com', 'password123'))
          .called(1);
    });

    testWidgets('Authentication flow - invalid credentials', (tester) async {
      // Arrange
      when(mockAuthRepository.login(any, any)).thenAnswer(
        (_) async => const Left(ServerFailure(
          message: 'Invalid credentials',
          statusCode: 401,
        )),
      );
      when(mockAuthRepository.checkAuthStatus()).thenAnswer(
        (_) async => const Right(null),
      );

      // Act - Launch app
      await tester.pumpWidget(const FSMApp());
      await tester.pumpAndSettle();

      // Wait for login page
      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('login_page')),
      );

      // Act - Enter invalid credentials
      await tester.enterText(
        find.byKey(const Key('email_field')),
        'invalid@example.com',
      );
      await tester.enterText(
        find.byKey(const Key('password_field')),
        'wrongpassword',
      );
      await tester.pumpAndSettle();

      // Act - Tap login button
      await tester.tap(find.byKey(const Key('login_button')));
      await tester.pump();

      // Assert - Should show loading indicator briefly
      IntegrationTestHelpers.verifyLoadingIndicator();

      // Wait for error state
      await tester.pumpAndSettle();

      // Assert - Should show error message and stay on login page
      IntegrationTestHelpers.verifyErrorMessage('Invalid credentials');
      expect(find.byKey(const Key('login_page')), findsOneWidget);
      IntegrationTestHelpers.verifyNoLoadingIndicator();

      // Verify login was attempted
      verify(mockAuthRepository.login('invalid@example.com', 'wrongpassword'))
          .called(1);
    });

    testWidgets('Authentication flow - network error during login',
        (tester) async {
      // Arrange
      IntegrationTestHelpers.simulateNetworkConnectivity(false);

      when(mockAuthRepository.login(any, any)).thenAnswer(
        (_) async => const Left(NetworkFailure(
          message: 'No internet connection',
        )),
      );
      when(mockAuthRepository.checkAuthStatus()).thenAnswer(
        (_) async => const Right(null),
      );

      // Act - Launch app
      await tester.pumpWidget(const FSMApp());
      await tester.pumpAndSettle();

      // Wait for login page
      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('login_page')),
      );

      // Act - Attempt login without network
      await IntegrationTestHelpers.simulateLogin(tester);

      // Assert - Should show network error
      IntegrationTestHelpers.verifyErrorMessage('No internet connection');
      expect(find.byKey(const Key('login_page')), findsOneWidget);

      // Restore network and retry
      IntegrationTestHelpers.simulateNetworkConnectivity(true);

      final testUser = IntegrationTestHelpers.createTestUser();
      when(mockAuthRepository.login(any, any)).thenAnswer(
        (_) async => Right(testUser),
      );

      // Act - Retry login with network
      await tester.tap(find.byKey(const Key('login_button')));
      await tester.pumpAndSettle();

      // Assert - Should succeed and navigate to dashboard
      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('dashboard_page')),
      );
      expect(find.byKey(const Key('dashboard_page')), findsOneWidget);
    });

    testWidgets('Authentication flow - auto login with stored credentials',
        (tester) async {
      // Arrange - User already logged in
      final testUser = IntegrationTestHelpers.createTestUser();

      when(mockAuthRepository.checkAuthStatus()).thenAnswer(
        (_) async => Right(testUser),
      );

      // Act - Launch app
      await tester.pumpWidget(const FSMApp());
      await tester.pumpAndSettle();

      // Assert - Should show splash briefly then navigate directly to dashboard
      expect(find.byKey(const Key('splash_page')), findsOneWidget);

      // Wait for auto-navigation to dashboard
      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('dashboard_page')),
      );
      expect(find.byKey(const Key('dashboard_page')), findsOneWidget);

      // Verify auth check was called
      verify(mockAuthRepository.checkAuthStatus()).called(1);
    });

    testWidgets('Authentication flow - logout and return to login',
        (tester) async {
      // Arrange - Start with authenticated user
      final testUser = IntegrationTestHelpers.createTestUser();

      when(mockAuthRepository.checkAuthStatus()).thenAnswer(
        (_) async => Right(testUser),
      );
      when(mockAuthRepository.logout()).thenAnswer(
        (_) async => const Right(null),
      );

      // Act - Launch app (should auto-login)
      await tester.pumpWidget(const FSMApp());
      await tester.pumpAndSettle();

      // Wait for dashboard
      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('dashboard_page')),
      );

      // Act - Navigate to profile and logout
      await tester.tap(find.byKey(const Key('profile_tab')));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('logout_button')));
      await tester.pumpAndSettle();

      // Assert - Should return to login page
      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('login_page')),
      );
      expect(find.byKey(const Key('login_page')), findsOneWidget);

      // Verify logout was called
      verify(mockAuthRepository.logout()).called(1);
    });

    testWidgets('Authentication flow - token refresh during app usage',
        (tester) async {
      // Arrange
      final testUser = IntegrationTestHelpers.createTestUser();

      when(mockAuthRepository.checkAuthStatus()).thenAnswer(
        (_) async => Right(testUser),
      );
      when(mockAuthRepository.refreshToken()).thenAnswer(
        (_) async => Right(testUser),
      );

      // Act - Launch app
      await tester.pumpWidget(const FSMApp());
      await tester.pumpAndSettle();

      // Wait for dashboard
      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('dashboard_page')),
      );

      // Simulate token expiration during API call
      // This would typically be handled by the auth interceptor
      // For testing, we'll simulate the refresh token flow

      // Act - Trigger an action that would cause token refresh
      await tester.tap(find.byKey(const Key('refresh_button')));
      await tester.pumpAndSettle();

      // Assert - Should handle token refresh transparently
      expect(find.byKey(const Key('dashboard_page')), findsOneWidget);
      IntegrationTestHelpers.verifyNoLoadingIndicator();

      // Verify refresh token was called
      verify(mockAuthRepository.refreshToken()).called(1);
    });

    testWidgets('Authentication flow - session timeout and forced logout',
        (tester) async {
      // Arrange
      final testUser = IntegrationTestHelpers.createTestUser();

      when(mockAuthRepository.checkAuthStatus()).thenAnswer(
        (_) async => Right(testUser),
      );
      when(mockAuthRepository.refreshToken()).thenAnswer(
        (_) async => const Left(ServerFailure(
          message: 'Session expired',
          statusCode: 401,
        )),
      );

      // Act - Launch app
      await tester.pumpWidget(const FSMApp());
      await tester.pumpAndSettle();

      // Wait for dashboard
      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('dashboard_page')),
      );

      // Simulate session timeout during API call
      await tester.tap(find.byKey(const Key('refresh_button')));
      await tester.pumpAndSettle();

      // Assert - Should be forced back to login
      await IntegrationTestHelpers.waitForWidget(
        tester,
        find.byKey(const Key('login_page')),
      );
      expect(find.byKey(const Key('login_page')), findsOneWidget);

      // Should show session expired message
      IntegrationTestHelpers.verifyErrorMessage('Session expired');
    });
  });
}

/// Mock repository for testing
class MockAuthRepository extends Mock implements IAuthRepository {}
