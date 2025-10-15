import 'package:flutter_test/flutter_test.dart';

// Import all work orders test files
import 'domain/usecases/get_work_orders_usecase_test.dart'
    as get_work_orders_usecase_test;
import 'domain/usecases/start_work_order_usecase_test.dart'
    as start_work_order_usecase_test;
import 'presentation/blocs/work_order_action/work_order_action_bloc_test.dart'
    as work_order_action_bloc_test;
import 'presentation/blocs/work_orders_list/work_orders_list_bloc_test.dart'
    as work_orders_list_bloc_test;

/// Test suite for all work orders feature tests
///
/// This file groups all work orders-related tests together for easy execution.
/// Run with: flutter test test/features/work_orders/work_orders_test_suite.dart
void main() {
  group('Work Orders Feature Tests', () {
    group('Domain Layer', () {
      group('Use Cases', () {
        get_work_orders_usecase_test.main();
        start_work_order_usecase_test.main();
      });
    });

    group('Presentation Layer', () {
      group('BLoCs', () {
        work_orders_list_bloc_test.main();
        work_order_action_bloc_test.main();
      });
    });
  });
}
