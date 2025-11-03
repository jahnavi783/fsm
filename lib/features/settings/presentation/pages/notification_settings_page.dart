import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/fsm_app_bar.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../profile/presentation/widgets/settings_section.dart';

@RoutePage()
class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  State<NotificationSettingsPage> createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool pushNotifications = true;
  bool emailNotifications = true;
  bool workOrderUpdates = true;
  bool documentUpdates = false;
  bool systemAlerts = true;
  bool soundEnabled = true;
  bool vibrationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: FSMAppBar.gradient(
        title: 'Notifications',
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.router.maybePop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: DesignTokens.space4.h),

            // General Notifications
            SettingsSection(
              title: 'General',
              items: [
                SettingsToggleItem(
                  title: 'Push Notifications',
                  subtitle: 'Receive notifications on your device',
                  icon: Icons.notifications,
                  value: pushNotifications,
                  onChanged: (value) {
                    setState(() {
                      pushNotifications = value;
                    });
                  },
                ),
                SettingsToggleItem(
                  title: 'Email Notifications',
                  subtitle: 'Receive notifications via email',
                  icon: Icons.email,
                  value: emailNotifications,
                  onChanged: (value) {
                    setState(() {
                      emailNotifications = value;
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: DesignTokens.space4.h),

            // Content Notifications
            SettingsSection(
              title: 'Content Updates',
              items: [
                SettingsToggleItem(
                  title: 'Work Order Updates',
                  subtitle: 'Notify when work orders are assigned or updated',
                  icon: Icons.work_outline,
                  value: workOrderUpdates,
                  onChanged: (value) {
                    setState(() {
                      workOrderUpdates = value;
                    });
                  },
                ),
                SettingsToggleItem(
                  title: 'Document Updates',
                  subtitle: 'Notify when new documents are available',
                  icon: Icons.description_outlined,
                  value: documentUpdates,
                  onChanged: (value) {
                    setState(() {
                      documentUpdates = value;
                    });
                  },
                ),
                SettingsToggleItem(
                  title: 'System Alerts',
                  subtitle: 'Important system notifications',
                  icon: Icons.warning_outlined,
                  value: systemAlerts,
                  onChanged: (value) {
                    setState(() {
                      systemAlerts = value;
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: DesignTokens.space4.h),

            // Sound & Vibration
            SettingsSection(
              title: 'Sound & Vibration',
              items: [
                SettingsToggleItem(
                  title: 'Sound',
                  subtitle: 'Play sound for notifications',
                  icon: Icons.volume_up_outlined,
                  value: soundEnabled,
                  onChanged: (value) {
                    setState(() {
                      soundEnabled = value;
                    });
                  },
                ),
                SettingsToggleItem(
                  title: 'Vibration',
                  subtitle: 'Vibrate for notifications',
                  icon: Icons.vibration,
                  value: vibrationEnabled,
                  onChanged: (value) {
                    setState(() {
                      vibrationEnabled = value;
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: DesignTokens.space8.h),
          ],
        ),
      ),
    );
  }
}
