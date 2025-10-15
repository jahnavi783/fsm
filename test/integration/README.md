# Integration Tests

This directory contains comprehensive integration tests for the FSM Mobile App that cover all critical user flows and ensure 100% coverage for end-to-end functionality.

## Test Coverage

### 1. Authentication Flow Integration Tests (`auth_flow_integration_test.dart`)
- Complete authentication flow - successful login
- Authentication flow - invalid credentials
- Authentication flow - network error during login
- Authentication flow - auto login with stored credentials
- Authentication flow - logout and return to login
- Authentication flow - token refresh during app usage
- Authentication flow - session timeout and forced logout

### 2. Work Order Lifecycle Integration Tests (`work_order_lifecycle_integration_test.dart`)
- Complete work order lifecycle - start to completion
- Work order lifecycle - pause and resume flow
- Work order lifecycle - GPS failure handling
- Work order lifecycle - offline mode handling
- Work order lifecycle - validation errors

### 3. Offline Functionality Integration Tests (`offline_functionality_integration_test.dart`)
- Offline mode - load cached work orders when network unavailable
- Offline mode - queue actions for later sync
- Offline to online transition - automatic sync
- Offline mode - access downloaded documents
- Offline mode - data freshness warnings
- Offline mode - sync conflict resolution
- Offline mode - storage management and cleanup
- Offline mode - background sync when app returns to foreground

### 4. Document Flow Integration Tests (`document_flow_integration_test.dart`)
- Complete document flow - browse, search, and view
- Document download flow - download and cache document
- Document download flow - download failure handling
- Document viewer - navigation and zoom controls
- Document filtering and categorization
- Document offline access and sync

### 5. Parts Inventory Integration Tests (`parts_inventory_integration_test.dart`)
- Complete parts inventory flow - browse, search, and update
- Inventory update flow - adjust stock levels
- Low stock management flow - alerts and reorder suggestions
- Parts filtering and categorization
- Inventory validation and error handling
- Offline inventory management and sync
- Parts usage tracking in work orders

## Running Integration Tests

### Run All Integration Tests
```bash
flutter test test/integration/integration_test_suite.dart
```

### Run Individual Test Files
```bash
# Authentication tests
flutter test test/integration/auth_flow_integration_test.dart

# Work order tests
flutter test test/integration/work_order_lifecycle_integration_test.dart

# Offline functionality tests
flutter test test/integration/offline_functionality_integration_test.dart

# Document flow tests
flutter test test/integration/document_flow_integration_test.dart

# Parts inventory tests
flutter test test/integration/parts_inventory_integration_test.dart
```

### Run with Coverage
```bash
flutter test --coverage test/integration/integration_test_suite.dart
genhtml coverage/lcov.info -o coverage/html
```

## Test Architecture

### Integration Test Helpers (`integration_test_helpers.dart`)
Provides utilities for:
- Test environment setup and teardown
- Mock service configuration
- Network connectivity simulation
- Location service simulation
- Test data creation
- Common test actions and assertions

### Mock Services
Each integration test uses mock implementations of:
- `NetworkInfo` - For connectivity simulation
- `LocationService` - For GPS simulation
- `Connectivity` - For network state changes
- Repository interfaces - For data layer testing

### Test Data
Standardized test entities are created for:
- User entities with different roles and permissions
- Work orders with various statuses and priorities
- Documents with different types and download states
- Parts with different stock levels and categories

## Test Scenarios Covered

### Critical User Journeys (100% Coverage)
1. **Technician Login → View Work Orders → Start Work Order → Complete Work Order**
2. **Technician Login → Browse Documents → Download Document → View Offline**
3. **Technician Login → Check Parts Inventory → Update Stock → Record Usage**
4. **Offline Mode → Queue Actions → Come Online → Auto Sync**
5. **Network Failure → Retry → Success**
6. **GPS Failure → Error Handling → Retry**
7. **Session Timeout → Force Logout → Re-login**

### Edge Cases and Error Scenarios
- Network connectivity issues
- GPS service failures
- Authentication token expiration
- Validation errors
- Sync conflicts
- Storage limitations
- Background app lifecycle

### Performance and Reliability
- App startup time
- Large data set handling
- Memory usage optimization
- Background sync efficiency
- Cache management

## Test Environment

### Prerequisites
- Flutter SDK
- Test dependencies (mockito, flutter_test)
- Temporary file system access for Hive testing

### Mock Configuration
- All external services are mocked
- Network conditions can be simulated
- GPS coordinates can be controlled
- Time-based scenarios can be tested

### Data Isolation
- Each test runs in isolation
- Temporary directories for Hive storage
- Clean state between tests
- No external API dependencies

## Continuous Integration

These integration tests are designed to run in CI/CD pipelines:
- No external dependencies
- Deterministic results
- Fast execution
- Comprehensive coverage reporting

## Maintenance

### Adding New Tests
1. Create test scenarios in appropriate test file
2. Use `IntegrationTestHelpers` for common operations
3. Follow existing naming conventions
4. Update this README with new test descriptions

### Updating Existing Tests
1. Maintain backward compatibility
2. Update mock configurations as needed
3. Ensure test isolation is preserved
4. Update documentation for any changes

## Troubleshooting

### Common Issues
- **Hive initialization errors**: Ensure proper cleanup in tearDown
- **Mock configuration conflicts**: Reset GetIt container between tests
- **Timeout issues**: Increase timeout values for slow operations
- **Widget not found**: Use `waitForWidget` helper for async operations

### Debug Tips
- Use `tester.pumpAndSettle()` after async operations
- Check mock configurations with `verify()` calls
- Use `find.byKey()` for reliable widget identification
- Enable verbose logging for detailed test output