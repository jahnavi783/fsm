import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompleteWorkOrderDialog {
  static void show(
    BuildContext context,
    Function(String workLog, String completionNotes) onComplete,
  ) {
    final TextEditingController workLogController = TextEditingController();
    final TextEditingController completionNotesController =
        TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Complete Work Order'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: workLogController,
                decoration: const InputDecoration(
                  labelText: 'Work Log (Optional)',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 16.h),
              TextField(
                controller: completionNotesController,
                decoration: const InputDecoration(
                  labelText: 'Completion Notes (Optional)',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              onComplete(
                workLogController.text.trim(),
                completionNotesController.text.trim(),
              );
            },
            child: const Text('Complete'),
          ),
        ],
      ),
    );
  }
}
