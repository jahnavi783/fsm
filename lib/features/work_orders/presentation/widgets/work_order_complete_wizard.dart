import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/services/location_models.dart';
import '../../../../core/services/location_service.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../core/theme/extensions/fsm_theme_extension.dart';
import '../../../../core/widgets/form/reactive_image_picker.dart';
import '../../../../core/widgets/form/reactive_multiline_input.dart';
import '../../../../core/widgets/form/reactive_signature_pad.dart';
import '../../../../core/widgets/form/reactive_text_input.dart';
import '../../../parts/domain/entities/part_entity.dart';
import '../../../parts/domain/usecases/get_parts_usecase.dart';
import '../../data/models/work_order_completion_cache_model.dart';
import '../../data/services/work_order_completion_cache_service.dart';
import '../../domain/entities/work_order_entity.dart';
import '../blocs/work_order_action/work_order_action_bloc.dart';
import '../blocs/work_order_action/work_order_action_event.dart';
import '../blocs/work_order_action/work_order_action_state.dart';
import '../forms/work_order_forms.dart';

/// Redesigned Work Order Complete Wizard with 5-step flow
///
/// Steps:
/// 1. Customer Info + Work Log (required)
/// 2. Parts Used (optional - can skip)
/// 3. Work Images (optional - can skip)
/// 4. Signature + Notes (signature required)
/// 5. Location Capture + Review (required - blocks submission)
class WorkOrderCompleteWizard extends StatefulWidget {
  final WorkOrderEntity workOrder;
  final WorkOrderActionBloc bloc;
  final WorkOrderCompletionCacheService cacheService;

  const WorkOrderCompleteWizard({
    super.key,
    required this.workOrder,
    required this.bloc,
    required this.cacheService,
  });

  static Future<void> show({
    required BuildContext context,
    required WorkOrderEntity workOrder,
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
          bloc: bloc,
          cacheService: cacheService,
        ),
      ),
    );
  }

  @override
  State<WorkOrderCompleteWizard> createState() =>
      _WorkOrderCompleteWizardState();
}

class _WorkOrderCompleteWizardState extends State<WorkOrderCompleteWizard> {
  int _currentStep = 0;
  late FormGroup _step1Form; // Customer + Work Log
  late FormGroup _step2Form; // Parts
  late FormGroup _step3Form; // Images
  late FormGroup _step4Form; // Signature + Notes
  // Step 5 has no form - just location capture + review

  // Parts management
  final _getPartsUseCase = getIt<GetPartsUseCase>();
  List<PartEntity> _availableParts = [];
  bool _isLoadingParts = false;

  // Location management
  final _locationService = getIt<LocationService>();
  LocationResult? _locationResult;
  bool _isCapturingLocation = false;

  @override
  void initState() {
    super.initState();
    _initializeForms();
    _loadCachedData();
    _loadAvailableParts();
  }

  void _initializeForms() {
    _step1Form = WorkOrderForms.buildCompleteFormStep1();
    _step2Form = WorkOrderForms.buildCompleteFormStep2();
    _step3Form = WorkOrderForms.buildCompleteFormStep3();
    _step4Form = WorkOrderForms.buildCompleteFormStep4();
  }

  Future<void> _loadAvailableParts() async {
    setState(() {
      _isLoadingParts = true;
    });

    final result = await _getPartsUseCase(status: PartStatus.active);
    result.fold(
      (failure) {
        if (mounted) {
          setState(() {
            _isLoadingParts = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to load parts: ${failure.message}'),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        }
      },
      (parts) {
        if (mounted) {
          setState(() {
            _availableParts = parts;
            _isLoadingParts = false;
          });
        }
      },
    );
  }

  Future<void> _loadCachedData() async {
    final cache = await widget.cacheService.loadCache(widget.workOrder.id);
    if (cache != null && mounted) {
      setState(() {
        _currentStep = cache.currentStep;
      });

      // Restore step 1 data
      if (cache.customerName != null) {
        _step1Form.control('customerName').value = cache.customerName;
      }
      if (cache.workLog != null) {
        _step1Form.control('workLog').value = cache.workLog;
      }

      // Restore step 2 data (parts)
      if (cache.partsUsed.isNotEmpty) {
        final partsArray = _step2Form.control('parts') as FormArray;
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

      // Restore step 3 data (images)
      if (cache.images.isNotEmpty) {
        final imageFiles = cache.images.map((path) => File(path)).toList();
        _step3Form.control('files').value = imageFiles;
      }

      // Restore step 4 data (signature + notes)
      if (cache.signaturePath != null) {
        final signatureFile = File(cache.signaturePath!);
        if (await signatureFile.exists()) {
          _step4Form.control('signature').value = signatureFile;
        }
      }
      if (cache.completionNotes != null) {
        _step4Form.control('completionNotes').value = cache.completionNotes;
      }
    }
  }

  Future<void> _saveCache() async {
    final data = WorkOrderForms.getCompleteFormData(
      _step1Form,
      _step2Form,
      _step3Form,
      _step4Form,
    );

    final cachedParts = (data['parts'] as List? ?? [])
        .map((part) => CachedPartUsedModel(
              partNumber: part['partNumber'],
              quantity: part['quantity'],
              partName: part['partName'] ?? '',
              category: '',
              quantityAvailable: 0,
              unitPrice: 0.0,
              status: 'used',
            ))
        .toList();

    final imagePaths =
        (data['files'] as List<File>? ?? []).map((file) => file.path).toList();

    final cache = WorkOrderCompletionCacheModel(
      workOrderId: widget.workOrder.id,
      currentStep: _currentStep,
      customerName: data['customerName'],
      workLog: data['workLog'],
      partsUsed: cachedParts,
      images: imagePaths,
      signaturePath: data['signature']?.path,
      completionNotes: data['completionNotes'],
      lastUpdated: DateTime.now(),
    );

    await widget.cacheService.saveCache(cache);
  }

  void _handleClose() {
    _saveCache();
    Navigator.of(context).pop();
  }

  Future<void> _captureLocation() async {
    setState(() {
      _isCapturingLocation = true;
      _locationResult = null;
    });

    final result = await _locationService.getCurrentLocationEnhanced();

    if (mounted) {
      setState(() {
        _isCapturingLocation = false;
        _locationResult = result;
      });

      if (!result.isSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text(result.error?.message ?? 'Failed to capture location'),
            backgroundColor: Theme.of(context).colorScheme.error,
            action: SnackBarAction(
              label: 'Retry',
              onPressed: _captureLocation,
              textColor: Theme.of(context).colorScheme.onError,
            ),
          ),
        );
      }
    }
  }

  void _handleNext() async {
    final currentForm = _getCurrentForm();

    // Validate current step's form (if it has one)
    if (currentForm != null) {
      currentForm.markAllAsTouched();
      if (!currentForm.valid) {
        return;
      }
    }
    // Validate at least one image on step 3
    if (_currentStep == 2) {
      final rawValue = _step3Form.control('files').value;
      final files =
          rawValue is List ? rawValue.whereType<File>().toList() : <File>[];

      if (files.isEmpty) {
        if (mounted) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content:
                    const Text('At least one image is required to proceed'),
                backgroundColor: Theme.of(context).colorScheme.error,
                behavior: SnackBarBehavior.floating,
                duration: const Duration(seconds: 3),
              ),
            );
        }
        return;
      }
    }

    // Save progress
    await _saveCache();

    // If moving to step 5 (location + review), trigger location capture
    if (_currentStep == 3) {
      setState(() {
        _currentStep++;
      });
      _captureLocation();
    } else {
      setState(() {
        _currentStep++;
      });
    }
  }

  void _handleBack() {
    setState(() {
      _currentStep--;
    });
  }

  void _handleSkip() async {
    await _saveCache();
    setState(() {
      _currentStep++;
    });

    // If skipping to step 5, capture location
    if (_currentStep == 4) {
      _captureLocation();
    }
  }

  void _handleSubmit() {
    final data = WorkOrderForms.getCompleteFormData(
      _step1Form,
      _step2Form,
      _step3Form,
      _step4Form,
    );

    if (_locationResult == null || !_locationResult!.isSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Location must be captured before submitting'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
      return;
    }

    final location = _locationResult!.location!;
    final customerName = data['customerName'] as String;
    final workLog = data['workLog'] as String;
    final signature = data['signature'] as File;
    final partsUsed = (data['parts'] as List? ?? [])
        .map((p) => PartUsedEntity(
              partNumber: p['partNumber'],
              quantityUsed: p['quantity'],
              partName: p['partName'],
            ))
        .toList();
    final files = (data['files'] as List<File>?) ?? [];
    final completionNotes = data['completionNotes'] as String?;

    widget.bloc.add(
      WorkOrderActionEvent.completeWorkOrder(
        workOrderId: widget.workOrder.id,
        workLog: workLog,
        customerName: customerName,
        signature: signature,
        partsUsed: partsUsed,
        files: files,
        latitude: location.latitude,
        longitude: location.longitude,
        completionNotes: completionNotes,
      ),
    );
  }

  FormGroup? _getCurrentForm() {
    switch (_currentStep) {
      case 0:
        return _step1Form;
      case 1:
        return _step2Form;
      case 2:
        return _step3Form;
      case 3:
        return _step4Form;
      case 4:
        return null; // Step 5 has no form
      default:
        return null;
    }
  }

  bool _canSkipCurrentStep() {
    // Only steps 2 (parts) and 3 (images) can be skipped
    // return _currentStep == 1 || _currentStep == 2;
    return _currentStep == 1;
  }

  String _getStepTitle() {
    switch (_currentStep) {
      case 0:
        return 'Customer & Work Details';
      case 1:
        return 'Parts Used';
      case 2:
        return 'Work Images';
      case 3:
        return 'Customer Signature';
      case 4:
        return 'Location & Review';
      default:
        return '';
    }
  }

  String _getStepDescription() {
    switch (_currentStep) {
      case 0:
        return 'Enter customer information and work performed';
      case 1:
        return 'Add parts used (optional)';
      case 2:
        // return 'Capture images of completed work (optional)';
        return 'Capture images of completed work (required)';
      case 3:
        return 'Get customer signature and add notes';
      case 4:
        return 'Verify location and review all details';
      default:
        return '';
    }
  }

  void _handleAddPart(FormArray formArray) {
    if (_availableParts.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_isLoadingParts
              ? 'Loading parts, please wait...'
              : 'No parts available in inventory'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
      return;
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(DesignTokens.radiusLg.r)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) => Column(
          children: [
            Padding(
              padding: REdgeInsets.all(DesignTokens.space4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select Part',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
            Divider(height: DesignTokens.space1.h),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                padding: REdgeInsets.all(DesignTokens.space4),
                itemCount: _availableParts.length,
                itemBuilder: (context, index) {
                  final part = _availableParts[index];
                  final isOutOfStock = part.quantityAvailable <= 0;
                  return Opacity(
                    opacity: isOutOfStock ? 0.5 : 1.0,
                    child: Card(
                      margin: REdgeInsets.only(bottom: DesignTokens.space3),
                      color: isOutOfStock
                          ? Theme.of(context)
                              .colorScheme
                              .surfaceContainerHighest
                          : null,
                      child: ListTile(
                        title: Text(
                          part.partName,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RSizedBox(height: DesignTokens.space1),
                            // Text('Part #: ${part.partNumber}'),
                            Text(
                              'Part #: ${part.partNumber}',
                              style: TextStyle(
                                color: isOutOfStock
                                    ? Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withValues(alpha: 0.5)
                                    : null,
                              ),
                            ),
                            Text(
                              'Category: ${part.category}',
                              style: TextStyle(
                                  color: isOutOfStock
                                      ? Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withValues(alpha: 0.5)
                                      : null),
                            ),
                            Text(
                              'Available: ${part.quantityAvailable}',
                              style: TextStyle(
                                  color: isOutOfStock
                                      ? Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withValues(alpha: 0.5)
                                      : null),
                            ),
                            if (isOutOfStock) ...[
                              RSizedBox(height: DesignTokens.space1),
                              Text(
                                'OUT OF STOCK',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.error,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ],
                        ),
                        trailing: Icon(
                          isOutOfStock
                              ? Icons.block
                              : part.isInStock
                                  ? Icons.check_circle
                                  : part.isLowStock
                                      ? Icons.warning
                                      : Icons.cancel,
                          color: isOutOfStock
                              ? Theme.of(context)
                                  .colorScheme
                                  .error
                                  .withValues(alpha: 0.6)
                              : part.isInStock
                                  ? Colors.green
                                  : part.isLowStock
                                      ? Colors.orange
                                      : Colors.red,
                        ),
                        onTap: isOutOfStock
                            ? () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      '${part.partName} is currently out of stock',
                                    ),
                                    backgroundColor:
                                        Theme.of(context).colorScheme.error,
                                    behavior: SnackBarBehavior.floating,
                                    duration: const Duration(seconds: 2),
                                  ),
                                );
                              }
                            : () {
                                formArray.add(
                                  WorkOrderForms.createPartEntry(
                                    partNumber: part.partNumber,
                                    partName: part.partName,
                                    quantity: 1,
                                  ),
                                );
                                Navigator.pop(context);
                              },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleRemovePart(FormArray formArray, int index) {
    formArray.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return BlocConsumer<WorkOrderActionBloc, WorkOrderActionState>(
      bloc: widget.bloc,
      listener: (context, state) {
        state.maybeWhen(
          actionSuccess: (workOrder, actionType, message, groupedImages) {
            widget.cacheService.clearCache(widget.workOrder.id);
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: colorScheme.primary,
              ),
            );
          },
          error: (failure, workOrder, isOffline) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(failure.message),
                backgroundColor: colorScheme.error,
              ),
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Container(
          constraints: BoxConstraints(maxHeight: 0.9.sh),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(DesignTokens.radiusLg.r),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildHeader(theme, colorScheme),
              Divider(
                  height: DesignTokens.space1.h, color: colorScheme.outline),
              _buildStepHeader(theme, colorScheme),
              Divider(
                  height: DesignTokens.space1.h, color: colorScheme.outline),
              _buildProgressIndicator(theme, colorScheme),
              Flexible(child: _buildStepContent()),
              _buildNavigationButtons(theme, colorScheme, state),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader(ThemeData theme, ColorScheme colorScheme) {
    return Padding(
      padding: REdgeInsets.all(DesignTokens.space4),
      child: Row(
        children: [
          Icon(Icons.check_circle,
              color: colorScheme.primary, size: DesignTokens.iconLg.sp),
          RSizedBox(width: DesignTokens.space3),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Complete Work Order',
                    style: theme.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600)),
                Text('Work Order #${widget.workOrder.id}',
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: colorScheme.onSurfaceVariant)),
              ],
            ),
          ),
          IconButton(
            onPressed: _handleClose,
            icon: Icon(Icons.close, color: colorScheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }

  Widget _buildStepHeader(ThemeData theme, ColorScheme colorScheme) {
    return Padding(
      padding: REdgeInsets.symmetric(
          horizontal: DesignTokens.space4, vertical: DesignTokens.space3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Step ${_currentStep + 1} of 5',
                style: theme.textTheme.labelMedium
                    ?.copyWith(color: colorScheme.primary),
              ),
              if (_canSkipCurrentStep()) ...[
                RSizedBox(width: DesignTokens.space2),
                Container(
                  padding: REdgeInsets.symmetric(
                    horizontal: DesignTokens.space2,
                    vertical: DesignTokens.space1,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.secondaryContainer,
                    borderRadius:
                        BorderRadius.circular(DesignTokens.radiusSm.r),
                  ),
                  child: Text(
                    'Optional',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSecondaryContainer,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ],
          ),
          RSizedBox(height: DesignTokens.space1),
          Text(
            _getStepTitle(),
            style: theme.textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          RSizedBox(height: DesignTokens.space1),
          Text(
            _getStepDescription(),
            style: theme.textTheme.bodyMedium
                ?.copyWith(color: colorScheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator(ThemeData theme, ColorScheme colorScheme) {
    return Padding(
      padding: REdgeInsets.symmetric(
          horizontal: DesignTokens.space4, vertical: DesignTokens.space2),
      child: Row(
        children: List.generate(5, (index) {
          final isCompleted = index < _currentStep;
          final isActive = index == _currentStep;

          return Expanded(
            child: Container(
              height: DesignTokens.space1.h,
              margin:
                  REdgeInsets.only(right: index < 4 ? DesignTokens.space1 : 0),
              decoration: BoxDecoration(
                color: isCompleted || isActive
                    ? colorScheme.primary
                    : colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(DesignTokens.radiusFull.r),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildStepContent() {
    final viewInsets = MediaQuery.of(context).viewInsets;

    return ListView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: EdgeInsets.only(
        left: DesignTokens.space4,
        right: DesignTokens.space4,
        top: DesignTokens.space4,
        bottom: DesignTokens.space4 + viewInsets.bottom,
      ),
      children: [
        if (_currentStep == 0) _buildStep1Content(),
        if (_currentStep == 1) _buildStep2Content(),
        if (_currentStep == 2) _buildStep3Content(),
        if (_currentStep == 3) _buildStep4Content(),
        if (_currentStep == 4) _buildStep5Content(),
      ],
    );
  }

  // Step 1: Customer Info + Work Log
  Widget _buildStep1Content() {
    final theme = Theme.of(context);

    return ReactiveForm(
      formGroup: _step1Form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReactiveTextInput(
            formControlName: 'customerName',
            hint: 'Enter customer name',
            label: 'Customer Name',
            prefixIcon: Icons.person,
          ),
          DesignTokens.verticalSpaceLarge,
          ReactiveMultilineInput(
            formControlName: 'workLog',
            hint: 'Describe the work performed in detail...',
            label: 'Work Log Summary',
            minLines: 5,
            maxLines: 10,
          ),
          DesignTokens.verticalSpaceSmall,
          Text(
            'Minimum 20 characters required',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  // Step 2: Parts Selection
  Widget _buildStep2Content() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ReactiveForm(
      formGroup: _step2Form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Parts Used',
                style: theme.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              ReactiveFormArray(
                formArrayName: 'parts',
                builder: (context, formArray, child) {
                  return FilledButton.tonalIcon(
                    onPressed: () => _handleAddPart(formArray),
                    icon: Icon(Icons.add, size: DesignTokens.iconSm.sp),
                    label: const Text('Add Part'),
                  );
                },
              ),
            ],
          ),
          DesignTokens.verticalSpaceMedium,
          ReactiveFormArray(
            formArrayName: 'parts',
            builder: (context, formArray, child) {
              if (formArray.value == null ||
                  (formArray.value as List).isEmpty) {
                return Container(
                  padding: REdgeInsets.all(DesignTokens.space6),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest,
                    borderRadius:
                        BorderRadius.circular(DesignTokens.radiusMd.r),
                    border: Border.all(
                      color: colorScheme.outline.withValues(alpha: 0.3),
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.inventory_2_outlined,
                        size: DesignTokens.iconLg.sp,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      DesignTokens.verticalSpaceSmall,
                      Text(
                        'No parts added',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      DesignTokens.verticalSpaceSmall,
                      Text(
                        'Tap "Add Part" to select parts from inventory',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return Column(
                children: List.generate(
                  formArray.controls.length,
                  (index) =>
                      _buildPartCard(formArray, index, theme, colorScheme),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPartCard(FormArray formArray, int index, ThemeData theme,
      ColorScheme colorScheme) {
    final partGroup = formArray.controls[index] as FormGroup;
    final partNumber = partGroup.control('partNumber').value as String? ?? '';
    final partName = partGroup.control('partName').value as String? ?? '';

    return ReactiveForm(
      formGroup: partGroup,
      child: Card(
        margin: REdgeInsets.only(bottom: DesignTokens.space3),
        child: Padding(
          padding: REdgeInsets.all(DesignTokens.space4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          partName.isNotEmpty ? partName : 'Part ${index + 1}',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (partNumber.isNotEmpty) ...[
                          RSizedBox(height: DesignTokens.space1),
                          Text(
                            'Part #: $partNumber',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => _handleRemovePart(formArray, index),
                    icon: const Icon(Icons.delete),
                    color: colorScheme.error,
                  ),
                ],
              ),
              DesignTokens.verticalSpaceMedium,
              ReactiveTextInput(
                formControlName: 'quantity',
                label: 'Quantity Used',
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Step 3: Work Images
  Widget _buildStep3Content() {
    final theme = Theme.of(context);

    return ReactiveForm(
      formGroup: _step3Form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Capture Images',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                TextSpan(
                  text: ' *',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          DesignTokens.verticalSpaceSmall,
          Text(
            'Take photos documenting the completed work (required)',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          DesignTokens.verticalSpaceLarge,
          ReactiveImagePicker(
            formControlName: 'files',
            maxImages: 10,
          ),
        ],
      ),
    );
  }

  // Step 4: Signature + Notes
  Widget _buildStep4Content() {
    final theme = Theme.of(context);

    return ReactiveForm(
      formGroup: _step4Form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Customer Signature',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          DesignTokens.verticalSpaceSmall,
          Text(
            'Collect customer signature to confirm completion',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          DesignTokens.verticalSpaceLarge,
          ReactiveSignaturePad(formControlName: 'signature'),
          DesignTokens.verticalSpaceLarge,
          // ReactiveMultilineInput(
          //   formControlName: 'completionNotes',
          //   hint: 'Add any additional notes or observations...',
          //   label: 'Completion Notes (Optional)',
          //   minLines: 3,
          //   maxLines: 5,
          // ),
        ],
      ),
    );
  }

  // Step 5: Location + Review
  Widget _buildStep5Content() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final fsmTheme = context.fsmTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Location Capture Section
        Container(
          padding: REdgeInsets.all(DesignTokens.space4),
          decoration: BoxDecoration(
            color: _locationResult?.isSuccess == true
                ? fsmTheme.statusCompleted.withValues(alpha: 0.1)
                : colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
            border: Border.all(
              color: _locationResult?.isSuccess == true
                  ? fsmTheme.statusCompleted
                  : colorScheme.outline.withValues(alpha: 0.3),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    _isCapturingLocation
                        ? Icons.location_searching
                        : _locationResult?.isSuccess == true
                            ? Icons.location_on
                            : Icons.location_off,
                    color: _isCapturingLocation
                        ? colorScheme.primary
                        : _locationResult?.isSuccess == true
                            ? fsmTheme.statusCompleted
                            : colorScheme.error,
                    size: DesignTokens.iconMd.sp,
                  ),
                  RSizedBox(width: DesignTokens.space2),
                  Text(
                    _isCapturingLocation
                        ? 'Capturing Location...'
                        : _locationResult?.isSuccess == true
                            ? 'Location Captured'
                            : 'Location Required',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              if (_isCapturingLocation) ...[
                DesignTokens.verticalSpaceMedium,
                LinearProgressIndicator(
                  borderRadius:
                      BorderRadius.circular(DesignTokens.radiusFull.r),
                ),
              ],
              if (_locationResult != null) ...[
                DesignTokens.verticalSpaceSmall,
                if (_locationResult!.isSuccess) ...[
                  Text(
                    'Lat: ${_locationResult!.location!.latitude.toStringAsFixed(6)}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontFamily: 'monospace',
                    ),
                  ),
                  Text(
                    'Lng: ${_locationResult!.location!.longitude.toStringAsFixed(6)}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontFamily: 'monospace',
                    ),
                  ),
                  if (_locationResult!.location!.accuracy != null) ...[
                    Text(
                      'Accuracy: ${_locationResult!.location!.accuracy!.toStringAsFixed(1)}m',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ] else ...[
                  Text(
                    _locationResult!.error?.message ??
                        'Failed to capture location',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.error,
                    ),
                  ),
                  DesignTokens.verticalSpaceSmall,
                  FilledButton.tonalIcon(
                    onPressed: _captureLocation,
                    icon: Icon(Icons.refresh, size: DesignTokens.iconSm.sp),
                    label: const Text('Retry'),
                  ),
                ],
              ],
            ],
          ),
        ),
        DesignTokens.verticalSpaceLarge,

        // Review Summary Section
        Text(
          'Review Summary',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        DesignTokens.verticalSpaceSmall,
        Text(
          'Please review all information before submitting',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        DesignTokens.verticalSpaceMedium,

        _buildReviewCard(
          icon: Icons.person,
          title: 'Customer',
          value: _step1Form.control('customerName').value?.toString() ??
              'Not provided',
          onEdit: () => setState(() => _currentStep = 0),
        ),
        _buildReviewCard(
          icon: Icons.description,
          title: 'Work Log',
          value:
              _step1Form.control('workLog').value?.toString() ?? 'Not provided',
          maxLines: 3,
          onEdit: () => setState(() => _currentStep = 0),
        ),
        _buildReviewCard(
          icon: Icons.inventory,
          title: 'Parts Used',
          value: () {
            final partsArray = _step2Form.control('parts') as FormArray;
            if (partsArray.controls.isEmpty) return 'No parts added';
            return '${partsArray.controls.length} part(s) selected';
          }(),
          onEdit: () => setState(() => _currentStep = 1),
        ),
        _buildReviewCard(
          icon: Icons.image,
          title: 'Images',
          value: () {
            final files = _step3Form.control('files').value as List<File>?;
            if (files == null || files.isEmpty) return 'No images captured';
            return '${files.length} image(s) attached';
          }(),
          onEdit: () => setState(() => _currentStep = 2),
        ),
        _buildReviewCard(
          icon: Icons.draw,
          title: 'Signature',
          value: _step4Form.control('signature').value != null
              ? 'Signature captured'
              : 'Not captured',
          onEdit: () => setState(() => _currentStep = 3),
        ),
      ],
    );
  }

  Widget _buildReviewCard({
    required IconData icon,
    required String title,
    required String value,
    int maxLines = 1,
    required VoidCallback onEdit,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      margin: REdgeInsets.only(bottom: DesignTokens.space3),
      child: Padding(
        padding: REdgeInsets.all(DesignTokens.space4),
        child: Row(
          children: [
            Icon(icon,
                size: DesignTokens.iconMd.sp,
                color: colorScheme.onSurfaceVariant),
            RSizedBox(width: DesignTokens.space3),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  RSizedBox(height: DesignTokens.space1),
                  Text(
                    value,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: maxLines,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: onEdit,
              icon: const Icon(Icons.edit),
              color: colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButtons(
      ThemeData theme, ColorScheme colorScheme, WorkOrderActionState state) {
    final isLastStep = _currentStep == 4;
    final isLoading = state.maybeWhen(
      actionInProgress: (_, __, ___) => true,
      orElse: () => false,
    );

    return Container(
      padding: REdgeInsets.all(DesignTokens.space4),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: colorScheme.outline.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          if (_currentStep > 0)
            Expanded(
              child: OutlinedButton(
                onPressed: isLoading ? null : _handleBack,
                child: const Text('Back'),
              ),
            ),
          if (_currentStep > 0) RSizedBox(width: DesignTokens.space3),
          if (_canSkipCurrentStep())
            // Expanded(
            //   child: OutlinedButton(
            //     onPressed: isLoading ? null : _handleSkip,
            //     child: const Text('Skip'),
            //   ),
            // ),
            if (_canSkipCurrentStep()) RSizedBox(width: DesignTokens.space3),
          Expanded(
            child: FilledButton(
              onPressed: isLoading
                  ? null
                  : isLastStep
                      ? (_locationResult?.isSuccess == true
                          ? _handleSubmit
                          : null)
                      : _handleNext,
              child: isLoading
                  ? SizedBox(
                      height: DesignTokens.iconSm.h,
                      width: DesignTokens.iconSm.w,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.w,
                        color: colorScheme.onPrimary,
                      ),
                    )
                  : Text(isLastStep ? 'Submit' : 'Next'),
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
    _step4Form.dispose();
    super.dispose();
  }
}
