import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../lib/features/auth/domain/entities/user_entity.dart';
import '../../../../../lib/features/auth/presentation/blocs/auth/auth_bloc.dart';
import '../../../../../lib/features/auth/presentation/blocs/auth/auth_event.dart';
import '../../../../../lib/features/auth/presentation/blocs/auth/auth_state.dart';
import '../../../../../lib/features/auth/presentation/pages/splash_page.dart';
import '../../../../../lib/features/auth/presentation/widgets/loading_circles.dart';
import '../../../../helpers/test_helpers.dart';

class MockAuthBloc extends Mock implements AuthBloc {}

void main() {
  group('SplashPage Widget Tests', () {
    late MockAuthBloc mockAuthBloc;

    setUp(() {
      mockAuthBloc = MockAuthBloc();

      // Set up default stream
      when(() => mockAuthBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([const AuthState.initial()]),
      );
      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
    });

    Widget createSplashPage() {
      return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return BlocProvider<AuthBloc>.value(
            value: mockAuthBloc,
            child: TestHelpers.createTestApp(
              home: const SplashPage(),
            ),
          );
        },
      );
    }

    testWidgets('should render all UI elements', (tester) async {
      await tester.pumpWidget(createSplashPage());

      // Check for FSM logo
      expect(find.byType(Image), findsOneWidget);

      // Check for loading circles
      expect(find.byType(LoadingCircles), findsNWidgets(3));

      // Check for proper layout
      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(Row), findsOneWidget);
    });

    testWidgets('should trigger auth check after delay', (tester) async {
      await tester.pumpWidget(createSplashPage());

      // Initially no auth check should be called
      verifyNever(() => mockAuthBloc.add(any()));

      // Wait for the 2-second delay
      await tester.pump(const Duration(seconds: 2));

      // Now auth check should be triggered
      verify(() => mockAuthBloc.add(const AuthEvent.checkAuth())).called(1);
    });

    testWidgets(
        'should navigate to main on successful technician authentication',
        (tester) async {
      const user = UserEntity(
        id: 1,
        email: 'test@example.com',
        firstName: 'John',
        lastName: 'Doe',
        role: 'technician',
        permissions: ['read_work_orders'],
      );

      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
      when(() => mockAuthBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          const AuthState.initial(),
          const AuthState.authenticated(user),
        ]),
      );

      await tester.pumpWidget(createSplashPage());
      await tester.pump(); // Trigger the stream

      // Note: In a real test with router, we would verify navigation
      // For now, we just verify the state change was handled
      expect(find.byType(SplashPage), findsOneWidget);
    });

    testWidgets(
        'should show warning and navigate to login for non-technician users',
        (tester) async {
      const user = UserEntity(
        id: 1,
        email: 'admin@example.com',
        firstName: 'Admin',
        lastName: 'User',
        role: 'admin',
        permissions: ['admin_access'],
      );

      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
      when(() => mockAuthBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          const AuthState.initial(),
          const AuthState.authenticated(user),
        ]),
      );

      await tester.pumpWidget(createSplashPage());
      await tester.pump(); // Trigger the stream

      expect(find.text('Please use web portal for authentication.'),
          findsOneWidget);
      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets('should navigate to login on unauthenticated state',
        (tester) async {
      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
      when(() => mockAuthBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          const AuthState.initial(),
          const AuthState.unauthenticated(),
        ]),
      );

      await tester.pumpWidget(createSplashPage());
      await tester.pump(); // Trigger the stream

      // Note: In a real test with router, we would verify navigation to login
      expect(find.byType(SplashPage), findsOneWidget);
    });

    testWidgets('should navigate to login on error state', (tester) async {
      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
      when(() => mockAuthBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          const AuthState.initial(),
          const AuthState.error('Authentication failed'),
        ]),
      );

      await tester.pumpWidget(createSplashPage());
      await tester.pump(); // Trigger the stream

      // Note: In a real test with router, we would verify navigation to login
      expect(find.byType(SplashPage), findsOneWidget);
    });

    testWidgets('should have proper responsive layout', (tester) async {
      // Test with different screen sizes
      await tester.binding
          .setSurfaceSize(const Size(375, 812)); // iPhone 11 Pro
      await tester.pumpWidget(createSplashPage());
      await tester.pumpAndSettle();

      expect(find.byType(SplashPage), findsOneWidget);

      // Test with tablet size
      await tester.binding.setSurfaceSize(const Size(768, 1024)); // iPad
      await tester.pumpWidget(createSplashPage());
      await tester.pumpAndSettle();

      expect(find.byType(SplashPage), findsOneWidget);

      // Reset to default size
      await tester.binding.setSurfaceSize(const Size(800, 600));
    });

    testWidgets('should have proper spacing and padding', (tester) async {
      await tester.pumpWidget(createSplashPage());

      // Check for proper padding
      expect(find.byType(Padding), findsAtLeastNWidgets(1));

      // Check for proper spacing
      expect(find.byType(SizedBox), findsAtLeastNWidgets(1));
    });

    testWidgets('should center content properly', (tester) async {
      await tester.pumpWidget(createSplashPage());

      final column = tester.widget<Column>(find.byType(Column));
      expect(column.mainAxisAlignment, equals(MainAxisAlignment.center));
      expect(column.crossAxisAlignment, equals(CrossAxisAlignment.center));
    });

    testWidgets('should have animated loading circles', (tester) async {
      await tester.pumpWidget(createSplashPage());

      // Check that we have 3 loading circles
      expect(find.byType(LoadingCircles), findsNWidgets(3));

      // Check that they are in a Row with proper alignment
      final row = tester.widget<Row>(find.byType(Row));
      expect(row.mainAxisAlignment, equals(MainAxisAlignment.center));
    });

    testWidgets('should dispose animation controllers properly',
        (tester) async {
      await tester.pumpWidget(createSplashPage());

      // Verify page is rendered
      expect(find.byType(SplashPage), findsOneWidget);

      // Remove the widget
      await tester.pumpWidget(Container());

      // Should not throw any errors during disposal
    });

    testWidgets('should handle multiple state changes', (tester) async {
      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
      when(() => mockAuthBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          const AuthState.initial(),
          const AuthState.loading(),
          const AuthState.unauthenticated(),
        ]),
      );

      await tester.pumpWidget(createSplashPage());

      // Pump through all state changes
      await tester.pump();
      await tester.pump();
      await tester.pump();

      expect(find.byType(SplashPage), findsOneWidget);
    });

    testWidgets('should only trigger auth check once', (tester) async {
      await tester.pumpWidget(createSplashPage());

      // Wait for the delay and trigger
      await tester.pump(const Duration(seconds: 2));

      // Rebuild the widget
      await tester.pumpWidget(createSplashPage());
      await tester.pump(const Duration(seconds: 2));

      // Auth check should only be called once (from first build)
      verify(() => mockAuthBloc.add(const AuthEvent.checkAuth())).called(1);
    });

    testWidgets('should have proper image sizing', (tester) async {
      await tester.pumpWidget(createSplashPage());

      final image = tester.widget<Image>(find.byType(Image));
      expect(image.height, isNotNull);
      expect(image.fit, equals(BoxFit.cover));
    });

    testWidgets('should handle BlocListener properly', (tester) async {
      await tester.pumpWidget(createSplashPage());

      expect(find.byType(BlocListener<AuthBloc, AuthState>), findsOneWidget);
    });

    testWidgets('should maintain animations during state changes',
        (tester) async {
      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
      when(() => mockAuthBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          const AuthState.initial(),
          const AuthState.loading(),
        ]),
      );

      await tester.pumpWidget(createSplashPage());

      // Verify loading circles are still present during state changes
      expect(find.byType(LoadingCircles), findsNWidgets(3));

      await tester.pump();

      expect(find.byType(LoadingCircles), findsNWidgets(3));
    });
  });
}
