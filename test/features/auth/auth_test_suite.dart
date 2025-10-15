import 'package:flutter_test/flutter_test.dart';

// Import all auth test files
import 'data/datasources/auth_local_datasource_test.dart'
    as auth_local_datasource_test;
import 'data/datasources/auth_remote_datasource_test.dart'
    as auth_remote_datasource_test;
import 'data/repositories/auth_repository_impl_test.dart'
    as auth_repository_impl_test;
import 'domain/usecases/check_auth_usecase_test.dart'
    as check_auth_usecase_test;
import 'domain/usecases/login_usecase_test.dart' as login_usecase_test;
import 'domain/usecases/logout_usecase_test.dart' as logout_usecase_test;
import 'domain/usecases/refresh_token_usecase_test.dart'
    as refresh_token_usecase_test;
import 'presentation/blocs/auth/auth_bloc_test.dart' as auth_bloc_test;

/// Test suite for all authentication feature tests
///
/// This file groups all authentication-related tests together for easy execution.
/// Run with: flutter test test/features/auth/auth_test_suite.dart
void main() {
  group('Authentication Feature Tests', () {
    group('Domain Layer', () {
      group('Use Cases', () {
        login_usecase_test.main();
        logout_usecase_test.main();
        check_auth_usecase_test.main();
        refresh_token_usecase_test.main();
      });
    });

    group('Data Layer', () {
      group('Repositories', () {
        auth_repository_impl_test.main();
      });

      group('Data Sources', () {
        auth_remote_datasource_test.main();
        auth_local_datasource_test.main();
      });
    });

    group('Presentation Layer', () {
      group('BLoCs', () {
        auth_bloc_test.main();
      });
    });
  });
}
