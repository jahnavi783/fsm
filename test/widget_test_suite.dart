import 'package:flutter_test/flutter_test.dart';

// Auth Widget Tests
import 'features/auth/presentation/widgets/login_form_test.dart'
    as login_form_test;
import 'features/auth/presentation/widgets/gradient_elevated_button_test.dart'
    as gradient_button_test;
import 'features/auth/presentation/widgets/loading_circles_test.dart'
    as loading_circles_test;

// Auth Page Tests
import 'features/auth/presentation/pages/login_page_test.dart'
    as login_page_test;
import 'features/auth/presentation/pages/splash_page_test.dart'
    as splash_page_test;

// Work Orders Widget Tests
import 'features/work_orders/presentation/widgets/work_order_card_test.dart'
    as work_order_card_test;
import 'features/work_orders/presentation/widgets/work_order_status_chip_test.dart'
    as work_order_status_chip_test;
import 'features/work_orders/presentation/widgets/work_order_shimmer_test.dart'
    as work_order_shimmer_test;

// Work Orders Page Tests
import 'features/work_orders/presentation/pages/dashboard_page_test.dart'
    as dashboard_page_test;

// Documents Widget Tests
import 'features/documents/presentation/widgets/document_list_item_test.dart'
    as document_list_item_test;

// Core Widget Tests
import 'core/widgets/custom_button_test.dart' as custom_button_test;
import 'core/widgets/connectivity_indicator_test.dart'
    as connectivity_indicator_test;
import 'core/widgets/sync_indicator_test.dart' as sync_indicator_test;

void main() {
  group('FSM App Widget Test Suite', () {
    group('Authentication Feature Widget Tests', () {
      group('Auth Widgets', () {
        login_form_test.main();
        gradient_button_test.main();
        loading_circles_test.main();
      });

      group('Auth Pages', () {
        login_page_test.main();
        splash_page_test.main();
      });
    });

    group('Work Orders Feature Widget Tests', () {
      group('Work Order Widgets', () {
        work_order_card_test.main();
        work_order_status_chip_test.main();
        work_order_shimmer_test.main();
      });

      group('Work Order Pages', () {
        dashboard_page_test.main();
      });
    });

    group('Documents Feature Widget Tests', () {
      group('Document Widgets', () {
        document_list_item_test.main();
      });
    });

    group('Core Widget Tests', () {
      custom_button_test.main();
      connectivity_indicator_test.main();
      sync_indicator_test.main();
    });
  });
}
