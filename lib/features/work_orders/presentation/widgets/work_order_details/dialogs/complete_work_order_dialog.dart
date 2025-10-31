import 'package:flutter/material.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/widgets/widgets.dart';

class CompleteWorkOrderDialog extends StatefulWidget {
  final Function(String workLog, String completionNotes) onComplete;

  const CompleteWorkOrderDialog({
    super.key,
    required this.onComplete,
  });

  static void show(
    BuildContext context,
    Function(String workLog, String completionNotes) onComplete,
  ) {
    showDialog(
      context: context,
      builder: (context) => CompleteWorkOrderDialog(onComplete: onComplete),
    );
  }

  @override
  State<CompleteWorkOrderDialog> createState() =>
      _CompleteWorkOrderDialogState();
}

class _CompleteWorkOrderDialogState extends State<CompleteWorkOrderDialog> {
  late final TextEditingController _workLogController;
  late final TextEditingController _completionNotesController;

  @override
  void initState() {
    super.initState();
    _workLogController = TextEditingController();
    _completionNotesController = TextEditingController();
  }

  @override
  void dispose() {
    _workLogController.dispose();
    _completionNotesController.dispose();
    super.dispose();
  }

  void _handleCancel() {
    Navigator.of(context).pop();
  }

  void _handleComplete() {
    Navigator.of(context).pop();
    widget.onComplete(
      _workLogController.text.trim(),
      _completionNotesController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Complete Work Order'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _workLogController,
              decoration: const InputDecoration(
                labelText: 'Work Log (Optional)',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            DesignTokens.verticalSpaceMedium,
            TextField(
              controller: _completionNotesController,
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
          onPressed: _handleCancel,
          child: const Text('Cancel'),
        ),
        FsmButton(
          text: 'Complete',
          onPressed: _handleComplete,
          variant: FsmButtonVariant.filled,
        ),
      ],
    );
  }
}
