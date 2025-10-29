import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:easy_stepper/easy_stepper.dart';

import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/core/di/injection.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/location_entity.dart';
import 'package:fsm/features/parts/domain/entities/part_entity.dart';
import 'package:fsm/features/work_orders/data/services/work_order_completion_cache_service.dart';
import 'package:fsm/features/work_orders/data/models/work_order_completion_cache_model.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_order_action/work_order_action_bloc.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_order_action/work_order_action_event.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_order_action/work_order_action_state.dart';

import 'completion_steps/work_and_parts_step.dart';
import 'completion_steps/images_step.dart';
import 'completion_steps/review_and_submit_step.dart';

/// Multi-step work order completion form with local caching
/// Step 1: Work Log + Parts Used
/// Step 2: Images (Optional)
/// Step 3: Location + Customer Name + Signature + Review
class WorkOrderCompleteBottomSheetNew extends StatefulWidget {
  final WorkOrderEntity workOrder;
  final LocationEntity? currentLocation;

  const WorkOrderCompleteBottomSheetNew({
    super.key,
    required this.workOrder,
    this.currentLocation,
  });

  @override
  State<WorkOrderCompleteBottomSheetNew> createState() =>
      _WorkOrderCompleteBottomSheetNewState();
}

class _WorkOrderCompleteBottomSheetNewState
    extends State<WorkOrderCompleteBottomSheetNew> {
  // Services
  final _cacheService = getIt<WorkOrderCompletionCacheService>();

  // Controllers
  final TextEditingController _customerNameController = TextEditingController();
  final TextEditingController _workLogController = TextEditingController();
  final TextEditingController _completionNotesController =
      TextEditingController();

  // Form keys
  final GlobalKey<FormState> _workAndPartsFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _reviewFormKey = GlobalKey<FormState>();
  final GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();

  // State
  int _activeStep = 0;
  final List<XFile> _imageFiles = [];
  final List<PartUsedInput> _partsUsed = [];
  bool _hasSignature = false;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _loadCache();
  }

  @override
  void dispose() {
    _customerNameController.dispose();
    _workLogController.dispose();
    _completionNotesController.dispose();
    for (final part in _partsUsed) {
      part.dispose();
    }
    super.dispose();
  }

  /// Load cached data if exists
  Future<void> _loadCache() async {
    try {
      final cache = await _cacheService.loadCache(widget.workOrder.id);
      if (cache != null && mounted) {
        setState(() {
          _activeStep = cache.currentStep;
          _customerNameController.text = cache.customerName ?? '';
          _workLogController.text = cache.workLog ?? '';
          _completionNotesController.text = cache.completionNotes ?? '';

          // Load parts - reconstruct PartEntity from cache
          _partsUsed.clear();
          for (final cachedPart in cache.partsUsed) {
            final partEntity = PartEntity(
              partNumber: cachedPart.partNumber,
              partName: cachedPart.partName,
              category: cachedPart.category,
              quantityAvailable: cachedPart.quantityAvailable,
              unitPrice: cachedPart.unitPrice,
              status: _parsePartStatus(cachedPart.status),
            );
            _partsUsed.add(PartUsedInput(
              part: partEntity,
              quantityController:
                  TextEditingController(text: cachedPart.quantity.toString()),
            ));
          }

          // Load images
          _imageFiles.clear();
          for (final imagePath in cache.images) {
            final file = File(imagePath);
            if (file.existsSync()) {
              _imageFiles.add(XFile(imagePath));
            }
          }

          // Load signature if exists
          if (cache.signaturePath != null) {
            final signatureFile = File(cache.signaturePath!);
            if (signatureFile.existsSync()) {
              _hasSignature = true;
            }
          }

          _isInitialized = true;
        });

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Previous progress restored'),
              backgroundColor: AppColors.success,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              margin: EdgeInsets.all(16.w),
              duration: const Duration(seconds: 2),
            ),
          );
        }
      } else {
        setState(() {
          _isInitialized = true;
        });
      }
    } catch (e) {
      setState(() {
        _isInitialized = true;
      });
      debugPrint('Error loading cache: $e');
    }
  }

  PartStatus _parsePartStatus(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return PartStatus.active;
      case 'inactive':
        return PartStatus.inactive;
      case 'discontinued':
        return PartStatus.discontinued;
      case 'backordered':
        return PartStatus.backordered;
      default:
        return PartStatus.active;
    }
  }

  /// Save current progress to cache
  Future<void> _saveCache() async {
    try {
      // Get signature path if exists
      String? signaturePath;
      if (_hasSignature) {
        final signatureFile = await _saveSignatureAsFile();
        signaturePath = signatureFile?.path;
      }

      final cache = WorkOrderCompletionCacheModel(
        workOrderId: widget.workOrder.id,
        currentStep: _activeStep,
        customerName: _customerNameController.text.trim().isEmpty
            ? null
            : _customerNameController.text.trim(),
        workLog: _workLogController.text.trim().isEmpty
            ? null
            : _workLogController.text.trim(),
        partsUsed: _partsUsed
            .where((part) => part.quantityController.text.trim().isNotEmpty)
            .map((part) => CachedPartUsedModel(
                  partNumber: part.part.partNumber,
                  quantity:
                      int.tryParse(part.quantityController.text.trim()) ?? 1,
                  partName: part.part.partName,
                  category: part.part.category,
                  quantityAvailable: part.part.quantityAvailable,
                  unitPrice: part.part.unitPrice,
                  status: part.part.status.name,
                ))
            .toList(),
        images: _imageFiles.map((xFile) => xFile.path).toList(),
        signaturePath: signaturePath,
        completionNotes: _completionNotesController.text.trim().isEmpty
            ? null
            : _completionNotesController.text.trim(),
        lastUpdated: DateTime.now(),
      );

      await _cacheService.saveCache(cache);
    } catch (e) {
      debugPrint('Error saving cache: $e');
    }
  }

  /// Validate and move to next step
  Future<void> _nextStep() async {
    // Step 0: Work Log and Parts - validate form
    if (_activeStep == 0) {
      if (_workAndPartsFormKey.currentState?.validate() != true) {
        return;
      }
    }

    // Save cache before moving to next step
    await _saveCache();

    if (_activeStep < 2) {
      setState(() {
        _activeStep++;
      });
    }
  }

  /// Move to previous step
  void _previousStep() {
    if (_activeStep > 0) {
      setState(() {
        _activeStep--;
      });
    }
  }

  // Part management methods
  void _addPartUsed(PartUsedInput partInput) {
    setState(() {
      _partsUsed.add(partInput);
    });
  }

  void _removePartUsed(int index) {
    setState(() {
      _partsUsed[index].dispose();
      _partsUsed.removeAt(index);
    });
  }

  // Image management methods
  void _addImage(XFile image) {
    setState(() {
      _imageFiles.add(image);
    });
  }

  void _removeImage(int index) {
    setState(() {
      _imageFiles.removeAt(index);
    });
  }

  // Signature management methods
  void _onSignatureDrawn() {
    setState(() {
      _hasSignature = true;
    });
  }

  void _clearSignature() {
    _signaturePadKey.currentState?.clear();
    setState(() {
      _hasSignature = false;
    });
  }

  Future<File?> _saveSignatureAsFile() async {
    try {
      if (_signaturePadKey.currentState == null) {
        throw Exception('Signature pad is not initialized');
      }

      final signatureData =
          await _signaturePadKey.currentState!.toImage(pixelRatio: 3.0);
      final byteData =
          await signatureData.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) {
        throw Exception('Failed to convert signature to image data');
      }

      final buffer = byteData.buffer.asUint8List();
      if (buffer.isEmpty) {
        throw Exception('Signature image is empty');
      }

      final tempDir = await getTemporaryDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final file = File('${tempDir.path}/signature_$timestamp.png');
      await file.writeAsBytes(buffer);

      if (!await file.exists() || await file.length() == 0) {
        throw Exception('Failed to save signature file');
      }

      return file;
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to save signature: ${e.toString()}'),
            backgroundColor: AppColors.error,
          ),
        );
      }
      return null;
    }
  }

  Future<void> _completeWorkOrder() async {
    // Note: _workAndPartsFormKey validation is skipped here because:
    // 1. It was already validated when moving from Step 0 to Step 1
    // 2. The widget is not rendered on Step 2, so currentState would be null
    // 3. We validate the review form (Step 2) below
    
    if (_reviewFormKey.currentState?.validate() != true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please complete required fields'),
          backgroundColor: AppColors.warning,
        ),
      );
      return;
    }

    if (!_hasSignature) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
              'Customer signature is required to complete the work order'),
          backgroundColor: AppColors.warning,
        ),
      );
      return;
    }

    if (widget.currentLocation == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please wait for location to be captured'),
          backgroundColor: AppColors.warning,
        ),
      );
      return;
    }

    // Save signature as file
    final signatureFile = await _saveSignatureAsFile();
    if (signatureFile == null) {
      return;
    }

    // Convert image files
    final files = _imageFiles.map((xFile) => File(xFile.path)).toList();

    // Parse parts used
    final partsUsed = _partsUsed
        .where((part) => part.quantityController.text.trim().isNotEmpty)
        .map((part) => PartUsedEntity(
              partNumber: part.part.partNumber,
              quantityUsed:
                  int.tryParse(part.quantityController.text.trim()) ?? 0,
              partName: part.part.partName,
            ))
        .toList();

    if (!mounted) return;

    // Trigger completion
    context.read<WorkOrderActionBloc>().add(
          WorkOrderActionEvent.completeWorkOrder(
            workOrderId: widget.workOrder.id,
            workLog: _workLogController.text.trim(),
            customerName: _customerNameController.text.trim(),
            signature: signatureFile,
            partsUsed: partsUsed,
            files: files,
            latitude: widget.currentLocation!.latitude,
            longitude: widget.currentLocation!.longitude,
            completionNotes: _completionNotesController.text.trim().isEmpty
                ? null
                : _completionNotesController.text.trim(),
          ),
        );

    // Clear cache on successful submission
    await _cacheService.clearCache(widget.workOrder.id);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (!_isInitialized) {
      return Container(
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        child: SafeArea(
          child: SizedBox(
            height: 400.h,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      );
    }

    return PopScope(
      canPop: false,
      child: BlocConsumer<WorkOrderActionBloc, WorkOrderActionState>(
        listener: (context, state) {
          state.maybeWhen(
            actionSuccess: (workOrder, actionType, message, _) {
              Navigator.of(context).pop(true);
            },
            error: (failure, workOrder, isOffline) {},
            locationError: (workOrder, message) {},
            orElse: () {},
          );
        },
        builder: (context, state) {
          final isLoading = state.maybeWhen(
            actionInProgress: (_, __, ___) => true,
            orElse: () => false,
          );

          return Container(
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Handle bar
                Container(
                  margin: EdgeInsets.only(top: 12.h),
                  width: 40.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),

                // Header
                Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Row(
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.w,
                        decoration: BoxDecoration(
                          color: AppColors.success.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12.r),
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
                              ),
                            ),
                            Text(
                              widget.workOrder.woNumber,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: theme.colorScheme.onSurface
                                    .withValues(alpha: 0.6),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Stepper
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: EasyStepper(
                    activeStep: _activeStep,
                    lineStyle: const LineStyle(
                      lineLength: 80,
                      lineThickness: 2,
                      lineSpace: 4,
                      lineType: LineType.normal,
                      unreachedLineColor: Colors.grey,
                      finishedLineColor: AppColors.success,
                      activeLineColor: AppColors.primary,
                    ),
                    activeStepBorderColor: AppColors.primary,
                    activeStepIconColor: AppColors.primary,
                    activeStepTextColor: AppColors.primary,
                    finishedStepBorderColor: AppColors.success,
                    finishedStepIconColor: AppColors.success,
                    finishedStepTextColor: AppColors.success,
                    internalPadding: 8,
                    showLoadingAnimation: false,
                    stepRadius: 24,
                    showStepBorder: true,
                    steps: [
                      EasyStep(
                        icon: const Icon(Icons.edit_note),
                        title: 'Work & Parts',
                        lineText: 'Step 1/3',
                      ),
                      EasyStep(
                        icon: const Icon(Icons.photo_camera),
                        title: 'Images',
                        lineText: 'Step 2/3',
                      ),
                      EasyStep(
                        icon: const Icon(Icons.how_to_reg),
                        title: 'Review',
                        lineText: 'Step 3/3',
                      ),
                    ],
                    onStepReached: (index) {
                      setState(() {
                        _activeStep = index;
                      });
                    },
                  ),
                ),

                SizedBox(height: 20.h),

                // Content
                Flexible(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        // Time info (only show on step 3)
                        if (_activeStep == 2) ...[
                          _buildInfoCards(theme),
                          SizedBox(height: 20.h),
                        ],

                        // Step content
                        if (_activeStep == 0)
                          WorkAndPartsStep(
                            workLogController: _workLogController,
                            formKey: _workAndPartsFormKey,
                            partsUsed: _partsUsed,
                            onAddPart: _addPartUsed,
                            onRemovePart: _removePartUsed,
                          ),
                        if (_activeStep == 1)
                          ImagesStep(
                            imageFiles: _imageFiles,
                            onAddImage: _addImage,
                            onRemoveImage: _removeImage,
                          ),
                        if (_activeStep == 2)
                          ReviewAndSubmitStep(
                            customerNameController: _customerNameController,
                            workLogController: _workLogController,
                            completionNotesController:
                                _completionNotesController,
                            signaturePadKey: _signaturePadKey,
                            hasSignature: _hasSignature,
                            onSignatureDrawn: _onSignatureDrawn,
                            onClearSignature: _clearSignature,
                            currentLocation: widget.currentLocation,
                            partsUsed: _partsUsed,
                            imageFiles: _imageFiles,
                            formKey: _reviewFormKey,
                          ),

                        SizedBox(height: 24.h),

                        // Navigation Buttons
                        _buildNavigationButtons(isLoading),

                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
        },
      ),
    );
  }

  Widget _buildInfoCards(ThemeData theme) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.outline.withOpacity(0.2),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.access_time,
            size: 20.sp,
            color: AppColors.success,
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Completion Time',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: theme.colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
              Text(
                DateFormat('MMM dd, yyyy HH:mm').format(DateTime.now()),
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationButtons(bool isLoading) {
    return Row(
      children: [
        // Back button (only show if not on first step)
        if (_activeStep > 0)
          Expanded(
            child: OutlinedButton(
              onPressed: isLoading ? null : _previousStep,
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
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

        if (_activeStep > 0) SizedBox(width: 12.w),

        // Next/Complete button
        Expanded(
          flex: _activeStep > 0 ? 2 : 1,
          child: ElevatedButton(
            onPressed: isLoading
                ? null
                : _activeStep < 2
                    ? () => _nextStep()
                    : () => _completeWorkOrder(),
            style: ElevatedButton.styleFrom(
              backgroundColor: _activeStep < 2
                  ? AppColors.primary
                  : AppColors.success,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              elevation: 2,
            ),
            child: isLoading
                ? SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Text(
                    _activeStep < 2 ? 'Next' : 'Review and Submit',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
