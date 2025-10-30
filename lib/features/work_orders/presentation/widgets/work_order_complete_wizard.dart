import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/widgets/form/location_status_widget.dart';
import '../../../../core/widgets/form/reactive_image_picker.dart';
import '../../../../core/widgets/form/reactive_multiline_input.dart';
import '../../../../core/widgets/form/reactive_signature_pad.dart';
import '../../../../core/widgets/form/reactive_text_input.dart';
import '../../data/models/work_order_completion_cache_model.dart';
import '../../data/services/work_order_completion_cache_service.dart';
import '../../domain/entities/location_entity.dart';
import '../../domain/entities/work_order_entity.dart';
import '../blocs/work_order_action/work_order_action_bloc.dart';
import '../blocs/work_order_action/work_order_action_event.dart';
import '../blocs/work_order_action/work_order_action_state.dart';
import '../forms/work_order_forms.dart';

/// Wizard-style completion flow with three sequential sheets
class WorkOrderCompleteWizard extends StatefulWidget {
  final WorkOrderEntity workOrder;
  final LocationEntity? location;
  final WorkOrderActionBloc bloc;
  final WorkOrderCompletionCacheService cacheService;

  const WorkOrderCompleteWizard({
    super.key,
    required this.workOrder,
    required this.location,
    required this.bloc,
    required this.cacheService,
  });

  /// Factory method to show the wizard
  static Future<void> show({
    required BuildContext context,
    required WorkOrderEntity workOrder,
    LocationEntity? location,
  }) async {
    final bloc = context.read<WorkOrderActionBloc>();
    final cacheService = getIt<WorkOrderCompletionCacheService>();

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: false,
      enableDrag: false,
      builder: (bottomSheetContext) => BlocProvider.value(
        value: bloc,
        child: WorkOrderCompleteWizard(
          workOrder: workOrder,
          location: location,
          bloc: bloc,
          cacheService: cacheService,
        ),
      ),
    );
  }

  @override
  State<WorkOrderCompleteWizard> createState() => _WorkOrderCompleteWizardState();
}

class _WorkOrderCompleteWizardState extends State<WorkOrderCompleteWizard> {
  int _currentStep = 0;
  late FormGroup _step1Form;
  late FormGroup _step2Form;
  late FormGroup _step3Form;

  @override
  void initState() {
    super.initState();
    _initializeForms();
    _loadCachedData();
  }

  void _initializeForms() {
    _step1Form = WorkOrderForms.buildCompleteFormStep1();
    _step2Form = WorkOrderForms.buildCompleteFormStep2();
    _step3Form = WorkOrderForms.buildCompleteFormStep3();
  }

  Future<void> _loadCachedData() async {
    final cache = await widget.cacheService.loadCache(widget.workOrder.id);
    if (cache != null && mounted) {
      setState(() {
        _currentStep = cache.currentStep;
      });

      // Restore Step 1 data
      if (cache.workLog != null) {
        _step1Form.control('workLog').value = cache.workLog;
      }
      
      // Restore parts
      if (cache.partsUsed.isNotEmpty) {
        final partsArray = _step1Form.control('parts') as FormArray;
        partsArray.clear();
        for (final cachedPart in cache.partsUsed) {
          final partGroup = WorkOrderForms.createPartEntry(
            partNumber: cachedPart.partNumber,
            partName: cachedPart.partName,
            quantity: cachedPart.quantity,
          );
          partsArray.add(partGroup);
        }
      }

      // Restore Step 2 data (images)
      if (cache.images.isNotEmpty) {
        final imageFiles = cache.images.map((path) => File(path)).toList();
        _step2Form.control('files').value = imageFiles;
      }

      // Restore Step 3 data
      if (cache.customerName != null) {
        _step3Form.control('customerName').value = cache.customerName;
      }
      if (cache.completionNotes != null) {
        _step3Form.control('completionNotes').value = cache.completionNotes;
      }
      if (cache.signaturePath != null) {
        final signatureFile = File(cache.signaturePath!);
        if (await signatureFile.exists()) {
          _step3Form.control('signature').value = signatureFile;
        }
      }
    }
  }

  Future<void> _saveCache() async {
    final step1Data = WorkOrderForms.getCompleteFormData(_step1Form, _step2Form, _step3Form);
    
    // Convert parts to cached model
    final cachedParts = (step1Data['partsUsed'] as List<PartUsedEntity>?)
        ?.map((part) => CachedPartUsedModel(
              partNumber: part.partNumber,
              quantity: part.quantityUsed,
              partName: part.partName ?? '',
              category: '',
              quantityAvailable: 0,
              unitPrice: 0.0,
              status: 'used',
            ))
        .toList() ?? [];

    // Get image paths
    final imagePaths = (step1Data['files'] as List<File>?)
        ?.map((file) => file.path)
        .toList() ?? [];

    final cache = WorkOrderCompletionCacheModel(
      workOrderId: widget.workOrder.id,
      currentStep: _currentStep,
      workLog: step1Data['workLog'],
      partsUsed: cachedParts,
      images: imagePaths,
      customerName: step1Data['customerName'],
      signaturePath: step1Data['signature']?.path,
      completionNotes: step1Data['completionNotes'],
      lastUpdated: DateTime.now(),
    );

    await widget.cacheService.saveCache(cache);
  }

  void _nextStep() {
    // Validate current step
    final currentForm = _getCurrentForm();
    if (!currentForm.valid) {
      currentForm.markAllAsTouched();
      return;
    }

    if (_currentStep < 2) {
      setState(() {
        _currentStep++;
      });
      _saveCache();
    } else {
      _submitCompletion();
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
      _saveCache();
    }
  }

  FormGroup _getCurrentForm() {
    switch (_currentStep) {
      case 0:
        return _step1Form;
      case 1:
        return _step2Form;
      case 2:
        return _step3Form;
      default:
        return _step1Form;
    }
  }

  Future<void> _submitCompletion() async {
    // Validate all forms
    if (!_step1Form.valid || !_step2Form.valid || !_step3Form.valid) {
      _step1Form.markAllAsTouched();
      _step2Form.markAllAsTouched();
      _step3Form.markAllAsTouched();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please complete all required fields'),
          backgroundColor: AppColors.errorRed,
        ),
      );
      return;
    }

    if (widget.location == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Location is required to complete work order'),
          backgroundColor: AppColors.errorRed,
        ),
      );
      return;
    }

    final data = WorkOrderForms.getCompleteFormData(_step1Form, _step2Form, _step3Form);

    widget.bloc.add(
      WorkOrderActionEvent.completeWorkOrder(
        workOrderId: widget.workOrder.id,
        workLog: data['workLog']!,
        customerName: data['customerName']!,
        signature: data['signature']!,
        partsUsed: data['partsUsed'] ?? [],
        files: data['files'] ?? [],
        latitude: widget.location!.latitude,
        longitude: widget.location!.longitude,
        completionNotes: data['completionNotes'],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkOrderActionBloc, WorkOrderActionState>(
      bloc: widget.bloc,
      listener: (context, state) {
        state.maybeWhen(
          actionSuccess: (workOrder, actionType, message, groupedImages) {
            // Clear cache on success
            widget.cacheService.clearCache(widget.workOrder.id);
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

        return Container(
          constraints: BoxConstraints(
            maxHeight: 0.9.sh,
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
              // Header
              _buildHeader(),
              
              Divider(height: 1.h, color: AppColors.outline),
              
              // Progress indicator
              _buildProgressIndicator(),
              
              // Content
              Flexible(
                child: _buildStepContent(),
              ),
              
              // Navigation buttons
              _buildNavigationButtons(isLoading),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.all(AppDimensions.paddingMedium),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: AppColors.success.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
            ),
            child: Icon(
              Icons.check_circle,
              color: AppColors.success,
              size: 24.sp,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Complete Work Order',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  'Work Order #${widget.workOrder.id}',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              _saveCache();
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.close,
              size: 24.sp,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingMedium,
        vertical: AppDimensions.paddingSmall,
      ),
      child: Row(
        children: [
          _buildStepIndicator(0, 'Work Log'),
          Expanded(child: _buildStepConnector(0)),
          _buildStepIndicator(1, 'Images'),
          Expanded(child: _buildStepConnector(1)),
          _buildStepIndicator(2, 'Signature'),
        ],
      ),
    );
  }

  Widget _buildStepIndicator(int step, String label) {
    final isActive = step == _currentStep;
    final isCompleted = step < _currentStep;

    return Column(
      children: [
        Container(
          width: 32.w,
          height: 32.h,
          decoration: BoxDecoration(
            color: isCompleted || isActive
                ? AppColors.success
                : AppColors.disabled,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: isCompleted
                ? Icon(Icons.check, color: Colors.white, size: 18.sp)
                : Text(
                    '${step + 1}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 11.sp,
            color: isActive ? AppColors.textPrimary : AppColors.textSecondary,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildStepConnector(int step) {
    final isCompleted = step < _currentStep;

    return Container(
      height: 2.h,
      margin: EdgeInsets.only(bottom: 20.h),
      color: isCompleted ? AppColors.success : AppColors.disabled,
    );
  }

  Widget _buildStepContent() {
    return ReactiveForm(
      formGroup: _getCurrentForm(),
      child: ListView(
        padding: EdgeInsets.all(AppDimensions.paddingMedium),
        children: [
          // Location status
          LocationStatusWidget(location: widget.location),
          
          SizedBox(height: AppDimensions.paddingMedium),
          
          // Step-specific content
          if (_currentStep == 0) _buildStep1Content(),
          if (_currentStep == 1) _buildStep2Content(),
          if (_currentStep == 2) _buildStep3Content(),
        ],
      ),
    );
  }

  Widget _buildStep1Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Step 1: Work Details',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: AppDimensions.paddingSmall),
        Text(
          'Provide details about the work performed and parts used',
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppDimensions.paddingLarge),
        
        Text(
          'Work Log *',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        ReactiveMultilineInput(
          formControlName: 'workLog',
          hint: 'Describe the work performed in detail (minimum 20 characters)...',
          minLines: 4,
          maxLines: 8,
        ),
        
        SizedBox(height: AppDimensions.paddingLarge),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Parts Used (Optional)',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
            ReactiveFormArray(
              formArrayName: 'parts',
              builder: (context, formArray, child) {
                return TextButton.icon(
                  onPressed: () {
                    formArray.add(WorkOrderForms.createPartEntry(
                      partNumber: '',
                      partName: '',
                      quantity: 1,
                    ));
                  },
                  icon: Icon(Icons.add, size: 18.sp),
                  label: Text('Add Part'),
                );
              },
            ),
          ],
        ),
        
        SizedBox(height: 8.h),
        
        ReactiveFormArray(
          formArrayName: 'parts',
          builder: (context, formArray, child) {
            if (formArray.value == null || (formArray.value as List).isEmpty) {
              return Container(
                padding: EdgeInsets.all(AppDimensions.paddingMedium),
                decoration: BoxDecoration(
                  color: AppColors.surfaceVariant,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
                  border: Border.all(color: AppColors.outline.withValues(alpha: 0.3)),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 20.sp,
                      color: AppColors.textSecondary,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text(
                        'No parts added yet. Tap "Add Part" to record parts used.',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            
            return Column(
              children: List.generate(
                formArray.controls.length,
                (index) => _buildPartEntry(formArray, index),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildPartEntry(FormArray formArray, int index) {
    return ReactiveForm(
      formGroup: formArray.controls[index] as FormGroup,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(AppDimensions.paddingMedium),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
          border: Border.all(color: AppColors.outline.withValues(alpha: 0.3)),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Part ${index + 1}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => formArray.removeAt(index),
                  icon: Icon(Icons.delete, size: 20.sp),
                  color: AppColors.errorRed,
                  style: IconButton.styleFrom(
                    padding: EdgeInsets.all(8.w),
                    minimumSize: Size(32.w, 32.h),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            ReactiveTextInput(
              formControlName: 'partNumber',
              label: 'Part Number',
            ),
            SizedBox(height: 8.h),
            ReactiveTextInput(
              formControlName: 'partName',
              label: 'Part Name',
            ),
            SizedBox(height: 8.h),
            ReactiveTextInput(
              formControlName: 'quantity',
              label: 'Quantity',
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep2Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Step 2: Capture Images',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: AppDimensions.paddingSmall),
        Text(
          'Take photos of the completed work (optional but recommended)',
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppDimensions.paddingLarge),
        
        Text(
          'Images (Optional)',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        ReactiveImagePicker(
          formControlName: 'files',
          maxImages: 10,
        ),
      ],
    );
  }

  Widget _buildStep3Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Step 3: Customer Signature',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: AppDimensions.paddingSmall),
        Text(
          'Get customer confirmation and signature',
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppDimensions.paddingLarge),
        
        Text(
          'Customer Name *',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        ReactiveTextInput(
          formControlName: 'customerName',
          hint: 'Enter customer name',
        ),
        
        SizedBox(height: AppDimensions.paddingLarge),
        
        Text(
          'Customer Signature *',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        ReactiveSignaturePad(
          formControlName: 'signature',
        ),
        
        SizedBox(height: AppDimensions.paddingLarge),
        
        Text(
          'Completion Notes (Optional)',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        ReactiveMultilineInput(
          formControlName: 'completionNotes',
          hint: 'Add any additional notes...',
          minLines: 3,
          maxLines: 5,
        ),
      ],
    );
  }

  Widget _buildNavigationButtons(bool isLoading) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.paddingMedium),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(
          top: BorderSide(color: AppColors.outline, width: 1),
        ),
      ),
      child: Row(
        children: [
          if (_currentStep > 0)
            Expanded(
              child: OutlinedButton(
                onPressed: isLoading ? null : _previousStep,
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
                  ),
                ),
                child: Text(
                  'Back',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          if (_currentStep > 0) SizedBox(width: 12.w),
          Expanded(
            flex: _currentStep == 0 ? 1 : 2,
            child: ElevatedButton(
              onPressed: isLoading ? null : _nextStep,
              style: ElevatedButton.styleFrom(
                backgroundColor: _currentStep == 2 ? AppColors.success : AppColors.primary,
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
                      _currentStep == 2 ? 'Complete Work Order' : 'Next',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _step1Form.dispose();
    _step2Form.dispose();
    _step3Form.dispose();
    super.dispose();
  }
}
