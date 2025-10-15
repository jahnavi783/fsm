import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:fsm/core/widgets/custom_button.dart';

import '../golden_test_config.dart';

void main() {
  group('Simple Widgets Golden Tests', () {
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
            child: CustomButton.secondary(
              text: 'Secondary Button',
              onPressed: () {},
            ),
          ),
          name: 'secondary_enabled',
        )
        ..addScenario(
          widget: GoldenTestConfig.createTestWrapper(
            child: CustomButton(
              text: 'Loading Button',
              onPressed: () {},
              isLoading: true,
            ),
          ),
          name: 'loading_state',
        );

      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, 'custom_button_simple');
    });

    testGoldens('CustomIconButton golden test', (tester) async {
      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(devices: GoldenTestConfig.phoneDevices)
        ..addScenario(
          widget: GoldenTestConfig.createTestWrapper(
            child: Center(
              child: CustomIconButton(
                icon: Icons.add,
                onPressed: () {},
              ),
            ),
          ),
          name: 'icon_enabled',
        )
        ..addScenario(
          widget: GoldenTestConfig.createTestWrapper(
            child: const Center(
              child: CustomIconButton(
                icon: Icons.delete,
                onPressed: null,
              ),
            ),
          ),
          name: 'icon_disabled',
        )
        ..addScenario(
          widget: GoldenTestConfig.createTestWrapper(
            child: const CustomIconButton(
              icon: Icons.refresh,
              onPressed: null,
              isLoading: true,
            ),
          ),
          name: 'icon_loading',
        );

      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, 'custom_icon_button');
    });

    testGoldens('Material Design Components golden test', (tester) async {
      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(devices: GoldenTestConfig.phoneDevices)
        ..addScenario(
          widget: GoldenTestConfig.createTestWrapper(
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('Sample Card'),
                    ),
                  ),
                  SizedBox(height: 16),
                  Chip(
                    label: Text('Sample Chip'),
                    avatar: Icon(Icons.star),
                  ),
                  SizedBox(height: 16),
                  LinearProgressIndicator(value: 0.7),
                ],
              ),
            ),
          ),
          name: 'material_components',
        );

      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, 'material_components');
    });
  });
}