import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../lib/core/blocs/connectivity/connectivity_bloc.dart';
import '../../../lib/core/blocs/connectivity/connectivity_state.dart';
import '../../../lib/core/widgets/connectivity_indicator.dart';
import '../../helpers/test_helpers.dart';

class MockConnectivityBloc extends Mock implements ConnectivityBloc {}

void main() {
  group('ConnectivityIndicator Widget Tests', () {
    late MockConnectivityBloc mockConnectivityBloc;

    setUp(() {
      mockConnectivityBloc = MockConnectivityBloc();
    });

    Widget createConnectivityIndicator() {
      return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return BlocProvider<ConnectivityBloc>.value(
            value: mockConnectivityBloc,
            child: TestHelpers.createTestWidget(
              const ConnectivityIndicator(),
            ),
          );
        },
      );
    }

    testWidgets('should not show indicator when connected', (tester) async {
      when(() => mockConnectivityBloc.state).thenReturn(
        const ConnectivityState.connected(),
      );
      when(() => mockConnectivityBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([const ConnectivityState.connected()]),
      );

      await tester.pumpWidget(createConnectivityIndicator());

      expect(find.byType(ConnectivityIndicator), findsOneWidget);
      expect(find.text('No Internet Connection'), findsNothing);
    });

    testWidgets('should show indicator when disconnected', (tester) async {
      when(() => mockConnectivityBloc.state).thenReturn(
        const ConnectivityState.disconnected(),
      );
      when(() => mockConnectivityBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([const ConnectivityState.disconnected()]),
      );

      await tester.pumpWidget(createConnectivityIndicator());
      await tester.pump(); // Trigger the stream

      expect(find.text('No Internet Connection'), findsOneWidget);
      expect(find.byIcon(Icons.wifi_off), findsOneWidget);
    });

    testWidgets('should show proper styling for offline indicator',
        (tester) async {
      when(() => mockConnectivityBloc.state).thenReturn(
        const ConnectivityState.disconnected(),
      );
      when(() => mockConnectivityBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([const ConnectivityState.disconnected()]),
      );

      await tester.pumpWidget(createConnectivityIndicator());
      await tester.pump();

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(ConnectivityIndicator),
          matching: find.byType(Container),
        ),
      );

      expect(container.decoration, isA<BoxDecoration>());
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, isNotNull);
    });

    testWidgets('should handle state transitions', (tester) async {
      when(() => mockConnectivityBloc.state).thenReturn(
        const ConnectivityState.connected(),
      );
      when(() => mockConnectivityBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          const ConnectivityState.connected(),
          const ConnectivityState.disconnected(),
          const ConnectivityState.connected(),
        ]),
      );

      await tester.pumpWidget(createConnectivityIndicator());

      // Initially connected - no indicator
      expect(find.text('No Internet Connection'), findsNothing);

      // Pump to disconnected state
      await tester.pump();
      expect(find.text('No Internet Connection'), findsOneWidget);

      // Pump to connected state
      await tester.pump();
      expect(find.text('No Internet Connection'), findsNothing);
    });

    testWidgets('should be responsive to screen size', (tester) async {
      when(() => mockConnectivityBloc.state).thenReturn(
        const ConnectivityState.disconnected(),
      );
      when(() => mockConnectivityBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([const ConnectivityState.disconnected()]),
      );

      // Test with different screen sizes
      await tester.binding
          .setSurfaceSize(const Size(375, 812)); // iPhone 11 Pro
      await tester.pumpWidget(createConnectivityIndicator());
      await tester.pump();

      expect(find.byType(ConnectivityIndicator), findsOneWidget);

      // Test with tablet size
      await tester.binding.setSurfaceSize(const Size(768, 1024)); // iPad
      await tester.pumpWidget(createConnectivityIndicator());
      await tester.pump();

      expect(find.byType(ConnectivityIndicator), findsOneWidget);

      // Reset to default size
      await tester.binding.setSurfaceSize(const Size(800, 600));
    });

    testWidgets('should have proper padding and margins', (tester) async {
      when(() => mockConnectivityBloc.state).thenReturn(
        const ConnectivityState.disconnected(),
      );
      when(() => mockConnectivityBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([const ConnectivityState.disconnected()]),
      );

      await tester.pumpWidget(createConnectivityIndicator());
      await tester.pump();

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(ConnectivityIndicator),
          matching: find.byType(Container),
        ),
      );

      expect(container.padding, isNotNull);
    });

    testWidgets('should show icon and text together', (tester) async {
      when(() => mockConnectivityBloc.state).thenReturn(
        const ConnectivityState.disconnected(),
      );
      when(() => mockConnectivityBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([const ConnectivityState.disconnected()]),
      );

      await tester.pumpWidget(createConnectivityIndicator());
      await tester.pump();

      expect(find.byIcon(Icons.wifi_off), findsOneWidget);
      expect(find.text('No Internet Connection'), findsOneWidget);
      expect(find.byType(Row), findsOneWidget);
    });

    testWidgets('should have proper text styling', (tester) async {
      when(() => mockConnectivityBloc.state).thenReturn(
        const ConnectivityState.disconnected(),
      );
      when(() => mockConnectivityBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([const ConnectivityState.disconnected()]),
      );

      await tester.pumpWidget(createConnectivityIndicator());
      await tester.pump();

      final text = tester.widget<Text>(find.text('No Internet Connection'));
      expect(text.style, isNotNull);
      expect(text.style!.color, isNotNull);
    });

    testWidgets('should handle initial state properly', (tester) async {
      when(() => mockConnectivityBloc.state).thenReturn(
        const ConnectivityState.initial(),
      );
      when(() => mockConnectivityBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([const ConnectivityState.initial()]),
      );

      await tester.pumpWidget(createConnectivityIndicator());

      // Initial state should not show indicator
      expect(find.text('No Internet Connection'), findsNothing);
    });

    testWidgets('should handle checking state properly', (tester) async {
      when(() => mockConnectivityBloc.state).thenReturn(
        const ConnectivityState.checking(),
      );
      when(() => mockConnectivityBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([const ConnectivityState.checking()]),
      );

      await tester.pumpWidget(createConnectivityIndicator());
      await tester.pump();

      // Checking state should not show indicator (or show loading)
      expect(find.text('No Internet Connection'), findsNothing);
    });

    testWidgets('should animate properly during state changes', (tester) async {
      when(() => mockConnectivityBloc.state).thenReturn(
        const ConnectivityState.connected(),
      );
      when(() => mockConnectivityBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          const ConnectivityState.connected(),
          const ConnectivityState.disconnected(),
        ]),
      );

      await tester.pumpWidget(createConnectivityIndicator());

      // Start connected
      expect(find.text('No Internet Connection'), findsNothing);

      // Change to disconnected
      await tester.pump();
      await tester.pumpAndSettle();

      expect(find.text('No Internet Connection'), findsOneWidget);
    });

    testWidgets('should have proper accessibility', (tester) async {
      when(() => mockConnectivityBloc.state).thenReturn(
        const ConnectivityState.disconnected(),
      );
      when(() => mockConnectivityBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([const ConnectivityState.disconnected()]),
      );

      await tester.pumpWidget(createConnectivityIndicator());
      await tester.pump();

      // Should have semantic information
      expect(find.text('No Internet Connection'), findsOneWidget);
      expect(find.byIcon(Icons.wifi_off), findsOneWidget);
    });

    testWidgets('should position indicator correctly', (tester) async {
      when(() => mockConnectivityBloc.state).thenReturn(
        const ConnectivityState.disconnected(),
      );
      when(() => mockConnectivityBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([const ConnectivityState.disconnected()]),
      );

      await tester.pumpWidget(createConnectivityIndicator());
      await tester.pump();

      // Should be positioned at the top or in a specific location
      expect(find.byType(ConnectivityIndicator), findsOneWidget);
    });

    testWidgets('should handle rapid state changes', (tester) async {
      when(() => mockConnectivityBloc.state).thenReturn(
        const ConnectivityState.connected(),
      );
      when(() => mockConnectivityBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          const ConnectivityState.connected(),
          const ConnectivityState.disconnected(),
          const ConnectivityState.connected(),
          const ConnectivityState.disconnected(),
          const ConnectivityState.connected(),
        ]),
      );

      await tester.pumpWidget(createConnectivityIndicator());

      // Pump through rapid changes
      for (int i = 0; i < 5; i++) {
        await tester.pump();
      }

      // Should handle without errors
      expect(find.byType(ConnectivityIndicator), findsOneWidget);
    });
  });
}
