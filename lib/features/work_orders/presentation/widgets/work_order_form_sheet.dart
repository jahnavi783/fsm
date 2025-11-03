import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/core/theme/app_dimensions.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../core/theme/design_tokens.dart';
import '../../../../core/theme/extensions/fsm_theme_extension.dart';
import '../../../../core/widgets/form/location_status_widget.dart';
import '../../../../core/widgets/form/reactive_image_picker.dart';
import '../../../../core/widgets/form/reactive_multiline_input.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/entities/location_entity.dart';
import '../../domain/entities/work_order_entity.dart';
import '../blocs/work_order_action/work_order_action_bloc.dart';
import '../blocs/work_order_action/work_order_action_event.dart';
import '../blocs/work_order_action/work_order_action_state.dart';
import '../forms/work_order_forms.dart';

/// Enum representing different work order action types
enum WorkOrderAction {
  start,
  pause,
  resume,
  reject,
}

/// Unified bottom sheet for all work order actions (except complete, which uses wizard)
class WorkOrderFormSheet extends StatelessWidget {
  final WorkOrderAction action;
  final WorkOrderEntity workOrder;
  final LocationEntity? location;
  final WorkOrderActionBloc bloc;
  final FormGroup formGroup;

  const WorkOrderFormSheet({
    super.key,
    required this.action,
    required this.workOrder,
    required this.location,
    required this.bloc,
    required this.formGroup,
  });

  /// Factory method to show the appropriate action sheet
  static Future<void> show({
    required BuildContext context,
    required WorkOrderAction action,
    required WorkOrderEntity workOrder,
    LocationEntity? location,
  }) async {
    final bloc = context.read<WorkOrderActionBloc>();

    // Create the appropriate form group based on action type
    final formGroup = _createFormGroup(action);

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (bottomSheetContext) => BlocProvider.value(
        value: bloc,
        child: WorkOrderFormSheet(
          action: action,
          workOrder: workOrder,
          location: location,
          bloc: bloc,
          formGroup: formGroup,
        ),
      ),
    );
  }

  /// Create form group based on action type
  static FormGroup _createFormGroup(WorkOrderAction action) {
    switch (action) {
      case WorkOrderAction.start:
        return WorkOrderForms.buildStartForm();
      case WorkOrderAction.pause:
        return WorkOrderForms.buildPauseForm();
      case WorkOrderAction.resume:
        return WorkOrderForms.buildResumeForm();
      case WorkOrderAction.reject:
        return WorkOrderForms.buildRejectForm();
    }
  }

  /// Get action title based on action type
  String get _actionTitle {
    switch (action) {
      case WorkOrderAction.start:
        return 'Start Work Order';
      case WorkOrderAction.pause:
        return 'Pause Work Order';
      case WorkOrderAction.resume:
        return 'Resume Work Order';
      case WorkOrderAction.reject:
        return 'Reject Work Order';
    }
  }

  /// Get submit button text based on action type
  String get _submitButtonText {
    switch (action) {
      case WorkOrderAction.start:
        return 'Start';
      case WorkOrderAction.pause:
        return 'Pause';
      case WorkOrderAction.resume:
        return 'Resume';
      case WorkOrderAction.reject:
        return 'Reject';
    }
  }

  /// Get submit button color based on action type
  Color _getSubmitButtonColor(BuildContext context) {
    final fsmTheme = context.fsmTheme;
    switch (action) {
      case WorkOrderAction.start:
        return fsmTheme.actionStart;
      case WorkOrderAction.pause:
        return fsmTheme.actionPause;
      case WorkOrderAction.resume:
        return fsmTheme.actionResume;
      case WorkOrderAction.reject:
        return fsmTheme.actionReject;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 0.8.sh,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimensions.radiusLarge),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            margin: REdgeInsets.only(top: DesignTokens.space3),
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),

          // Header
          Padding(
            padding: REdgeInsets.all(DesignTokens.space4),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _actionTitle,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
                FsmIconButton(
                  icon: Icons.close,
                  onPressed: () => Navigator.of(context).pop(),
                  size: FsmIconButtonSize.medium,
                  tooltip: 'Close',
                ),
              ],
            ),
          ),

          Divider(height: 1.h, color: Theme.of(context).colorScheme.outline),

          // Form content
          Flexible(
            child: ReactiveForm(
              formGroup: formGroup,
              child: ListView(
                padding: REdgeInsets.all(DesignTokens.space4),
                shrinkWrap: true,
                children: [
                  // Location status
                  LocationStatusWidget(location: location),

                  DesignTokens.verticalSpaceMedium,

                  // Work Order Info
                  _buildWorkOrderInfo(context),

                  DesignTokens.verticalSpaceLarge,

                  // Dynamic form fields based on action type
                  ..._buildFormFields(),

                  DesignTokens.verticalSpaceLarge,

                  // Submit button
                  _buildSubmitButton(context),

                  DesignTokens.verticalSpaceMedium,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Build work order info card
  Widget _buildWorkOrderInfo(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(DesignTokens.space4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        border: Border.all(
            color:
                Theme.of(context).colorScheme.primary.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Work Order #${workOrder.id}',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          DesignTokens.verticalSpaceXs,
          Text(
            workOrder.summary,
            style: TextStyle(
              fontSize: 14.sp,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          if (workOrder.customer?.name != null) ...[
            DesignTokens.verticalSpaceXs,
            Text(
              'Customer: ${workOrder.customer!.name}',
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ],
      ),
    );
  }

  /// Build form fields based on action type
  List<Widget> _buildFormFields() {
    switch (action) {
      case WorkOrderAction.start:
        return _buildStartFormFields();
      case WorkOrderAction.pause:
        return _buildPauseFormFields();
      case WorkOrderAction.resume:
        return _buildResumeFormFields();
      case WorkOrderAction.reject:
        return _buildRejectFormFields();
    }
  }

  /// Build start action form fields
  List<Widget> _buildStartFormFields() {
    return [
      Text(
        'Notes (Optional)',
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
      ),
      DesignTokens.verticalSpaceSmall,
      ReactiveMultilineInput(
        formControlName: 'notes',
        hint: 'Add any notes before starting...',
      ),
      DesignTokens.verticalSpaceMedium,
      Text(
        'Attachments (Optional)',
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
      ),
      DesignTokens.verticalSpaceSmall,
      ReactiveImagePicker(
        formControlName: 'files',
        maxImages: 5,
      ),
    ];
  }

  /// Build pause action form fields
  List<Widget> _buildPauseFormFields() {
    return [
      Text(
        'Reason *',
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
      ),
      DesignTokens.verticalSpaceSmall,
      ReactiveMultilineInput(
        formControlName: 'reason',
        hint: 'Why are you pausing this work order?',
      ),
      DesignTokens.verticalSpaceMedium,
      Text(
        'Attachments (Optional)',
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
      ),
      DesignTokens.verticalSpaceSmall,
      ReactiveImagePicker(
        formControlName: 'files',
        maxImages: 5,
      ),
    ];
  }

  /// Build resume action form fields
  List<Widget> _buildResumeFormFields() {
    return [
      Text(
        'Notes (Optional)',
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
      ),
      DesignTokens.verticalSpaceSmall,
      ReactiveMultilineInput(
        formControlName: 'notes',
        hint: 'Add any notes about resuming...',
      ),
    ];
  }

  /// Build reject action form fields
  List<Widget> _buildRejectFormFields() {
    return [
      Text(
        'Reason *',
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
      ),
      DesignTokens.verticalSpaceSmall,
      ReactiveMultilineInput(
        formControlName: 'reason',
        hint: 'Why are you rejecting this work order?',
      ),
      DesignTokens.verticalSpaceMedium,
      Text(
        'Attachments (Optional)',
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
      ),
      DesignTokens.verticalSpaceSmall,
      ReactiveImagePicker(
        formControlName: 'files',
        maxImages: 5,
      ),
    ];
  }

  /// Build submit button
  Widget _buildSubmitButton(BuildContext context) {
    return BlocConsumer<WorkOrderActionBloc, WorkOrderActionState>(
      bloc: bloc,
      listener: (context, state) {
        state.maybeWhen(
          actionSuccess: (workOrder, actionType, message, groupedImages) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: AppColors.success,
              ),
            );
          },
          error: (failure, workOrder, isOffline) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(failure.message),
                backgroundColor: AppColors.errorRed,
              ),
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          actionInProgress: (_, __, ___) => true,
          orElse: () => false,
        );
        final canSubmit = location != null;

        return ReactiveFormConsumer(
          builder: (context, form, child) {
            return ElevatedButton(
              onPressed: (isLoading || !canSubmit || !form.valid)
                  ? null
                  : () => _handleSubmit(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: _getSubmitButtonColor(context),
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                minimumSize: Size(double.infinity, 48.h),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(AppDimensions.radiusMedium),
                ),
                disabledBackgroundColor: AppColors.disabled,
              ),
              child: isLoading
                  ? RSizedBox(
                      width: 20.w,
                      height: 20.h,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).colorScheme.onPrimary),
                      ),
                    )
                  : Text(
                      _submitButtonText,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            );
          },
        );
      },
    );
  }

  /// Handle form submission
  void _handleSubmit(BuildContext context) {
    if (location == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Location is required to ${_submitButtonText.toLowerCase()} work order'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    if (!formGroup.valid) {
      formGroup.markAllAsTouched();
      return;
    }

    // Dispatch appropriate event based on action type
    switch (action) {
      case WorkOrderAction.start:
        final data = WorkOrderForms.getStartFormData(formGroup);
        bloc.add(
          WorkOrderActionEvent.startWorkOrder(
            workOrderId: workOrder.id,
            latitude: location!.latitude,
            longitude: location!.longitude,
            notes: data['notes'],
            files: data['files'] ?? [],
          ),
        );
        break;

      case WorkOrderAction.pause:
        final data = WorkOrderForms.getPauseFormData(formGroup);
        bloc.add(
          WorkOrderActionEvent.pauseWorkOrder(
            workOrderId: workOrder.id,
            latitude: location!.latitude,
            longitude: location!.longitude,
            reason: data['reason']!,
            files: data['files'] ?? [],
          ),
        );
        break;

      case WorkOrderAction.resume:
        final data = WorkOrderForms.getResumeFormData(formGroup);
        bloc.add(
          WorkOrderActionEvent.resumeWorkOrder(
            workOrderId: workOrder.id,
            latitude: location!.latitude,
            longitude: location!.longitude,
            notes: data['notes'],
            files: data['files'] ?? [],
          ),
        );
        break;

      case WorkOrderAction.reject:
        final data = WorkOrderForms.getRejectFormData(formGroup);
        bloc.add(
          WorkOrderActionEvent.rejectWorkOrder(
            workOrderId: workOrder.id,
            latitude: location!.latitude,
            longitude: location!.longitude,
            reason: data['reason']!,
          ),
        );
        break;
    }
  }
}
