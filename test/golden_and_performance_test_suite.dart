import 'package:flutter_test/flutter_test.dart';

// Golden Tests
import 'golden/widgets/auth_widgets_golden_test.dart' as auth_widgets_golden;
import 'golden/widgets/work_order_widgets_golden_test.dart'
    as work_order_widgets_golden;
import 'golden/widgets/core_widgets_golden_test.dart' as core_widgets_golden;
import 'golden/pages/auth_pages_golden_test.dart' as auth_pages_golden;
import 'golden/pages/dashboard_page_golden_test.dart' as dashboard_page_golden;

// Performance Tests
import 'performance/network_performance_test.dart' as network_performance;
import 'performance/load_test.dart' as load_test;

void main() {
  group('Golden Tests Suite', () {
    group('Widget Golden Tests', () {
      auth_widgets_golden.main();
      work_order_widgets_golden.main();
      core_widgets_golden.main();
    });

    group('Page Golden Tests', () {
      auth_pages_golden.main();
      dashboard_page_golden.main();
    });
  });

  group('Performance Tests Suite', () {
    network_performance.main();
    load_test.main();
  });
}
