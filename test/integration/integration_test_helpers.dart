import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:location/location.dart';

import '../../lib/core/di/injection.dart';
import '../../lib/core/storage/hive_service.dart';
import '../../lib/core/network/network_info.dart';
import '../../lib/core/services/location_service.dart';
import '../../lib/features/auth/domain/entities/user_entity.dart';
import '../../lib/features/work_orders/domain/entities/work_order_entity.dart';
import '../../lib/features/documents/domain/entities/document_entity.dart';
import '../../lib/features/parts/domain/entities/part_entity.dart';

/// Integration test helpers for FSM app
class IntegrationTestHelpers {
  static late Directory tempDir;
  static late MockNetworkInfo mockNetworkInfo;
  static late MockLocationService mockLocationService;
  static late MockConnectivity mockConnectivity;

  /// Setup integration test environment
  static Future<void> setupIntegrationTest() async {
    // Create temporary directory for Hive
    tempDir = await Directory.systemTemp.createTemp('fsm_integration_test');

    // Initialize Hive with temp directory
    Hive.init(tempDir.path);

    // Reset GetIt
    if (GetIt.instance.isRegistered<GetIt>()) {
      GetIt.instance.reset();
    }

    // Setup mocks
    mockNetworkInfo = MockNetworkInfo();
    mockLocationService = MockLocationService();
    mockConnectivity = MockConnectivity();

    // Configure default mock behaviors
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    when(mockLocationService.getCurrentPosition()).thenAnswer(
      (_) async => const LocationData(
        latitude: 37.7749,
        longitude: -122.4194,
        accuracy: 5.0,
        timestamp: 1234567890,
      ),
    );
    when(mockConnectivity.checkConnectivity()).thenAnswer(
      (_) async => ConnectivityResult.wifi,
    );

    // Initialize dependency injection with mocks
    await _configureMockDependencies();
  }

  /// Configure mock dependencies for testing
  static Future<void> _configureMockDependencies() async {
    // Register core services
    GetIt.instance.registerSingleton<NetworkInfo>(mockNetworkInfo);
    GetIt.instance.registerSingleton<LocationService>(mockLocationService);
    GetIt.instance.registerSingleton<Connectivity>(mockConnectivity);

    // Initialize Hive service
    final hiveService = HiveService();
    await hiveService.init();
    GetIt.instance.registerSingleton<HiveService>(hiveService);

    // Configure other dependencies as needed
    await configureDependencies();
  }

  /// Cleanup integration test environment
  static Future<void> tearDownIntegrationTest() async {
    await Hive.close();
    if (tempDir.existsSync()) {
      await tempDir.delete(recursive: true);
    }
    GetIt.instance.reset();
  }

  /// Simulate network connectivity
  static void simulateNetworkConnectivity(bool isConnected) {
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => isConnected);
    when(mockConnectivity.checkConnectivity()).thenAnswer(
      (_) async =>
          isConnected ? ConnectivityResult.wifi : ConnectivityResult.none,
    );
  }

  /// Simulate location services
  static void simulateLocationService({
    double? latitude,
    double? longitude,
    double? accuracy,
    bool shouldThrow = false,
  }) {
    if (shouldThrow) {
      when(mockLocationService.getCurrentPosition()).thenThrow(
        Exception('Location service unavailable'),
      );
    } else {
      when(mockLocationService.getCurrentPosition()).thenAnswer(
        (_) async => LocationData(
          latitude: latitude ?? 37.7749,
          longitude: longitude ?? -122.4194,
          accuracy: accuracy ?? 5.0,
          timestamp: DateTime.now().millisecondsSinceEpoch,
        ),
      );
    }
  }

  /// Create test user entity
  static UserEntity createTestUser({
    int id = 1,
    String email = 'test@example.com',
    String firstName = 'John',
    String lastName = 'Doe',
    String role = 'technician',
  }) {
    return UserEntity(
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
      role: role,
      permissions: ['work_orders:read', 'work_orders:write'],
    );
  }

  /// Create test work order entity
  static WorkOrderEntity createTestWorkOrder({
    int id = 1,
    String woNumber = 'WO-001',
    WorkOrderStatus status = WorkOrderStatus.assigned,
    WorkOrderPriority priority = WorkOrderPriority.medium,
  }) {
    return WorkOrderEntity(
      id: id,
      woNumber: woNumber,
      summary: 'Test Work Order',
      description: 'Test work order description',
      status: status,
      priority: priority,
      visitDate: DateTime.now().add(const Duration(hours: 2)),
      customer: createTestCustomer(),
      location: createTestLocation(),
      requiredSkills: ['electrical', 'plumbing'],
      requiredParts: [createTestPart()],
    );
  }

  /// Create test customer entity
  static CustomerEntity createTestCustomer({
    int id = 1,
    String name = 'Test Customer',
  }) {
    return CustomerEntity(
      id: id,
      name: name,
      email: 'customer@example.com',
      phone: '+1234567890',
      address: '123 Test St, Test City, TC 12345',
    );
  }

  /// Create test location entity
  static LocationEntity createTestLocation({
    double latitude = 37.7749,
    double longitude = -122.4194,
  }) {
    return LocationEntity(
      latitude: latitude,
      longitude: longitude,
      address: '123 Test St, Test City, TC 12345',
      city: 'Test City',
      state: 'TC',
      zipCode: '12345',
    );
  }

  /// Create test document entity
  static DocumentEntity createTestDocument({
    int id = 1,
    String title = 'Test Document',
    DocumentType type = DocumentType.manual,
  }) {
    return DocumentEntity(
      id: id,
      title: title,
      description: 'Test document description',
      type: type,
      fileUrl: 'https://example.com/document.pdf',
      fileName: 'document.pdf',
      fileSize: 1024000,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      updatedAt: DateTime.now(),
      tags: ['test', 'manual'],
      categories: ['equipment'],
    );
  }

  /// Create test part entity
  static PartEntity createTestPart({
    int id = 1,
    String partNumber = 'PART-001',
    int stockQuantity = 10,
  }) {
    return PartEntity(
      id: id,
      partNumber: partNumber,
      name: 'Test Part',
      description: 'Test part description',
      category: 'electrical',
      price: 25.99,
      stockQuantity: stockQuantity,
      unit: 'each',
      compatibleModels: ['Model A', 'Model B'],
    );
  }

  /// Wait for specific widget to appear
  static Future<void> waitForWidget(
    WidgetTester tester,
    Finder finder, {
    Duration timeout = const Duration(seconds: 10),
  }) async {
    final stopwatch = Stopwatch()..start();

    while (finder.evaluate().isEmpty && stopwatch.elapsed < timeout) {
      await tester.pump(const Duration(milliseconds: 100));
    }

    if (finder.evaluate().isEmpty) {
      throw Exception('Widget not found within timeout: ${timeout.inSeconds}s');
    }
  }

  /// Wait for specific text to appear
  static Future<void> waitForText(
    WidgetTester tester,
    String text, {
    Duration timeout = const Duration(seconds: 10),
  }) async {
    await waitForWidget(tester, find.text(text), timeout: timeout);
  }

  /// Simulate user login flow
  static Future<void> simulateLogin(
    WidgetTester tester, {
    String email = 'test@example.com',
    String password = 'password123',
  }) async {
    // Enter credentials
    await tester.enterText(find.byKey(const Key('email_field')), email);
    await tester.enterText(find.byKey(const Key('password_field')), password);

    // Tap login button
    await tester.tap(find.byKey(const Key('login_button')));
    await tester.pumpAndSettle();
  }

  /// Simulate work order action
  static Future<void> simulateWorkOrderAction(
    WidgetTester tester,
    String action, {
    String? reason,
    String? notes,
  }) async {
    // Tap action button
    await tester.tap(find.byKey(Key('${action}_button')));
    await tester.pumpAndSettle();

    // Enter reason if required
    if (reason != null) {
      await tester.enterText(find.byKey(const Key('reason_field')), reason);
    }

    // Enter notes if required
    if (notes != null) {
      await tester.enterText(find.byKey(const Key('notes_field')), notes);
    }

    // Confirm action
    await tester.tap(find.byKey(const Key('confirm_action_button')));
    await tester.pumpAndSettle();
  }

  /// Verify navigation to specific page
  static void verifyNavigationTo(String routeName) {
    // This would need to be implemented based on your routing setup
    // For now, we'll verify by checking for specific widgets
    expect(find.byKey(Key('${routeName}_page')), findsOneWidget);
  }

  /// Verify error message is displayed
  static void verifyErrorMessage(String message) {
    expect(find.text(message), findsOneWidget);
  }

  /// Verify success message is displayed
  static void verifySuccessMessage(String message) {
    expect(find.text(message), findsOneWidget);
  }

  /// Verify loading indicator is displayed
  static void verifyLoadingIndicator() {
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  }

  /// Verify loading indicator is not displayed
  static void verifyNoLoadingIndicator() {
    expect(find.byType(CircularProgressIndicator), findsNothing);
  }
}

/// Mock classes for integration testing
class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockLocationService extends Mock implements LocationService {}

class MockConnectivity extends Mock implements Connectivity {}

/// Custom matchers for integration tests
class IntegrationMatchers {
  /// Matcher for verifying work order status
  static Matcher hasWorkOrderStatus(WorkOrderStatus status) {
    return predicate<WorkOrderEntity>(
      (wo) => wo.status == status,
      'has work order status $status',
    );
  }

  /// Matcher for verifying document is downloaded
  static Matcher isDocumentDownloaded() {
    return predicate<DocumentEntity>(
      (doc) => doc.isDownloaded == true && doc.localPath != null,
      'is document downloaded',
    );
  }

  /// Matcher for verifying part inventory level
  static Matcher hasInventoryLevel(int quantity) {
    return predicate<PartEntity>(
      (part) => part.stockQuantity == quantity,
      'has inventory level $quantity',
    );
  }
}
