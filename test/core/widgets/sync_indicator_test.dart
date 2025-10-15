import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../lib/core/blocs/sync/sync_bloc.dart';
import '../../../lib/core/blocs/sync/sync_event.dart';
import '../../../lib/core/blocs/sync/sync_state.dart';
import '../../../lib/core/widgets/sync_indicator.dart';
import '../../helpers/test_helpers.dart';

class MockSyncBloc extends Mock implements SyncBloc {}

void main() {
  group('SyncIndicator Widget Tests', () {
    late MockSyncBloc mockSyncBloc;

    setUp(() {
      mockSyncBloc = MockSyncBloc();
    });

    Widget createSyncIndicator({
      bool showWhenSynced = false,
      Duration animationDuration = const Duration(milliseconds: 300),
    }) {
      return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return BlocProvider<SyncBloc>.value(
            value: mockSyncBloc,
            child: TestHelpers.createTestWidget(
              SyncIndicator(
                showWhenSynced: showWhenSynced,
                animationDuration: animationDuration,
              ),
            ),
          );
        },
      );
    }

    testWidgets('should not show indicator in initial state', (tester) async {
      when(() => mockSyncBloc.state).thenReturn(const SyncState.initial());
      when(() => mockSyncBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([const SyncState.initial()]),
      );

      await tester.pumpWidget(createSyncIndicator());

      expect(find.byType(SyncIndicator), findsOneWidget);
      expect(find.byType(SizedBox), findsOneWidget); // SizedBox.shrink
    });

    testWidgets('should show syncing indicator during sync', (tester) async {
      when(() => mockSyncBloc.state).thenReturn(
        const SyncState.syncing(
            totalItems: 10, syncedItems: 5, currentItem: 'Test Item'),
      );
      when(() => mockSyncBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          const SyncState.syncing(
              totalItems: 10, syncedItems: 5, currentItem: 'Test Item'),
        ]),
      );

      await tester.pumpWidget(createSyncIndicator());
      await tester.pump();

      expect(find.text('Syncing... (5/10)'), findsOneWidget);
      expect(find.text('Test Item'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should show synced indicator when showWhenSynced is true',
        (tester) async {
      final lastSyncTime = DateTime.now();
      when(() => mockSyncBloc.state).thenReturn(
        SyncState.synced(lastSyncTime: lastSyncTime, syncedItems: 15),
      );
      when(() => mockSyncBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          SyncState.synced(lastSyncTime: lastSyncTime, syncedItems: 15),
        ]),
      );

      await tester.pumpWidget(createSyncIndicator(showWhenSynced: true));
      await tester.pump();

      expect(find.text('Synced (15 items)'), findsOneWidget);
      expect(find.byIcon(Icons.sync), findsOneWidget);
    });

    testWidgets('should not show synced indicator when showWhenSynced is false',
        (tester) async {
      final lastSyncTime = DateTime.now();
      when(() => mockSyncBloc.state).thenReturn(
        SyncState.synced(lastSyncTime: lastSyncTime, syncedItems: 15),
      );
      when(() => mockSyncBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          SyncState.synced(lastSyncTime: lastSyncTime, syncedItems: 15),
        ]),
      );

      await tester.pumpWidget(createSyncIndicator(showWhenSynced: false));
      await tester.pump();

      expect(find.byType(SizedBox), findsOneWidget); // SizedBox.shrink
      expect(find.text('Synced (15 items)'), findsNothing);
    });

    testWidgets('should show sync failed indicator', (tester) async {
      final failedAt = DateTime.now();
      when(() => mockSyncBloc.state).thenReturn(
        SyncState.syncFailed(
          error: 'Network error',
          failedAt: failedAt,
          pendingItems: 3,
        ),
      );
      when(() => mockSyncBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          SyncState.syncFailed(
            error: 'Network error',
            failedAt: failedAt,
            pendingItems: 3,
          ),
        ]),
      );

      await tester.pumpWidget(createSyncIndicator());
      await tester.pump();

      expect(find.text('Sync failed (3 pending)'), findsOneWidget);
      expect(find.byIcon(Icons.sync_problem), findsOneWidget);
      expect(find.byIcon(Icons.refresh), findsOneWidget);
    });

    testWidgets(
        'should trigger sync retry when refresh button is tapped in failed state',
        (tester) async {
      final failedAt = DateTime.now();
      when(() => mockSyncBloc.state).thenReturn(
        SyncState.syncFailed(
          error: 'Network error',
          failedAt: failedAt,
          pendingItems: 3,
        ),
      );
      when(() => mockSyncBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          SyncState.syncFailed(
            error: 'Network error',
            failedAt: failedAt,
            pendingItems: 3,
          ),
        ]),
      );

      await tester.pumpWidget(createSyncIndicator());
      await tester.pump();

      await tester.tap(find.byIcon(Icons.refresh));
      await tester.pumpAndSettle();

      verify(() => mockSyncBloc.add(const SyncEvent.syncRequested())).called(1);
    });

    testWidgets('should show pending sync indicator', (tester) async {
      final lastSyncTime = DateTime.now();
      when(() => mockSyncBloc.state).thenReturn(
        SyncState.pendingSync(pendingItems: 7, lastSyncTime: lastSyncTime),
      );
      when(() => mockSyncBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          SyncState.pendingSync(pendingItems: 7, lastSyncTime: lastSyncTime),
        ]),
      );

      await tester.pumpWidget(createSyncIndicator());
      await tester.pump();

      expect(find.text('7 items to sync'), findsOneWidget);
      expect(find.byIcon(Icons.sync_alt), findsOneWidget);
      expect(find.byIcon(Icons.sync), findsOneWidget);
    });

    testWidgets(
        'should trigger sync when sync button is tapped in pending state',
        (tester) async {
      final lastSyncTime = DateTime.now();
      when(() => mockSyncBloc.state).thenReturn(
        SyncState.pendingSync(pendingItems: 7, lastSyncTime: lastSyncTime),
      );
      when(() => mockSyncBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          SyncState.pendingSync(pendingItems: 7, lastSyncTime: lastSyncTime),
        ]),
      );

      await tester.pumpWidget(createSyncIndicator());
      await tester.pump();

      await tester.tap(find.byIcon(Icons.sync));
      await tester.pumpAndSettle();

      verify(() => mockSyncBloc.add(const SyncEvent.syncRequested())).called(1);
    });

    testWidgets('should animate between states', (tester) async {
      when(() => mockSyncBloc.state).thenReturn(const SyncState.initial());
      when(() => mockSyncBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          const SyncState.initial(),
          const SyncState.syncing(
              totalItems: 5, syncedItems: 2, currentItem: null),
        ]),
      );

      await tester.pumpWidget(createSyncIndicator());

      expect(find.byType(AnimatedSwitcher), findsOneWidget);

      // Trigger state change
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 150)); // Half animation

      expect(find.byType(SyncIndicator), findsOneWidget);
    });

    testWidgets('should show progress in syncing indicator', (tester) async {
      when(() => mockSyncBloc.state).thenReturn(
        const SyncState.syncing(
            totalItems: 10, syncedItems: 3, currentItem: null),
      );
      when(() => mockSyncBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          const SyncState.syncing(
              totalItems: 10, syncedItems: 3, currentItem: null),
        ]),
      );

      await tester.pumpWidget(createSyncIndicator());
      await tester.pump();

      final progressIndicator = tester.widget<CircularProgressIndicator>(
        find.byType(CircularProgressIndicator),
      );
      expect(progressIndicator.value, equals(0.3)); // 3/10
    });

    testWidgets('should handle zero total items in syncing state',
        (tester) async {
      when(() => mockSyncBloc.state).thenReturn(
        const SyncState.syncing(
            totalItems: 0, syncedItems: 0, currentItem: null),
      );
      when(() => mockSyncBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          const SyncState.syncing(
              totalItems: 0, syncedItems: 0, currentItem: null),
        ]),
      );

      await tester.pumpWidget(createSyncIndicator());
      await tester.pump();

      final progressIndicator = tester.widget<CircularProgressIndicator>(
        find.byType(CircularProgressIndicator),
      );
      expect(progressIndicator.value, equals(0.0));
    });

    testWidgets('should be responsive to screen size', (tester) async {
      when(() => mockSyncBloc.state).thenReturn(
        const SyncState.syncing(
            totalItems: 5, syncedItems: 2, currentItem: 'Test'),
      );
      when(() => mockSyncBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          const SyncState.syncing(
              totalItems: 5, syncedItems: 2, currentItem: 'Test'),
        ]),
      );

      // Test with different screen sizes
      await tester.binding
          .setSurfaceSize(const Size(375, 812)); // iPhone 11 Pro
      await tester.pumpWidget(createSyncIndicator());
      await tester.pump();

      expect(find.byType(SyncIndicator), findsOneWidget);

      // Test with tablet size
      await tester.binding.setSurfaceSize(const Size(768, 1024)); // iPad
      await tester.pumpWidget(createSyncIndicator());
      await tester.pump();

      expect(find.byType(SyncIndicator), findsOneWidget);

      // Reset to default size
      await tester.binding.setSurfaceSize(const Size(800, 600));
    });
  });

  group('SyncFloatingActionButton Widget Tests', () {
    late MockSyncBloc mockSyncBloc;

    setUp(() {
      mockSyncBloc = MockSyncBloc();
    });

    Widget createSyncFAB() {
      return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return BlocProvider<SyncBloc>.value(
            value: mockSyncBloc,
            child: TestHelpers.createTestWidget(
              const SyncFloatingActionButton(),
            ),
          );
        },
      );
    }

    testWidgets('should not show FAB in initial state', (tester) async {
      when(() => mockSyncBloc.state).thenReturn(const SyncState.initial());
      when(() => mockSyncBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([const SyncState.initial()]),
      );

      await tester.pumpWidget(createSyncFAB());

      expect(find.byType(SizedBox), findsOneWidget); // SizedBox.shrink
      expect(find.byType(FloatingActionButton), findsNothing);
    });

    testWidgets('should show disabled FAB during sync', (tester) async {
      when(() => mockSyncBloc.state).thenReturn(
        const SyncState.syncing(
            totalItems: 5, syncedItems: 2, currentItem: null),
      );
      when(() => mockSyncBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          const SyncState.syncing(
              totalItems: 5, syncedItems: 2, currentItem: null),
        ]),
      );

      await tester.pumpWidget(createSyncFAB());
      await tester.pump();

      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      final fab = tester
          .widget<FloatingActionButton>(find.byType(FloatingActionButton));
      expect(fab.onPressed, isNull); // Should be disabled
    });

    testWidgets('should not show FAB when synced', (tester) async {
      final lastSyncTime = DateTime.now();
      when(() => mockSyncBloc.state).thenReturn(
        SyncState.synced(lastSyncTime: lastSyncTime, syncedItems: 10),
      );
      when(() => mockSyncBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          SyncState.synced(lastSyncTime: lastSyncTime, syncedItems: 10),
        ]),
      );

      await tester.pumpWidget(createSyncFAB());
      await tester.pump();

      expect(find.byType(SizedBox), findsOneWidget); // SizedBox.shrink
      expect(find.byType(FloatingActionButton), findsNothing);
    });

    testWidgets('should show error FAB when sync failed', (tester) async {
      final failedAt = DateTime.now();
      when(() => mockSyncBloc.state).thenReturn(
        SyncState.syncFailed(
          error: 'Network error',
          failedAt: failedAt,
          pendingItems: 3,
        ),
      );
      when(() => mockSyncBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          SyncState.syncFailed(
            error: 'Network error',
            failedAt: failedAt,
            pendingItems: 3,
          ),
        ]),
      );

      await tester.pumpWidget(createSyncFAB());
      await tester.pump();

      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.byIcon(Icons.sync_problem), findsOneWidget);
    });

    testWidgets('should trigger sync when error FAB is tapped', (tester) async {
      final failedAt = DateTime.now();
      when(() => mockSyncBloc.state).thenReturn(
        SyncState.syncFailed(
          error: 'Network error',
          failedAt: failedAt,
          pendingItems: 3,
        ),
      );
      when(() => mockSyncBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          SyncState.syncFailed(
            error: 'Network error',
            failedAt: failedAt,
            pendingItems: 3,
          ),
        ]),
      );

      await tester.pumpWidget(createSyncFAB());
      await tester.pump();

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      verify(() => mockSyncBloc.add(const SyncEvent.syncRequested())).called(1);
    });

    testWidgets('should show pending sync FAB with badge', (tester) async {
      final lastSyncTime = DateTime.now();
      when(() => mockSyncBloc.state).thenReturn(
        SyncState.pendingSync(pendingItems: 5, lastSyncTime: lastSyncTime),
      );
      when(() => mockSyncBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          SyncState.pendingSync(pendingItems: 5, lastSyncTime: lastSyncTime),
        ]),
      );

      await tester.pumpWidget(createSyncFAB());
      await tester.pump();

      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.byType(Badge), findsOneWidget);
      expect(find.text('5'), findsOneWidget);
      expect(find.byIcon(Icons.sync), findsOneWidget);
    });

    testWidgets('should trigger sync when pending FAB is tapped',
        (tester) async {
      final lastSyncTime = DateTime.now();
      when(() => mockSyncBloc.state).thenReturn(
        SyncState.pendingSync(pendingItems: 5, lastSyncTime: lastSyncTime),
      );
      when(() => mockSyncBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          SyncState.pendingSync(pendingItems: 5, lastSyncTime: lastSyncTime),
        ]),
      );

      await tester.pumpWidget(createSyncFAB());
      await tester.pump();

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      verify(() => mockSyncBloc.add(const SyncEvent.syncRequested())).called(1);
    });
  });
}
