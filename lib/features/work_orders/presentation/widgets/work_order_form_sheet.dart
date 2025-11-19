import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/core/theme/app_dimensions.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/services/location_service.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../core/theme/extensions/fsm_theme_extension.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/entities/location_entity.dart';
import '../../domain/entities/work_order_entity.dart';
import '../blocs/work_order_action/work_order_action_bloc.dart';
import '../blocs/work_order_action/work_order_action_event.dart';
import '../blocs/work_order_action/work_order_action_state.dart';
import '../forms/work_order_forms.dart';

enum WorkOrderAction {
  start,
  pause,
  resume,
  reject,
}

class WorkOrderFormSheet extends StatefulWidget {
  final WorkOrderAction action;
  final WorkOrderEntity workOrder;
  final WorkOrderActionBloc bloc;
  final FormGroup formGroup;
  final LocationService locationService;

  const WorkOrderFormSheet({
    super.key,
    required this.action,
    required this.workOrder,
    required this.bloc,
    required this.formGroup,
    required this.locationService,
  });

  /// Shows the WorkOrderFormSheet as a modal bottom sheet
  /// Location is automatically captured internally
  static Future<void> show({
    required BuildContext context,
    required WorkOrderAction action,
    required WorkOrderEntity workOrder,
  }) async {
    final bloc = context.read<WorkOrderActionBloc>();
    final locationService = getIt<LocationService>();
    final formGroup = _createFormGroup(action);

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true, //  allows full height + keyboard
      useSafeArea: true, //  avoids overlaps near notches
      backgroundColor: Colors.transparent,
      builder: (bottomSheetContext) {
        final bottomInset = MediaQuery.of(bottomSheetContext).viewInsets.bottom;

        return Padding(
          padding: EdgeInsets.only(
              bottom: bottomInset), // FIXED: keyboard-safe padding
          child: BlocProvider.value(
            value: bloc,
            child: WorkOrderFormSheet(
              action: action,
              workOrder: workOrder,
              bloc: bloc,
              formGroup: formGroup,
              locationService: locationService,
            ),
          ),
        );
      },
    );
  }

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

  @override
  State<WorkOrderFormSheet> createState() => _WorkOrderFormSheetState();
}

class _WorkOrderFormSheetState extends State<WorkOrderFormSheet> {
  LocationEntity? _location;
  bool _isLocationLoading = false;

  @override
  void initState() {
    super.initState();
    // Delay location capture until after the first frame to avoid context issues
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _captureLocation();
      }
    });
  }

  Future<void> _captureLocation() async {
    if (!mounted) return;

    setState(() {
      _isLocationLoading = true;
      _location = null;
    });

    try {
      // Use the enhanced method for better error handling
      final result = await widget.locationService.getCurrentLocationEnhanced();

      if (!mounted) return;

      if (result.isSuccess && result.location != null) {
        setState(() {
          _location = LocationEntity(
            latitude: result.location!.latitude,
            longitude: result.location!.longitude,
            accuracy: result.location!.accuracy,
            capturedAt: DateTime.now(),
          );
          _isLocationLoading = false;
        });
      } else {
        setState(() {
          _isLocationLoading = false;
        });

        // Show error with retry option
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  Text(result.error?.message ?? 'Failed to capture location'),
              backgroundColor: AppColors.errorRed,
              action: SnackBarAction(
                label: 'Retry',
                textColor: Colors.white,
                onPressed: _captureLocation,
              ),
            ),
          );
        }
      }
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _isLocationLoading = false;
      });

      // Show generic error
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Unexpected error: ${e.toString()}'),
            backgroundColor: AppColors.errorRed,
            action: SnackBarAction(
              label: 'Retry',
              textColor: Colors.white,
              onPressed: _captureLocation,
            ),
          ),
        );
      }
    }
  }

  String get _actionTitle {
    switch (widget.action) {
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

  String get _submitButtonText {
    switch (widget.action) {
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

  Color _getSubmitButtonColor(BuildContext context) {
    final fsmTheme = context.fsmTheme;
    switch (widget.action) {
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
      constraints: BoxConstraints(maxHeight: 0.8.sh),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimensions.radiusLarge),
        ),
      ),

      ///  FIXED: wrap with SingleChildScrollView for scrollable + keyboard-friendly form
      child: SingleChildScrollView(
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
            Padding(
              padding: REdgeInsets.only(
                left: DesignTokens.space4,
                right: DesignTokens.space4,
                bottom: DesignTokens.space4,
              ),
              child: ReactiveForm(
                formGroup: widget.formGroup,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LocationStatusWidget(
                      location: _location,
                      isLoading: _isLocationLoading,
                      onRetry: _captureLocation,
                      showRetryButton: true,
                    ),
                    DesignTokens.verticalSpaceMedium,
                    _buildWorkOrderInfo(context),
                    DesignTokens.verticalSpaceLarge,
                    ..._buildFormFields(),
                    DesignTokens.verticalSpaceLarge,
                    _buildSubmitButton(context),
                    DesignTokens.verticalSpaceMedium,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkOrderInfo(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(DesignTokens.space4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Work Order #${widget.workOrder.id}',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          DesignTokens.verticalSpaceXs,
          Text(
            widget.workOrder.summary,
            style: TextStyle(
              fontSize: 14.sp,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          if (widget.workOrder.customer?.name != null) ...[
            DesignTokens.verticalSpaceXs,
            Text(
              'Customer: ${widget.workOrder.customer!.name}',
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

  List<Widget> _buildFormFields() {
    switch (widget.action) {
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

  List<Widget> _buildStartFormFields() {
    return [
      Text('Notes (Optional)',
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary)),
      DesignTokens.verticalSpaceSmall,
      ReactiveMultilineInput(
        formControlName: 'notes',
        hint: 'Add any notes before starting...',
      ),
      DesignTokens.verticalSpaceMedium,
      Text('Attachments (Optional)',
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary)),
      DesignTokens.verticalSpaceSmall,
      ReactiveImagePicker(formControlName: 'files', maxImages: 5),
    ];
  }

  List<Widget> _buildPauseFormFields() => [
        Text('Reason *',
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary)),
        DesignTokens.verticalSpaceSmall,
        ReactiveMultilineInput(
          formControlName: 'reason',
          hint: 'Why are you pausing this work order?',
        ),
        DesignTokens.verticalSpaceMedium,
        Text('Attachments (Optional)',
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary)),
        DesignTokens.verticalSpaceSmall,
        ReactiveImagePicker(formControlName: 'files', maxImages: 5),
      ];

  List<Widget> _buildResumeFormFields() => [
        Text('Notes (Optional)',
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary)),
        DesignTokens.verticalSpaceSmall,
        ReactiveMultilineInput(
          formControlName: 'notes',
          hint: 'Add any notes about resuming...',
        ),
        DesignTokens.verticalSpaceMedium,
        Text('Attachments (Optional)',
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary)),
        DesignTokens.verticalSpaceSmall,
        ReactiveImagePicker(formControlName: 'files', maxImages: 5)
      ];

  List<Widget> _buildRejectFormFields() => [
        Text('Reason *',
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary)),
        DesignTokens.verticalSpaceSmall,
        ReactiveMultilineInput(
          formControlName: 'reason',
          hint: 'Why are you rejecting this work order?',
        ),
        DesignTokens.verticalSpaceMedium,
        Text('Attachments (Optional)',
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary)),
        DesignTokens.verticalSpaceSmall,
        ReactiveImagePicker(formControlName: 'files', maxImages: 5),
      ];

  Widget _buildSubmitButton(BuildContext context) {
    return BlocConsumer<WorkOrderActionBloc, WorkOrderActionState>(
      bloc: widget.bloc,
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
            actionInProgress: (_, __, ___) => true, orElse: () => false);
        final canSubmit = _location != null;

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
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
            );
          },
        );
      },
    );
  }

  void _handleSubmit(BuildContext context) {
    if (_location == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Location is required to ${_submitButtonText.toLowerCase()} work order'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    if (!widget.formGroup.valid) {
      widget.formGroup.markAllAsTouched();
      return;
    }

    switch (widget.action) {
      case WorkOrderAction.start:
        final data = WorkOrderForms.getStartFormData(widget.formGroup);
        widget.bloc.add(
          WorkOrderActionEvent.startWorkOrder(
            workOrderId: widget.workOrder.id,
            latitude: _location!.latitude,
            longitude: _location!.longitude,
            notes: data['notes'],
            files: data['files'] ?? [],
          ),
        );
        break;
      case WorkOrderAction.pause:
        final data = WorkOrderForms.getPauseFormData(widget.formGroup);
        widget.bloc.add(
          WorkOrderActionEvent.pauseWorkOrder(
            workOrderId: widget.workOrder.id,
            latitude: _location!.latitude,
            longitude: _location!.longitude,
            reason: data['reason']!,
            files: data['files'] ?? [],
          ),
        );
        break;
      case WorkOrderAction.resume:
        final data = WorkOrderForms.getResumeFormData(widget.formGroup);
        widget.bloc.add(
          WorkOrderActionEvent.resumeWorkOrder(
            workOrderId: widget.workOrder.id,
            latitude: _location!.latitude,
            longitude: _location!.longitude,
            notes: data['notes'],
            files: data['files'] ?? [],
          ),
        );
        break;
      case WorkOrderAction.reject:
        final data = WorkOrderForms.getRejectFormData(widget.formGroup);
        widget.bloc.add(
          WorkOrderActionEvent.rejectWorkOrder(
            workOrderId: widget.workOrder.id,
            latitude: _location!.latitude,
            longitude: _location!.longitude,
            reason: data['reason']!,
          ),
        );
        break;
    }
  }
}
