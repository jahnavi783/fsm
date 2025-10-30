import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/widgets/form/location_status_widget.dart';
import '../../../../core/widgets/form/reactive_image_picker.dart';
import '../../../../core/widgets/form/reactive_multiline_input.dart';
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
  Color get _submitButtonColor {
    switch (action) {
      case WorkOrderAction.start:
        return AppColors.success;
      case WorkOrderAction.pause:
        return AppColors.warning;
      case WorkOrderAction.resume:
        return AppColors.success;
      case WorkOrderAction.reject:
        return AppColors.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 0.8.sh,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimensions.radiusLarge),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            margin: EdgeInsets.only(top: 12.h),
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: AppColors.textSecondary.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          
          // Header
          Padding(
            padding: EdgeInsets.all(AppDimensions.paddingMedium),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _actionTitle,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.close,
                    size: 24.sp,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          
          Divider(height: 1.h, color: AppColors.outline),
          
          // Form content
          Flexible(
            child: ReactiveForm(
              formGroup: formGroup,
              child: ListView(
                padding: EdgeInsets.all(AppDimensions.paddingMedium),
                shrinkWrap: true,
                children: [
                  // Location status
                  LocationStatusWidget(location: location),
                  
                  SizedBox(height: AppDimensions.paddingMedium),
                  
                  // Work Order Info
                  _buildWorkOrderInfo(),
                  
                  SizedBox(height: AppDimensions.paddingLarge),
                  
                  // Dynamic form fields based on action type
                  ..._buildFormFields(),
                  
                  SizedBox(height: AppDimensions.paddingLarge),
                  
                  // Submit button
                  _buildSubmitButton(context),
                  
                  SizedBox(height: AppDimensions.paddingMedium),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Build work order info card
  Widget _buildWorkOrderInfo() {
    return Container(
      padding: EdgeInsets.all(AppDimensions.paddingMedium),
      decoration: BoxDecoration(
        color: AppColors.brandPrimaryLight,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Work Order #${workOrder.id}',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            workOrder.summary,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.textPrimary,
            ),
          ),
          if (workOrder.customer?.name != null) ...[
            SizedBox(height: 4.h),
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
      SizedBox(height: 8.h),
      ReactiveMultilineInput(
        formControlName: 'notes',
        hint: 'Add any notes before starting...',
      ),
      SizedBox(height: AppDimensions.paddingMedium),
      Text(
        'Attachments (Optional)',
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
      ),
      SizedBox(height: 8.h),
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
      SizedBox(height: 8.h),
      ReactiveMultilineInput(
        formControlName: 'reason',
        hint: 'Why are you pausing this work order?',
      ),
      SizedBox(height: AppDimensions.paddingMedium),
      Text(
        'Attachments (Optional)',
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
      ),
      SizedBox(height: 8.h),
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
      SizedBox(height: 8.h),
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
      SizedBox(height: 8.h),
      ReactiveMultilineInput(
        formControlName: 'reason',
        hint: 'Why are you rejecting this work order?',
      ),
      SizedBox(height: AppDimensions.paddingMedium),
      Text(
        'Attachments (Optional)',
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
      ),
      SizedBox(height: 8.h),
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
                backgroundColor: _submitButtonColor,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 48.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
                ),
                disabledBackgroundColor: AppColors.disabled,
              ),
              child: isLoading
                  ? SizedBox(
                      width: 20.w,
                      height: 20.h,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
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
          content: Text('Location is required to ${_submitButtonText.toLowerCase()} work order'),
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
