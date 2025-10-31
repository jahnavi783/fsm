import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/widgets/form/work_order_validators.dart';
import 'package:reactive_forms/reactive_forms.dart';

/// Reusable reactive multiline text input field
/// Suitable for notes, work logs, completion notes, etc.
class ReactiveMultilineInput extends StatelessWidget {
  final String formControlName;
  final String? label;
  final String? hint;
  final int minLines;
  final int maxLines;
  final int? maxLength;
  final Map<String, ValidationMessageFunction>? validationMessages;
  final bool showErrors;

  const ReactiveMultilineInput({
    super.key,
    required this.formControlName,
    this.label,
    this.hint,
    this.minLines = 3,
    this.maxLines = 6,
    this.maxLength,
    this.validationMessages,
    this.showErrors = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ReactiveTextField<String>(
      formControlName: formControlName,
      keyboardType: TextInputType.multiline,
      textCapitalization: TextCapitalization.sentences,
      minLines: minLines,
      maxLines: maxLines,
      maxLength: maxLength,
      style: theme.textTheme.bodyMedium?.copyWith(
        fontSize: DesignTokens.fontSize14.sp,
        height: 1.5,
      ),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        alignLabelWithHint: true,
        // All colors, borders, padding automatically inherited from theme.inputDecorationTheme
      ),
      validationMessages: validationMessages ?? _defaultValidationMessages,
      showErrors: (control) => showErrors && control.invalid && control.touched,
    );
  }

  static Map<String, ValidationMessageFunction>
      get _defaultValidationMessages => {
            ValidationMessage.required: (_) => 'This field is required',
            ValidationMessage.minLength: (error) {
              final requiredLength = (error as Map)['requiredLength'];
              final actualLength = error['actualLength'];
              return 'Minimum $requiredLength characters required (current: $actualLength)';
            },
            ValidationMessage.maxLength: (error) {
              final requiredLength = (error as Map)['requiredLength'];
              return 'Maximum $requiredLength characters allowed';
            },
            'requiredReason': (_) =>
                WorkOrderValidationMessages.getErrorMessage(
                    'requiredReason', null),
          };
}
