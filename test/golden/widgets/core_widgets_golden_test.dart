import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:fsm/core/widgets/custom_button.dart';
import 'package:fsm/core/widgets/connectivity_indicator.dart';
import 'package:fsm/core/widgets/sync_indicator.dart';

import '../golden_test_config.dart';

void main() {
  group('Core Widgets Golden Tests', () {
    setUpAll(() async {
      await GoldenTestConfig.initialize();
    });

    testGoldens('CustomButton golden test', (tester) async {
      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(devices: GoldenTestConfig.phoneDevices)
        ..addScenario(
          widget: GoldenTestConfig.createTestWrapper(
            child: Center(
              child: CustomButton(
                text: 'Primary Button',
                onPressed: () {},
              ),
            ),
          ),
          name: 'primary_enabled',
        )
        ..addScenario(
          widget: GoldenTestConfig.createTestWrapper(
            child: const Center(
              child: CustomButton(
                text: 'Disabled Button',
                onPressed: null,
              ),
            ),
          ),
          name: 'primary_disabled',
        )
        ..addScenario(
          widget: GoldenTestConfig.createTestWrapper(
            child: Center(
              child: CustomButton(
                text: 'Secondary Button',
                onPressed: () {},
                buttonType: ButtonType.secondary,
              ),
            ),
          ),
          name: 'secondary_enabled',
        )
        ..addScenario(
          widget: GoldenTestConfig.createTestWrapper(
            child: Center(
              child: CustomButton(
                text: 'Loading Button',
                onPressed: () {},
                isLoading: true,
              ),
            ),
          ),
          name: 'loading_state',
        );

      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, 'custom_button');
    });

    testGoldens('ConnectivityIndicator golden test', (tester) async {
      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(devices: GoldenTestConfig.phoneDevices)
        ..addScenario(
          widget: GoldenTestConfig.createTestWrapper(
            child: const Center(
              child: ConnectivityIndicator(
                isConnected: true,
              ),
            ),
          ),
          name: 'connected',
        )
        ..addScenario(
          widget: GoldenTestConfig.createTestWrapper(
            child: const Center(
              child: ConnectivityIndicator(
                isConnected: false,
              ),
            ),
          ),
          name: 'disconnected',
        );

      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, 'connectivity_indicator');
    });

    testGoldens('SyncIndicator golden test', (tester) async {
      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(devices: GoldenTestConfig.phoneDevices)
        ..addScenario(
          widget: GoldenTestConfig.createTestWrapper(
            child: const Center(
              child: SyncIndicator(
                syncStatus: SyncStatus.synced,
              ),
            ),
          ),
          name: 'synced',
        )
        ..addScenario(
          widget: GoldenTestConfig.createTestWrapper(
            child: const Center(
              child: SyncIndicator(
                syncStatus: SyncStatus.syncing,
              ),
            ),
          ),
          name: 'syncing',
        )
        ..addScenario(
          widget: GoldenTestConfig.createTestWrapper(
            child: const Center(
              child: SyncIndicator(
                syncStatus: SyncStatus.pending,
              ),
            ),
          ),
          name: 'pending',
        )
        ..addScenario(
          widget: GoldenTestConfig.createTestWrapper(
            child: const Center(
              child: SyncIndicator(
                syncStatus: SyncStatus.error,
              ),
            ),
          ),
          name: 'error',
        );

      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, 'sync_indicator');
    });
  });
}
