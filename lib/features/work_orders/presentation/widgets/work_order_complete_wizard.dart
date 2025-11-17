// // import 'dart:io';
// //
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// //
// // import 'package:reactive_forms/reactive_forms.dart';
// //
// // import '../../../../core/di/injection.dart';
// // import '../../../../core/theme/design_tokens.dart';
// // import '../../../../core/widgets/form/location_status_widget.dart';
// // import '../../../../core/widgets/form/reactive_image_picker.dart';
// // import '../../../../core/widgets/form/reactive_multiline_input.dart';
// // import '../../../../core/widgets/form/reactive_signature_pad.dart';
// // import '../../../../core/widgets/form/reactive_text_input.dart';
// // import '../../data/models/work_order_completion_cache_model.dart';
// // import '../../data/services/work_order_completion_cache_service.dart';
// // import '../../domain/entities/location_entity.dart';
// // import '../../domain/entities/work_order_entity.dart';
// // import '../blocs/work_order_action/work_order_action_bloc.dart';
// //
// // import '../blocs/work_order_action/work_order_action_state.dart';
// // import '../forms/work_order_forms.dart';
// //
// // /// Wizard-style completion flow with three sequential sheets
// // class WorkOrderCompleteWizard extends StatefulWidget {
// //   final WorkOrderEntity workOrder;
// //   final LocationEntity? location;
// //   final WorkOrderActionBloc bloc;
// //   final WorkOrderCompletionCacheService cacheService;
// //
// //   const WorkOrderCompleteWizard({
// //     super.key,
// //     required this.workOrder,
// //     required this.location,
// //     required this.bloc,
// //     required this.cacheService,
// //   });
// //
// //   /// Factory method to show the wizard
// //   static Future<void> show({
// //     required BuildContext context,
// //     required WorkOrderEntity workOrder,
// //     LocationEntity? location,
// //   }) async {
// //     final bloc = context.read<WorkOrderActionBloc>();
// //     final cacheService = getIt<WorkOrderCompletionCacheService>();
// //
// //     await showModalBottomSheet(
// //       context: context,
// //       isScrollControlled: true,
// //       backgroundColor: Colors.transparent,
// //       isDismissible: false,
// //       enableDrag: false,
// //       builder: (bottomSheetContext) => BlocProvider.value(
// //         value: bloc,
// //         child: WorkOrderCompleteWizard(
// //           workOrder: workOrder,
// //           location: location,
// //           bloc: bloc,
// //           cacheService: cacheService,
// //         ),
// //       ),
// //     );
// //   }
// //
// //   @override
// //   State<WorkOrderCompleteWizard> createState() =>
// //       _WorkOrderCompleteWizardState();
// // }
// //
// // class _WorkOrderCompleteWizardState extends State<WorkOrderCompleteWizard> {
// //   int _currentStep = 0;
// //   late FormGroup _step1Form;
// //   late FormGroup _step2Form;
// //   late FormGroup _step3Form;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _initializeForms();
// //     _loadCachedData();
// //   }
// //
// //   void _initializeForms() {
// //     _step1Form = WorkOrderForms.buildCompleteFormStep1();
// //     _step2Form = WorkOrderForms.buildCompleteFormStep2();
// //     _step3Form = WorkOrderForms.buildCompleteFormStep3();
// //   }
// //
// //   Future<void> _loadCachedData() async {
// //     final cache = await widget.cacheService.loadCache(widget.workOrder.id);
// //     if (cache != null && mounted) {
// //       setState(() {
// //         _currentStep = cache.currentStep;
// //       });
// //
// //       // Restore Step 1 data
// //       if (cache.workLog != null) {
// //         _step1Form.control('workLog').value = cache.workLog;
// //       }
// //
// //       // Restore parts
// //       if (cache.partsUsed.isNotEmpty) {
// //         final partsArray = _step1Form.control('parts') as FormArray;
// //         partsArray.clear();
// //         for (final cachedPart in cache.partsUsed) {
// //           final partGroup = WorkOrderForms.createPartEntry(
// //             partNumber: cachedPart.partNumber,
// //             partName: cachedPart.partName,
// //             quantity: cachedPart.quantity,
// //           );
// //           partsArray.add(partGroup);
// //         }
// //       }
// //
// //       // Restore Step 2 data (images)
// //       if (cache.images.isNotEmpty) {
// //         final imageFiles = cache.images.map((path) => File(path)).toList();
// //         _step2Form.control('files').value = imageFiles;
// //       }
// //
// //       // Restore Step 3 data
// //       if (cache.customerName != null) {
// //         _step3Form.control('customerName').value = cache.customerName;
// //       }
// //       if (cache.completionNotes != null) {
// //         _step3Form.control('completionNotes').value = cache.completionNotes;
// //       }
// //       if (cache.signaturePath != null) {
// //         final signatureFile = File(cache.signaturePath!);
// //         if (await signatureFile.exists()) {
// //           _step3Form.control('signature').value = signatureFile;
// //         }
// //       }
// //     }
// //   }
// //
// //   Future<void> _saveCache() async {
// //     final step1Data =
// //         WorkOrderForms.getCompleteFormData(_step1Form, _step2Form, _step3Form);
// //
// //     // Convert parts to cached model
// //     final cachedParts = (step1Data['partsUsed'] as List<PartUsedEntity>?)
// //             ?.map((part) => CachedPartUsedModel(
// //                   partNumber: part.partNumber,
// //                   quantity: part.quantityUsed,
// //                   partName: part.partName ?? '',
// //                   category: '',
// //                   quantityAvailable: 0,
// //                   unitPrice: 0.0,
// //                   status: 'used',
// //                 ))
// //             .toList() ??
// //         [];
// //
// //     // Get image paths
// //     final imagePaths = (step1Data['files'] as List<File>?)
// //             ?.map((file) => file.path)
// //             .toList() ??
// //         [];
// //
// //     final cache = WorkOrderCompletionCacheModel(
// //       workOrderId: widget.workOrder.id,
// //       currentStep: _currentStep,
// //       workLog: step1Data['workLog'],
// //       partsUsed: cachedParts,
// //       images: imagePaths,
// //       customerName: step1Data['customerName'],
// //       signaturePath: step1Data['signature']?.path,
// //       completionNotes: step1Data['completionNotes'],
// //       lastUpdated: DateTime.now(),
// //     );
// //
// //     await widget.cacheService.saveCache(cache);
// //   }
// //
// //   void _handleClose() {
// //     _saveCache();
// //     Navigator.of(context).pop();
// //   }
// //
// //   void _handleAddPart(FormArray formArray) {
// //     formArray.add(WorkOrderForms.createPartEntry(
// //       partNumber: '',
// //       partName: '',
// //       quantity: 1,
// //     ));
// //   }
// //
// //   void _handleRemovePart(FormArray formArray, int index) {
// //     formArray.removeAt(index);
// //   }
// //
// //   FormGroup _getCurrentForm() {
// //     switch (_currentStep) {
// //       case 0:
// //         return _step1Form;
// //       case 1:
// //         return _step2Form;
// //       case 2:
// //         return _step3Form;
// //       default:
// //         return _step1Form;
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final theme = Theme.of(context);
// //     final colorScheme = theme.colorScheme;
// //
// //     return BlocConsumer<WorkOrderActionBloc, WorkOrderActionState>(
// //       bloc: widget.bloc,
// //       listener: (context, state) {
// //         state.maybeWhen(
// //           actionSuccess: (workOrder, actionType, message, groupedImages) {
// //             // Clear cache on success
// //             widget.cacheService.clearCache(widget.workOrder.id);
// //             Navigator.of(context).pop();
// //             ScaffoldMessenger.of(context).showSnackBar(
// //               SnackBar(
// //                 content: Text(message),
// //                 backgroundColor: colorScheme.primary,
// //               ),
// //             );
// //           },
// //           error: (failure, workOrder, isOffline) {
// //             ScaffoldMessenger.of(context).showSnackBar(
// //               SnackBar(
// //                 content: Text(failure.message),
// //                 backgroundColor: colorScheme.error,
// //               ),
// //             );
// //           },
// //           orElse: () {},
// //         );
// //       },
// //       builder: (context, state) {
// //         state.maybeWhen(
// //           actionInProgress: (_, __, ___) => true,
// //           orElse: () => false,
// //         );
// //
// //         return Container(
// //           constraints: BoxConstraints(
// //             maxHeight: 0.9.sh,
// //           ),
// //           decoration: BoxDecoration(
// //             color: colorScheme.surface,
// //             borderRadius: BorderRadius.vertical(
// //               top: Radius.circular(DesignTokens.radiusLg.r),
// //             ),
// //           ),
// //           child: Column(
// //             mainAxisSize: MainAxisSize.min,
// //             children: [
// //               // Header
// //               _buildHeader(theme, colorScheme),
// //
// //               Divider(height: 1.h, color: colorScheme.outline),
// //
// //               // Progress indicator
// //               _buildProgressIndicator(theme, colorScheme),
// //
// //               // Content
// //               Flexible(
// //                 child: _buildStepContent(),
// //               ),
// //
// //               // Navigation buttons
// //               // _buildNavigationButtons(isLoading, theme, colorScheme),
// //             ],
// //           ),
// //         );
// //       },
// //     );
// //   }
// //
// //   Widget _buildHeader(ThemeData theme, ColorScheme colorScheme) {
// //     return Padding(
// //       padding: REdgeInsets.all(DesignTokens.space4),
// //       child: Row(
// //         children: [
// //           Container(
// //             width: 40.w,
// //             height: 40.h,
// //             decoration: BoxDecoration(
// //               color: colorScheme.primary.withValues(alpha: 0.1),
// //               borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
// //             ),
// //             child: Icon(
// //               Icons.check_circle,
// //               color: colorScheme.primary,
// //               size: DesignTokens.iconMd.sp,
// //             ),
// //           ),
// //           RSizedBox(width: DesignTokens.space3),
// //           Expanded(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text(
// //                   'Complete Work Order',
// //                   style: theme.textTheme.titleMedium?.copyWith(
// //                     fontWeight: FontWeight.w600,
// //                   ),
// //                 ),
// //                 Text(
// //                   'Work Order #${widget.workOrder.id}',
// //                   style: theme.textTheme.bodyMedium?.copyWith(
// //                     color: colorScheme.onSurfaceVariant,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           IconButton(
// //             onPressed: _handleClose,
// //             icon: Icon(
// //               Icons.close,
// //               size: DesignTokens.iconMd.sp,
// //               color: colorScheme.onSurfaceVariant,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _buildProgressIndicator(ThemeData theme, ColorScheme colorScheme) {
// //     return Padding(
// //       padding: REdgeInsets.symmetric(
// //         horizontal: DesignTokens.space4,
// //         vertical: DesignTokens.space2,
// //       ),
// //       child: Row(
// //         children: [
// //           _buildStepIndicator(0, 'Work Log', theme, colorScheme),
// //           Expanded(child: _buildStepConnector(0, colorScheme)),
// //           _buildStepIndicator(1, 'Images', theme, colorScheme),
// //           Expanded(child: _buildStepConnector(1, colorScheme)),
// //           _buildStepIndicator(2, 'Signature', theme, colorScheme),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _buildStepIndicator(
// //       int step, String label, ThemeData theme, ColorScheme colorScheme) {
// //     final isActive = step == _currentStep;
// //     final isCompleted = step < _currentStep;
// //
// //     return Column(
// //       children: [
// //         Container(
// //           width: 32.w,
// //           height: 32.h,
// //           decoration: BoxDecoration(
// //             color: isCompleted || isActive
// //                 ? colorScheme.primary
// //                 : colorScheme.surfaceContainerHighest,
// //             shape: BoxShape.circle,
// //           ),
// //           child: Center(
// //             child: isCompleted
// //                 ? Icon(Icons.check,
// //                     color: colorScheme.onPrimary, size: DesignTokens.iconSm.sp)
// //                 : Text(
// //                     '${step + 1}',
// //                     style: theme.textTheme.labelMedium?.copyWith(
// //                       color: colorScheme.onPrimary,
// //                       fontWeight: FontWeight.w600,
// //                     ),
// //                   ),
// //           ),
// //         ),
// //         RSizedBox(height: DesignTokens.space1),
// //         Text(
// //           label,
// //           style: theme.textTheme.labelSmall?.copyWith(
// //             color:
// //                 isActive ? colorScheme.onSurface : colorScheme.onSurfaceVariant,
// //             fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// //
// //   Widget _buildStepConnector(int step, ColorScheme colorScheme) {
// //     final isCompleted = step < _currentStep;
// //
// //     return Container(
// //       height: 2.h,
// //       margin: REdgeInsets.only(bottom: DesignTokens.space5),
// //       color: isCompleted
// //           ? colorScheme.primary
// //           : colorScheme.surfaceContainerHighest,
// //     );
// //   }
// //
// //   Widget _buildStepContent() {
// //     final theme = Theme.of(context);
// //     final colorScheme = theme.colorScheme;
// //
// //     return ReactiveForm(
// //       formGroup: _getCurrentForm(),
// //       child: ListView(
// //         padding: REdgeInsets.all(DesignTokens.space4),
// //         children: [
// //           // Location status
// //           LocationStatusWidget(location: widget.location),
// //
// //           DesignTokens.verticalSpaceMd,
// //
// //           // Step-specific content
// //           if (_currentStep == 0) _buildStep1Content(theme, colorScheme),
// //           if (_currentStep == 1) _buildStep2Content(theme, colorScheme),
// //           if (_currentStep == 2) _buildStep3Content(theme, colorScheme),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _buildStep1Content(ThemeData theme, ColorScheme colorScheme) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text(
// //           'Step 1: Work Details',
// //           style: theme.textTheme.titleMedium?.copyWith(
// //             fontWeight: FontWeight.w600,
// //           ),
// //         ),
// //         DesignTokens.verticalSpaceSmall,
// //         Text(
// //           'Provide details about the work performed and parts used',
// //           style: theme.textTheme.bodyMedium?.copyWith(
// //             color: colorScheme.onSurfaceVariant,
// //           ),
// //         ),
// //         DesignTokens.verticalSpaceLg,
// //         Text(
// //           'Work Log *',
// //           style: theme.textTheme.bodyMedium?.copyWith(
// //             fontWeight: FontWeight.w500,
// //           ),
// //         ),
// //         RSizedBox(height: DesignTokens.space2),
// //         ReactiveMultilineInput(
// //           formControlName: 'workLog',
// //           hint:
// //               'Describe the work performed in detail (minimum 20 characters)...',
// //           minLines: 4,
// //           maxLines: 8,
// //         ),
// //         DesignTokens.verticalSpaceLg,
// //         Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //           children: [
// //             Text(
// //               'Parts Used (Optional)',
// //               style: theme.textTheme.bodyMedium?.copyWith(
// //                 fontWeight: FontWeight.w500,
// //               ),
// //             ),
// //             ReactiveFormArray(
// //               formArrayName: 'parts',
// //               builder: (context, formArray, child) {
// //                 return TextButton.icon(
// //                   onPressed: () => _handleAddPart(formArray),
// //                   icon: Icon(Icons.add, size: DesignTokens.iconSm.sp),
// //                   label: Text('Add Part'),
// //                 );
// //               },
// //             ),
// //           ],
// //         ),
// //         RSizedBox(height: DesignTokens.space2),
// //         ReactiveFormArray(
// //           formArrayName: 'parts',
// //           builder: (context, formArray, child) {
// //             if (formArray.value == null || (formArray.value as List).isEmpty) {
// //               return Container(
// //                 padding: REdgeInsets.all(DesignTokens.space4),
// //                 decoration: BoxDecoration(
// //                   color: colorScheme.surfaceContainerHighest,
// //                   borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
// //                   border: Border.all(
// //                       color: colorScheme.outline.withValues(alpha: 0.3)),
// //                 ),
// //                 child: Row(
// //                   children: [
// //                     Icon(
// //                       Icons.info_outline,
// //                       size: DesignTokens.iconSm.sp,
// //                       color: colorScheme.onSurfaceVariant,
// //                     ),
// //                     RSizedBox(width: DesignTokens.space3),
// //                     Expanded(
// //                       child: Text(
// //                         'No parts added yet. Tap "Add Part" to record parts used.',
// //                         style: theme.textTheme.bodySmall?.copyWith(
// //                           color: colorScheme.onSurfaceVariant,
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               );
// //             }
// //
// //             return Column(
// //               children: List.generate(
// //                 formArray.controls.length,
// //                 (index) =>
// //                     _buildPartEntry(formArray, index, theme, colorScheme),
// //               ),
// //             );
// //           },
// //         ),
// //       ],
// //     );
// //   }
// //
// //   Widget _buildPartEntry(FormArray formArray, int index, ThemeData theme,
// //       ColorScheme colorScheme) {
// //     return ReactiveForm(
// //       formGroup: formArray.controls[index] as FormGroup,
// //       child: Container(
// //         margin: REdgeInsets.only(bottom: DesignTokens.space3),
// //         padding: REdgeInsets.all(DesignTokens.space4),
// //         decoration: BoxDecoration(
// //           color: colorScheme.surface,
// //           borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
// //           border: Border.all(color: colorScheme.outline.withValues(alpha: 0.3)),
// //         ),
// //         child: Column(
// //           children: [
// //             Row(
// //               children: [
// //                 Expanded(
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text(
// //                         'Part ${index + 1}',
// //                         style: theme.textTheme.labelMedium?.copyWith(
// //                           fontWeight: FontWeight.w600,
// //                           color: colorScheme.onSurfaceVariant,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 IconButton(
// //                   onPressed: () => _handleRemovePart(formArray, index),
// //                   icon: Icon(Icons.delete, size: DesignTokens.iconSm.sp),
// //                   color: colorScheme.error,
// //                   style: IconButton.styleFrom(
// //                     padding: REdgeInsets.all(DesignTokens.space2),
// //                     minimumSize: Size(32.w, 32.h),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             RSizedBox(height: DesignTokens.space2),
// //             ReactiveTextInput(
// //               formControlName: 'partNumber',
// //               label: 'Part Number',
// //             ),
// //             RSizedBox(height: DesignTokens.space2),
// //             ReactiveTextInput(
// //               formControlName: 'partName',
// //               label: 'Part Name',
// //             ),
// //             RSizedBox(height: DesignTokens.space2),
// //             ReactiveTextInput(
// //               formControlName: 'quantity',
// //               label: 'Quantity',
// //               keyboardType: TextInputType.number,
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildStep2Content(ThemeData theme, ColorScheme colorScheme) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text(
// //           'Step 2: Capture Images',
// //           style: theme.textTheme.titleMedium?.copyWith(
// //             fontWeight: FontWeight.w600,
// //           ),
// //         ),
// //         DesignTokens.verticalSpaceSmall,
// //         Text(
// //           'Take photos of the completed work (optional but recommended)',
// //           style: theme.textTheme.bodyMedium?.copyWith(
// //             color: colorScheme.onSurfaceVariant,
// //           ),
// //         ),
// //         DesignTokens.verticalSpaceLg,
// //         Text(
// //           'Images (Optional)',
// //           style: theme.textTheme.bodyMedium?.copyWith(
// //             fontWeight: FontWeight.w500,
// //           ),
// //         ),
// //         RSizedBox(height: DesignTokens.space2),
// //         ReactiveImagePicker(
// //           formControlName: 'files',
// //           maxImages: 10,
// //         ),
// //       ],
// //     );
// //   }
// //
// //   Widget _buildStep3Content(ThemeData theme, ColorScheme colorScheme) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text(
// //           'Step 3: Customer Signature',
// //           style: theme.textTheme.titleMedium?.copyWith(
// //             fontWeight: FontWeight.w600,
// //           ),
// //         ),
// //         DesignTokens.verticalSpaceSmall,
// //         Text(
// //           'Get customer confirmation and signature',
// //           style: theme.textTheme.bodyMedium?.copyWith(
// //             color: colorScheme.onSurfaceVariant,
// //           ),
// //         ),
// //         DesignTokens.verticalSpaceLg,
// //         Text(
// //           'Customer Name *',
// //           style: theme.textTheme.bodyMedium?.copyWith(
// //             fontWeight: FontWeight.w500,
// //           ),
// //         ),
// //         RSizedBox(height: DesignTokens.space2),
// //         ReactiveTextInput(
// //           formControlName: 'customerName',
// //           hint: 'Enter customer name',
// //         ),
// //         DesignTokens.verticalSpaceLg,
// //         Text(
// //           'Customer Signature *',
// //           style: theme.textTheme.bodyMedium?.copyWith(
// //             fontWeight: FontWeight.w500,
// //           ),
// //         ),
// //         RSizedBox(height: DesignTokens.space2),
// //         ReactiveSignaturePad(
// //           formControlName: 'signature',
// //         ),
// //         DesignTokens.verticalSpaceLg,
// //         Text(
// //           'Completion Notes (Optional)',
// //           style: theme.textTheme.bodyMedium?.copyWith(
// //             fontWeight: FontWeight.w500,
// //           ),
// //         ),
// //         RSizedBox(height: DesignTokens.space2),
// //         ReactiveMultilineInput(
// //           formControlName: 'completionNotes',
// //           hint: 'Add any additional notes...',
// //           minLines: 3,
// //           maxLines: 5,
// //         ),
// //       ],
// //     );
// //   }
// //
// //   @override
// //   void dispose() {
// //     _step1Form.dispose();
// //     _step2Form.dispose();
// //     _step3Form.dispose();
// //     super.dispose();
// //   }
// // }
// // import 'dart:io';
// //
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:reactive_forms/reactive_forms.dart';
// //
// // import '../../../../core/di/injection.dart';
// // import '../../../../core/theme/design_tokens.dart';
// // import '../../../../core/widgets/form/location_status_widget.dart';
// // import '../../../../core/widgets/form/reactive_image_picker.dart';
// // import '../../../../core/widgets/form/reactive_multiline_input.dart';
// // import '../../../../core/widgets/form/reactive_signature_pad.dart';
// // import '../../../../core/widgets/form/reactive_text_input.dart';
// // import '../../data/models/work_order_completion_cache_model.dart';
// // import '../../data/services/work_order_completion_cache_service.dart';
// // import '../../domain/entities/location_entity.dart';
// // import '../../domain/entities/work_order_entity.dart';
// // import '../blocs/work_order_action/work_order_action_bloc.dart';
// // import '../blocs/work_order_action/work_order_action_event.dart';
// // import '../blocs/work_order_action/work_order_action_state.dart';
// // import '../forms/work_order_forms.dart';
// //
// // class WorkOrderCompleteWizard extends StatefulWidget {
// //   final WorkOrderEntity workOrder;
// //   final LocationEntity? location;
// //   final WorkOrderActionBloc bloc;
// //   final WorkOrderCompletionCacheService cacheService;
// //
// //   const WorkOrderCompleteWizard({
// //     super.key,
// //     required this.workOrder,
// //     required this.location,
// //     required this.bloc,
// //     required this.cacheService,
// //   });
// //
// //   static Future<void> show({
// //     required BuildContext context,
// //     required WorkOrderEntity workOrder,
// //     LocationEntity? location,
// //   }) async {
// //     final bloc = context.read<WorkOrderActionBloc>();
// //     final cacheService = getIt<WorkOrderCompletionCacheService>();
// //
// //     await showModalBottomSheet(
// //       context: context,
// //       isScrollControlled: true,
// //       backgroundColor: Colors.transparent,
// //       isDismissible: false,
// //       enableDrag: false,
// //       builder: (bottomSheetContext) => BlocProvider.value(
// //         value: bloc,
// //         child: WorkOrderCompleteWizard(
// //           workOrder: workOrder,
// //           location: location,
// //           bloc: bloc,
// //           cacheService: cacheService,
// //         ),
// //       ),
// //     );
// //   }
// //
// //   @override
// //   State<WorkOrderCompleteWizard> createState() =>
// //       _WorkOrderCompleteWizardState();
// // }
// //
// // class _WorkOrderCompleteWizardState extends State<WorkOrderCompleteWizard> {
// //   int _currentStep = 0;
// //   late FormGroup _step1Form;
// //   late FormGroup _step2Form;
// //   late FormGroup _step3Form;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _initializeForms();
// //     _loadCachedData();
// //   }
// //
// //   void _initializeForms() {
// //     _step1Form = WorkOrderForms.buildCompleteFormStep1();
// //     _step2Form = WorkOrderForms.buildCompleteFormStep2();
// //     _step3Form = WorkOrderForms.buildCompleteFormStep3();
// //   }
// //
// //   Future<void> _loadCachedData() async {
// //     final cache = await widget.cacheService.loadCache(widget.workOrder.id);
// //     if (cache != null && mounted) {
// //       setState(() {
// //         _currentStep = cache.currentStep;
// //       });
// //
// //       if (cache.workLog != null) {
// //         _step1Form.control('workLog').value = cache.workLog;
// //       }
// //
// //       if (cache.partsUsed.isNotEmpty) {
// //         final partsArray = _step1Form.control('parts') as FormArray;
// //         partsArray.clear();
// //         for (final cachedPart in cache.partsUsed) {
// //           final partGroup = WorkOrderForms.createPartEntry(
// //             partNumber: cachedPart.partNumber,
// //             partName: cachedPart.partName,
// //             quantity: cachedPart.quantity,
// //           );
// //           partsArray.add(partGroup);
// //         }
// //       }
// //
// //       if (cache.images.isNotEmpty) {
// //         final imageFiles = cache.images.map((path) => File(path)).toList();
// //         _step2Form.control('files').value = imageFiles;
// //       }
// //
// //       if (cache.customerName != null) {
// //         _step3Form.control('customerName').value = cache.customerName;
// //       }
// //       if (cache.completionNotes != null) {
// //         _step3Form.control('completionNotes').value = cache.completionNotes;
// //       }
// //       if (cache.signaturePath != null) {
// //         final signatureFile = File(cache.signaturePath!);
// //         if (await signatureFile.exists()) {
// //           _step3Form.control('signature').value = signatureFile;
// //         }
// //       }
// //     }
// //   }
// //
// //   Future<void> _saveCache() async {
// //     final step1Data =
// //         WorkOrderForms.getCompleteFormData(_step1Form, _step2Form, _step3Form);
// //
// //     final cachedParts = (step1Data['partsUsed'] as List? ?? [])
// //         .map((part) => CachedPartUsedModel(
// //               partNumber: part.partNumber,
// //               quantity: part.quantityUsed,
// //               partName: part.partName ?? '',
// //               category: '',
// //               quantityAvailable: 0,
// //               unitPrice: 0.0,
// //               status: 'used',
// //             ))
// //         .toList();
// //
// //     final imagePaths = (step1Data['files'] as List<File>? ?? [])
// //         .map((file) => file.path)
// //         .toList();
// //
// //     final cache = WorkOrderCompletionCacheModel(
// //       workOrderId: widget.workOrder.id,
// //       currentStep: _currentStep,
// //       workLog: step1Data['workLog'],
// //       partsUsed: cachedParts,
// //       images: imagePaths,
// //       customerName: step1Data['customerName'],
// //       signaturePath: step1Data['signature']?.path,
// //       completionNotes: step1Data['completionNotes'],
// //       lastUpdated: DateTime.now(),
// //     );
// //
// //     await widget.cacheService.saveCache(cache);
// //   }
// //
// //   void _handleClose() {
// //     _saveCache();
// //     Navigator.of(context).pop();
// //   }
// //
// //   void _handleAddPart(FormArray formArray) {
// //     formArray.add(WorkOrderForms.createPartEntry(
// //       partNumber: '',
// //       partName: '',
// //       quantity: 1,
// //     ));
// //   }
// //
// //   void _handleRemovePart(FormArray formArray, int index) {
// //     formArray.removeAt(index);
// //   }
// //
// //   FormGroup _getCurrentForm() {
// //     switch (_currentStep) {
// //       case 0:
// //         return _step1Form;
// //       case 1:
// //         return _step2Form;
// //       case 2:
// //         return _step3Form;
// //       default:
// //         return _step1Form;
// //     }
// //   }
// //
// //   void _handleSubmit() {
// //     final data = WorkOrderForms.getCompleteFormData(
// //       _step1Form,
// //       _step2Form,
// //       _step3Form,
// //     );
// //
// //     final workLog = data['workLog'] as String;
// //     final customerName = data['customerName'] as String;
// //     final signature = data['signature'] as File;
// //     // final partsUsed = data['partsUsed'] as List<PartUsedEntity> ?? [];
// //     final partsUsed = (data['partsUsed'] as List<PartUsedEntity>?) ?? [];
// //     final files = (data['files'] as List<File>?) ?? [];
// //     final completionNotes = data['completionNotes'] as String?;
// //     final latitude = widget.location?.latitude ?? 0.0;
// //     final longitude = widget.location?.longitude ?? 0.0;
// //
// //     widget.bloc.add(
// //       WorkOrderActionEvent.completeWorkOrder(
// //         workOrderId: widget.workOrder.id,
// //         workLog: workLog,
// //         customerName: customerName,
// //         signature: signature,
// //         partsUsed: partsUsed,
// //         files: files,
// //         latitude: latitude,
// //         longitude: longitude,
// //         completionNotes: completionNotes,
// //       ),
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final theme = Theme.of(context);
// //     final colorScheme = theme.colorScheme;
// //
// //     return BlocConsumer<WorkOrderActionBloc, WorkOrderActionState>(
// //       bloc: widget.bloc,
// //       listener: (context, state) {
// //         state.maybeWhen(
// //           actionSuccess: (workOrder, actionType, message, groupedImages) {
// //             widget.cacheService.clearCache(widget.workOrder.id);
// //             Navigator.of(context).pop();
// //             ScaffoldMessenger.of(context).showSnackBar(
// //               SnackBar(
// //                 content: Text(message),
// //                 backgroundColor: colorScheme.primary,
// //               ),
// //             );
// //           },
// //           error: (failure, workOrder, isOffline) {
// //             ScaffoldMessenger.of(context).showSnackBar(
// //               SnackBar(
// //                 content: Text(failure.message),
// //                 backgroundColor: colorScheme.error,
// //               ),
// //             );
// //           },
// //           orElse: () {},
// //         );
// //       },
// //       builder: (context, state) {
// //         return Container(
// //           constraints: BoxConstraints(maxHeight: 0.9.sh),
// //           decoration: BoxDecoration(
// //             color: colorScheme.surface,
// //             borderRadius: BorderRadius.vertical(
// //               top: Radius.circular(DesignTokens.radiusLg.r),
// //             ),
// //           ),
// //           child: Column(
// //             mainAxisSize: MainAxisSize.min,
// //             children: [
// //               _buildHeader(theme, colorScheme),
// //               Divider(height: 1.h, color: colorScheme.outline),
// //               _buildProgressIndicator(theme, colorScheme),
// //               Flexible(child: _buildStepContent()),
// //               _buildNavigationButtons(theme, colorScheme),
// //             ],
// //           ),
// //         );
// //       },
// //     );
// //   }
// //
// //   Widget _buildHeader(ThemeData theme, ColorScheme colorScheme) {
// //     return Padding(
// //       padding: REdgeInsets.all(DesignTokens.space4),
// //       child: Row(
// //         children: [
// //           Icon(Icons.check_circle, color: colorScheme.primary, size: 28.sp),
// //           RSizedBox(width: DesignTokens.space3),
// //           Expanded(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text('Complete Work Order',
// //                     style: theme.textTheme.titleMedium
// //                         ?.copyWith(fontWeight: FontWeight.w600)),
// //                 Text('Work Order #${widget.workOrder.id}',
// //                     style: theme.textTheme.bodyMedium
// //                         ?.copyWith(color: colorScheme.onSurfaceVariant)),
// //               ],
// //             ),
// //           ),
// //           IconButton(
// //             onPressed: _handleClose,
// //             icon: Icon(Icons.close, color: colorScheme.onSurfaceVariant),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _buildProgressIndicator(ThemeData theme, ColorScheme colorScheme) {
// //     return Padding(
// //       padding:
// //           REdgeInsets.symmetric(horizontal: DesignTokens.space4, vertical: 8),
// //       child: Row(
// //         children: [
// //           _buildStepIndicator(0, 'Work Log', theme, colorScheme),
// //           Expanded(child: _buildStepConnector(0, colorScheme)),
// //           _buildStepIndicator(1, 'Images', theme, colorScheme),
// //           Expanded(child: _buildStepConnector(1, colorScheme)),
// //           _buildStepIndicator(2, 'Signature', theme, colorScheme),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _buildStepIndicator(
// //       int step, String label, ThemeData theme, ColorScheme colorScheme) {
// //     final isActive = step == _currentStep;
// //     final isCompleted = step < _currentStep;
// //
// //     return Column(
// //       children: [
// //         Container(
// //           width: 32.w,
// //           height: 32.h,
// //           decoration: BoxDecoration(
// //             color: isCompleted || isActive
// //                 ? colorScheme.primary
// //                 : colorScheme.surfaceContainerHighest,
// //             shape: BoxShape.circle,
// //           ),
// //           child: Center(
// //             child: isCompleted
// //                 ? Icon(Icons.check, color: colorScheme.onPrimary, size: 16.sp)
// //                 : Text('${step + 1}',
// //                     style: theme.textTheme.labelMedium?.copyWith(
// //                         color: colorScheme.onPrimary,
// //                         fontWeight: FontWeight.w600)),
// //           ),
// //         ),
// //         RSizedBox(height: DesignTokens.space1),
// //         Text(label,
// //             style: theme.textTheme.labelSmall?.copyWith(
// //               color: isActive
// //                   ? colorScheme.onSurface
// //                   : colorScheme.onSurfaceVariant,
// //               fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
// //             )),
// //       ],
// //     );
// //   }
// //
// //   Widget _buildStepConnector(int step, ColorScheme colorScheme) {
// //     final isCompleted = step < _currentStep;
// //     return Container(
// //       height: 2.h,
// //       margin: REdgeInsets.only(bottom: 20.h),
// //       color: isCompleted
// //           ? colorScheme.primary
// //           : colorScheme.surfaceContainerHighest,
// //     );
// //   }
// //
// //   Widget _buildStepContent() {
// //     final theme = Theme.of(context);
// //     final colorScheme = theme.colorScheme;
// //
// //     return ReactiveForm(
// //       formGroup: _getCurrentForm(),
// //       child: ListView(
// //         padding: REdgeInsets.all(DesignTokens.space4),
// //         children: [
// //           LocationStatusWidget(location: widget.location),
// //           DesignTokens.verticalSpaceMd,
// //           if (_currentStep == 0) _buildStep1Content(theme, colorScheme),
// //           if (_currentStep == 1) _buildStep2Content(theme, colorScheme),
// //           if (_currentStep == 2) _buildStep3Content(theme, colorScheme),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _buildStep1Content(ThemeData theme, ColorScheme colorScheme) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text('Step 1: Work Details',
// //             style: theme.textTheme.titleMedium
// //                 ?.copyWith(fontWeight: FontWeight.w600)),
// //         DesignTokens.verticalSpaceSmall,
// //         Text('Provide details about the work performed and parts used',
// //             style: theme.textTheme.bodyMedium
// //                 ?.copyWith(color: colorScheme.onSurfaceVariant)),
// //         DesignTokens.verticalSpaceLg,
// //         ReactiveMultilineInput(
// //           formControlName: 'workLog',
// //           hint: 'Describe the work performed...',
// //           minLines: 4,
// //           maxLines: 8,
// //         ),
// //         DesignTokens.verticalSpaceLg,
// //         Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //           children: [
// //             Text('Parts Used (Optional)',
// //                 style: theme.textTheme.bodyMedium
// //                     ?.copyWith(fontWeight: FontWeight.w500)),
// //             ReactiveFormArray(
// //               formArrayName: 'parts',
// //               builder: (context, formArray, child) {
// //                 return TextButton.icon(
// //                   onPressed: () => _handleAddPart(formArray),
// //                   icon: const Icon(Icons.add),
// //                   label: const Text('Add Part'),
// //                 );
// //               },
// //             ),
// //           ],
// //         ),
// //         RSizedBox(height: DesignTokens.space2),
// //         ReactiveFormArray(
// //           formArrayName: 'parts',
// //           builder: (context, formArray, child) {
// //             if (formArray.value == null || (formArray.value as List).isEmpty) {
// //               return Container(
// //                 padding: REdgeInsets.all(DesignTokens.space4),
// //                 decoration: BoxDecoration(
// //                   color: colorScheme.surfaceContainerHighest,
// //                   borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
// //                   border: Border.all(
// //                       color: colorScheme.outline.withValues(alpha: 0.3)),
// //                 ),
// //                 child: Row(
// //                   children: [
// //                     Icon(Icons.info_outline,
// //                         color: colorScheme.onSurfaceVariant),
// //                     RSizedBox(width: DesignTokens.space3),
// //                     Expanded(
// //                       child: Text(
// //                         'No parts added yet. Tap "Add Part" to record parts used.',
// //                         style: theme.textTheme.bodySmall?.copyWith(
// //                           color: colorScheme.onSurfaceVariant,
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               );
// //             }
// //
// //             return Column(
// //               children: List.generate(
// //                 formArray.controls.length,
// //                 (index) =>
// //                     _buildPartEntry(formArray, index, theme, colorScheme),
// //               ),
// //             );
// //           },
// //         ),
// //       ],
// //     );
// //   }
// //
// //   Widget _buildPartEntry(FormArray formArray, int index, ThemeData theme,
// //       ColorScheme colorScheme) {
// //     return ReactiveForm(
// //       formGroup: formArray.controls[index] as FormGroup,
// //       child: Container(
// //         margin: REdgeInsets.only(bottom: DesignTokens.space3),
// //         padding: REdgeInsets.all(DesignTokens.space4),
// //         decoration: BoxDecoration(
// //           color: colorScheme.surface,
// //           borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
// //           border: Border.all(color: colorScheme.outline.withValues(alpha: 0.3)),
// //         ),
// //         child: Column(
// //           children: [
// //             Row(
// //               children: [
// //                 Expanded(
// //                   child: Text('Part ${index + 1}',
// //                       style: theme.textTheme.labelMedium?.copyWith(
// //                         fontWeight: FontWeight.w600,
// //                         color: colorScheme.onSurfaceVariant,
// //                       )),
// //                 ),
// //                 IconButton(
// //                   onPressed: () => _handleRemovePart(formArray, index),
// //                   icon: const Icon(Icons.delete),
// //                   color: colorScheme.error,
// //                 ),
// //               ],
// //             ),
// //             RSizedBox(height: DesignTokens.space2),
// //             ReactiveTextInput(
// //                 formControlName: 'partNumber', label: 'Part Number'),
// //             RSizedBox(height: DesignTokens.space2),
// //             ReactiveTextInput(formControlName: 'partName', label: 'Part Name'),
// //             RSizedBox(height: DesignTokens.space2),
// //             ReactiveTextInput(
// //               formControlName: 'quantity',
// //               label: 'Quantity',
// //               keyboardType: TextInputType.number,
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildStep2Content(ThemeData theme, ColorScheme colorScheme) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text('Step 2: Capture Images',
// //             style: theme.textTheme.titleMedium
// //                 ?.copyWith(fontWeight: FontWeight.w600)),
// //         DesignTokens.verticalSpaceSmall,
// //         Text('Take photos of the completed work (optional)',
// //             style: theme.textTheme.bodyMedium
// //                 ?.copyWith(color: colorScheme.onSurfaceVariant)),
// //         DesignTokens.verticalSpaceLg,
// //         ReactiveImagePicker(formControlName: 'files', maxImages: 10),
// //       ],
// //     );
// //   }
// //
// //   Widget _buildStep3Content(ThemeData theme, ColorScheme colorScheme) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text('Step 3: Customer Signature',
// //             style: theme.textTheme.titleMedium
// //                 ?.copyWith(fontWeight: FontWeight.w600)),
// //         DesignTokens.verticalSpaceSmall,
// //         Text('Get customer confirmation and signature',
// //             style: theme.textTheme.bodyMedium
// //                 ?.copyWith(color: colorScheme.onSurfaceVariant)),
// //         DesignTokens.verticalSpaceLg,
// //         ReactiveTextInput(formControlName: 'customerName', hint: 'Enter name'),
// //         DesignTokens.verticalSpaceLg,
// //         ReactiveSignaturePad(formControlName: 'signature'),
// //         DesignTokens.verticalSpaceLg,
// //         ReactiveMultilineInput(
// //           formControlName: 'completionNotes',
// //           hint: 'Add any additional notes...',
// //           minLines: 3,
// //           maxLines: 5,
// //         ),
// //       ],
// //     );
// //   }
// //
// //   Widget _buildNavigationButtons(ThemeData theme, ColorScheme colorScheme) {
// //     final isLastStep = _currentStep == 2;
// //
// //     return Padding(
// //       padding: REdgeInsets.all(DesignTokens.space4),
// //       child: Row(
// //         children: [
// //           if (_currentStep > 0)
// //             Expanded(
// //               child: OutlinedButton(
// //                 onPressed: () {
// //                   setState(() {
// //                     _currentStep--;
// //                   });
// //                 },
// //                 child: const Text('Back'),
// //               ),
// //             ),
// //           if (_currentStep > 0) RSizedBox(width: DesignTokens.space3),
// //           Expanded(
// //             child: FilledButton(
// //               onPressed: () async {
// //                 final currentForm = _getCurrentForm();
// //                 currentForm.markAllAsTouched();
// //
// //                 if (currentForm.valid) {
// //                   await _saveCache();
// //
// //                   if (isLastStep) {
// //                     _handleSubmit();
// //                   } else {
// //                     setState(() {
// //                       _currentStep++;
// //                     });
// //                   }
// //                 }
// //               },
// //               child: Text(isLastStep ? 'Submit' : 'Next'),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   @override
// //   void dispose() {
// //     _step1Form.dispose();
// //     _step2Form.dispose();
// //     _step3Form.dispose();
// //     super.dispose();
// //   }
// // }
// // import 'dart:io';
// //
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:reactive_forms/reactive_forms.dart';
// //
// // import '../../../../core/di/injection.dart';
// // import '../../../../core/theme/design_tokens.dart';
// // import '../../../../core/widgets/form/location_status_widget.dart';
// // import '../../../../core/widgets/form/reactive_image_picker.dart';
// // import '../../../../core/widgets/form/reactive_multiline_input.dart';
// // import '../../../../core/widgets/form/reactive_signature_pad.dart';
// // import '../../../../core/widgets/form/reactive_text_input.dart';
// // import '../../data/models/work_order_completion_cache_model.dart';
// // import '../../data/services/work_order_completion_cache_service.dart';
// // import '../../domain/entities/location_entity.dart';
// // import '../../domain/entities/work_order_entity.dart';
// // import '../blocs/work_order_action/work_order_action_bloc.dart';
// // import '../blocs/work_order_action/work_order_action_event.dart';
// // import '../blocs/work_order_action/work_order_action_state.dart';
// // import '../forms/work_order_forms.dart';
// //
// // class WorkOrderCompleteWizard extends StatefulWidget {
// //   final WorkOrderEntity workOrder;
// //   final LocationEntity? location;
// //   final WorkOrderActionBloc bloc;
// //   final WorkOrderCompletionCacheService cacheService;
// //
// //   const WorkOrderCompleteWizard({
// //     super.key,
// //     required this.workOrder,
// //     required this.location,
// //     required this.bloc,
// //     required this.cacheService,
// //   });
// //
// //   static Future<void> show({
// //     required BuildContext context,
// //     required WorkOrderEntity workOrder,
// //     LocationEntity? location,
// //   }) async {
// //     final bloc = context.read<WorkOrderActionBloc>();
// //     final cacheService = getIt<WorkOrderCompletionCacheService>();
// //
// //     await showModalBottomSheet(
// //       context: context,
// //       isScrollControlled: true,
// //       backgroundColor: Colors.transparent,
// //       isDismissible: false,
// //       enableDrag: false,
// //       builder: (bottomSheetContext) => BlocProvider.value(
// //         value: bloc,
// //         child: WorkOrderCompleteWizard(
// //           workOrder: workOrder,
// //           location: location,
// //           bloc: bloc,
// //           cacheService: cacheService,
// //         ),
// //       ),
// //     );
// //   }
// //
// //   @override
// //   State<WorkOrderCompleteWizard> createState() =>
// //       _WorkOrderCompleteWizardState();
// // }
// //
// // class _WorkOrderCompleteWizardState extends State<WorkOrderCompleteWizard> {
// //   int _currentStep = 0;
// //   late FormGroup _step1Form;
// //   late FormGroup _step2Form;
// //   late FormGroup _step3Form;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _initializeForms();
// //     _loadCachedData();
// //   }
// //
// //   void _initializeForms() {
// //     _step1Form = WorkOrderForms.buildCompleteFormStep1();
// //     _step2Form = WorkOrderForms.buildCompleteFormStep2();
// //     _step3Form = WorkOrderForms.buildCompleteFormStep3();
// //   }
// //
// //   Future<void> _loadCachedData() async {
// //     final cache = await widget.cacheService.loadCache(widget.workOrder.id);
// //     if (cache != null && mounted) {
// //       setState(() {
// //         _currentStep = cache.currentStep;
// //       });
// //
// //       if (cache.workLog != null) {
// //         _step1Form.control('workLog').value = cache.workLog;
// //       }
// //
// //       if (cache.partsUsed.isNotEmpty) {
// //         final partsArray = _step1Form.control('parts') as FormArray;
// //         partsArray.clear();
// //         for (final cachedPart in cache.partsUsed) {
// //           final partGroup = WorkOrderForms.createPartEntry(
// //             partNumber: cachedPart.partNumber,
// //             partName: cachedPart.partName,
// //             quantity: cachedPart.quantity,
// //           );
// //           partsArray.add(partGroup);
// //         }
// //       }
// //
// //       if (cache.images.isNotEmpty) {
// //         final imageFiles = cache.images.map((path) => File(path)).toList();
// //         _step2Form.control('files').value = imageFiles;
// //       }
// //
// //       if (cache.customerName != null) {
// //         _step3Form.control('customerName').value = cache.customerName;
// //       }
// //       if (cache.completionNotes != null) {
// //         _step3Form.control('completionNotes').value = cache.completionNotes;
// //       }
// //       if (cache.signaturePath != null) {
// //         final signatureFile = File(cache.signaturePath!);
// //         if (await signatureFile.exists()) {
// //           _step3Form.control('signature').value = signatureFile;
// //         }
// //       }
// //     }
// //   }
// //
// //   Future<void> _saveCache() async {
// //     final step1Data =
// //         WorkOrderForms.getCompleteFormData(_step1Form, _step2Form, _step3Form);
// //
// //     final cachedParts = (step1Data['partsUsed'] as List? ?? [])
// //         .map((part) => CachedPartUsedModel(
// //               partNumber: part.partNumber,
// //               quantity: part.quantityUsed,
// //               partName: part.partName ?? '',
// //               category: '',
// //               quantityAvailable: 0,
// //               unitPrice: 0.0,
// //               status: 'used',
// //             ))
// //         .toList();
// //
// //     final imagePaths = (step1Data['files'] as List<File>? ?? [])
// //         .map((file) => file.path)
// //         .toList();
// //
// //     final cache = WorkOrderCompletionCacheModel(
// //       workOrderId: widget.workOrder.id,
// //       currentStep: _currentStep,
// //       workLog: step1Data['workLog'],
// //       partsUsed: cachedParts,
// //       images: imagePaths,
// //       customerName: step1Data['customerName'],
// //       signaturePath: step1Data['signature']?.path,
// //       completionNotes: step1Data['completionNotes'],
// //       lastUpdated: DateTime.now(),
// //     );
// //
// //     await widget.cacheService.saveCache(cache);
// //   }
// //
// //   void _handleClose() {
// //     _saveCache();
// //     Navigator.of(context).pop();
// //   }
// //
// //   void _handleAddPart(FormArray formArray) {
// //     formArray.add(WorkOrderForms.createPartEntry(
// //       partNumber: '',
// //       partName: '',
// //       quantity: 1,
// //     ));
// //   }
// //
// //   void _handleRemovePart(FormArray formArray, int index) {
// //     formArray.removeAt(index);
// //   }
// //
// //   FormGroup _getCurrentForm() {
// //     switch (_currentStep) {
// //       case 0:
// //         return _step1Form;
// //       case 1:
// //         return _step2Form;
// //       case 2:
// //         return _step3Form;
// //       default:
// //         return _step1Form;
// //     }
// //   }
// //
// //   void _handleSubmit() {
// //     final data = WorkOrderForms.getCompleteFormData(
// //       _step1Form,
// //       _step2Form,
// //       _step3Form,
// //     );
// //
// //     final workLog = data['workLog'] as String;
// //     final customerName = data['customerName'] as String;
// //     final signature = data['signature'] as File;
// //     final partsUsed = (data['partsUsed'] as List<PartUsedEntity>?) ?? [];
// //     final files = (data['files'] as List<File>?) ?? [];
// //     final completionNotes = data['completionNotes'] as String?;
// //     final latitude = widget.location?.latitude ?? 0.0;
// //     final longitude = widget.location?.longitude ?? 0.0;
// //
// //     widget.bloc.add(
// //       WorkOrderActionEvent.completeWorkOrder(
// //         workOrderId: widget.workOrder.id,
// //         workLog: workLog,
// //         customerName: customerName,
// //         signature: signature,
// //         partsUsed: partsUsed,
// //         files: files,
// //         latitude: latitude,
// //         longitude: longitude,
// //         completionNotes: completionNotes,
// //       ),
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final theme = Theme.of(context);
// //     final colorScheme = theme.colorScheme;
// //     final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
// //
// //     return BlocConsumer<WorkOrderActionBloc, WorkOrderActionState>(
// //       bloc: widget.bloc,
// //       listener: (context, state) {
// //         state.maybeWhen(
// //           actionSuccess: (workOrder, actionType, message, groupedImages) {
// //             widget.cacheService.clearCache(widget.workOrder.id);
// //             Navigator.of(context).pop();
// //             ScaffoldMessenger.of(context).showSnackBar(
// //               SnackBar(
// //                 content: Text(message),
// //                 backgroundColor: colorScheme.primary,
// //               ),
// //             );
// //           },
// //           error: (failure, workOrder, isOffline) {
// //             ScaffoldMessenger.of(context).showSnackBar(
// //               SnackBar(
// //                 content: Text(failure.message),
// //                 backgroundColor: colorScheme.error,
// //               ),
// //             );
// //           },
// //           orElse: () {},
// //         );
// //       },
// //       builder: (context, state) {
// //         return GestureDetector(
// //           onTap: () => FocusScope.of(context).unfocus(),
// //           child: Container(
// //             height: MediaQuery.of(context).size.height * 0.9,
// //             decoration: BoxDecoration(
// //               color: colorScheme.surface,
// //               borderRadius: BorderRadius.vertical(
// //                 top: Radius.circular(DesignTokens.radiusLg.r),
// //               ),
// //             ),
// //             child: Column(
// //               mainAxisSize: MainAxisSize.max,
// //               children: [
// //                 // Fixed Header
// //                 _buildHeader(theme, colorScheme),
// //                 Divider(height: 1.h, color: colorScheme.outline),
// //
// //                 // Fixed Progress Indicator
// //                 _buildProgressIndicator(theme, colorScheme),
// //
// //                 // Scrollable Content
// //                 Expanded(
// //                   child: SingleChildScrollView(
// //                     padding: EdgeInsets.only(
// //                       left: DesignTokens.space4.w,
// //                       right: DesignTokens.space4.w,
// //                       top: DesignTokens.space4.h,
// //                       bottom: keyboardHeight +
// //                           100.h, // Space for keyboard + buttons
// //                     ),
// //                     keyboardDismissBehavior:
// //                         ScrollViewKeyboardDismissBehavior.onDrag,
// //                     child: _buildStepContent(),
// //                   ),
// //                 ),
// //
// //                 // Fixed Navigation Buttons (Outside scroll, always visible)
// //                 _buildNavigationButtons(theme, colorScheme),
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// //
// //   Widget _buildHeader(ThemeData theme, ColorScheme colorScheme) {
// //     return Padding(
// //       padding: REdgeInsets.all(DesignTokens.space4),
// //       child: Row(
// //         children: [
// //           Icon(Icons.check_circle, color: colorScheme.primary, size: 28.sp),
// //           RSizedBox(width: DesignTokens.space3),
// //           Expanded(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text('Complete Work Order',
// //                     style: theme.textTheme.titleMedium
// //                         ?.copyWith(fontWeight: FontWeight.w600)),
// //                 Text('Work Order #${widget.workOrder.id}',
// //                     style: theme.textTheme.bodyMedium
// //                         ?.copyWith(color: colorScheme.onSurfaceVariant)),
// //               ],
// //             ),
// //           ),
// //           IconButton(
// //             onPressed: _handleClose,
// //             icon: Icon(Icons.close, color: colorScheme.onSurfaceVariant),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _buildProgressIndicator(ThemeData theme, ColorScheme colorScheme) {
// //     return Padding(
// //       padding:
// //           REdgeInsets.symmetric(horizontal: DesignTokens.space4, vertical: 8),
// //       child: Row(
// //         children: [
// //           _buildStepIndicator(0, 'Work Log', theme, colorScheme),
// //           Expanded(child: _buildStepConnector(0, colorScheme)),
// //           _buildStepIndicator(1, 'Images', theme, colorScheme),
// //           Expanded(child: _buildStepConnector(1, colorScheme)),
// //           _buildStepIndicator(2, 'Signature', theme, colorScheme),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _buildStepIndicator(
// //       int step, String label, ThemeData theme, ColorScheme colorScheme) {
// //     final isActive = step == _currentStep;
// //     final isCompleted = step < _currentStep;
// //
// //     return Column(
// //       children: [
// //         Container(
// //           width: 32.w,
// //           height: 32.h,
// //           decoration: BoxDecoration(
// //             color: isCompleted || isActive
// //                 ? colorScheme.primary
// //                 : colorScheme.surfaceContainerHighest,
// //             shape: BoxShape.circle,
// //           ),
// //           child: Center(
// //             child: isCompleted
// //                 ? Icon(Icons.check, color: colorScheme.onPrimary, size: 16.sp)
// //                 : Text('${step + 1}',
// //                     style: theme.textTheme.labelMedium?.copyWith(
// //                         color: colorScheme.onPrimary,
// //                         fontWeight: FontWeight.w600)),
// //           ),
// //         ),
// //         RSizedBox(height: DesignTokens.space1),
// //         Text(label,
// //             style: theme.textTheme.labelSmall?.copyWith(
// //               color: isActive
// //                   ? colorScheme.onSurface
// //                   : colorScheme.onSurfaceVariant,
// //               fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
// //             )),
// //       ],
// //     );
// //   }
// //
// //   Widget _buildStepConnector(int step, ColorScheme colorScheme) {
// //     final isCompleted = step < _currentStep;
// //     return Container(
// //       height: 2.h,
// //       margin: REdgeInsets.only(bottom: 20.h),
// //       color: isCompleted
// //           ? colorScheme.primary
// //           : colorScheme.surfaceContainerHighest,
// //     );
// //   }
// //
// //   Widget _buildStepContent() {
// //     final theme = Theme.of(context);
// //     final colorScheme = theme.colorScheme;
// //
// //     return ReactiveForm(
// //       formGroup: _getCurrentForm(),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           LocationStatusWidget(location: widget.location),
// //           DesignTokens.verticalSpaceMd,
// //           if (_currentStep == 0) _buildStep1Content(theme, colorScheme),
// //           if (_currentStep == 1) _buildStep2Content(theme, colorScheme),
// //           if (_currentStep == 2) _buildStep3Content(theme, colorScheme),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _buildStep1Content(ThemeData theme, ColorScheme colorScheme) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text('Step 1: Work Details',
// //             style: theme.textTheme.titleMedium
// //                 ?.copyWith(fontWeight: FontWeight.w600)),
// //         DesignTokens.verticalSpaceSmall,
// //         Text('Provide details about the work performed and parts used',
// //             style: theme.textTheme.bodyMedium
// //                 ?.copyWith(color: colorScheme.onSurfaceVariant)),
// //         DesignTokens.verticalSpaceLg,
// //         ReactiveMultilineInput(
// //           formControlName: 'workLog',
// //           hint: 'Describe the work performed...',
// //           minLines: 4,
// //           maxLines: 8,
// //         ),
// //         DesignTokens.verticalSpaceLg,
// //         Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //           children: [
// //             Text('Parts Used (Optional)',
// //                 style: theme.textTheme.bodyMedium
// //                     ?.copyWith(fontWeight: FontWeight.w500)),
// //             ReactiveFormArray(
// //               formArrayName: 'parts',
// //               builder: (context, formArray, child) {
// //                 return TextButton.icon(
// //                   onPressed: () => _handleAddPart(formArray),
// //                   icon: const Icon(Icons.add),
// //                   label: const Text('Add Part'),
// //                 );
// //               },
// //             ),
// //           ],
// //         ),
// //         RSizedBox(height: DesignTokens.space2),
// //         ReactiveFormArray(
// //           formArrayName: 'parts',
// //           builder: (context, formArray, child) {
// //             if (formArray.value == null || (formArray.value as List).isEmpty) {
// //               return Container(
// //                 padding: REdgeInsets.all(DesignTokens.space4),
// //                 decoration: BoxDecoration(
// //                   color: colorScheme.surfaceContainerHighest,
// //                   borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
// //                   border: Border.all(
// //                       color: colorScheme.outline.withValues(alpha: 0.3)),
// //                 ),
// //                 child: Row(
// //                   children: [
// //                     Icon(Icons.info_outline,
// //                         color: colorScheme.onSurfaceVariant),
// //                     RSizedBox(width: DesignTokens.space3),
// //                     Expanded(
// //                       child: Text(
// //                         'No parts added yet. Tap "Add Part" to record parts used.',
// //                         style: theme.textTheme.bodySmall?.copyWith(
// //                           color: colorScheme.onSurfaceVariant,
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               );
// //             }
// //
// //             return Column(
// //               children: List.generate(
// //                 formArray.controls.length,
// //                 (index) =>
// //                     _buildPartEntry(formArray, index, theme, colorScheme),
// //               ),
// //             );
// //           },
// //         ),
// //       ],
// //     );
// //   }
// //
// //   Widget _buildPartEntry(FormArray formArray, int index, ThemeData theme,
// //       ColorScheme colorScheme) {
// //     return ReactiveForm(
// //       formGroup: formArray.controls[index] as FormGroup,
// //       child: Container(
// //         margin: REdgeInsets.only(bottom: DesignTokens.space3),
// //         padding: REdgeInsets.all(DesignTokens.space4),
// //         decoration: BoxDecoration(
// //           color: colorScheme.surface,
// //           borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
// //           border: Border.all(color: colorScheme.outline.withValues(alpha: 0.3)),
// //         ),
// //         child: Column(
// //           children: [
// //             Row(
// //               children: [
// //                 Expanded(
// //                   child: Text('Part ${index + 1}',
// //                       style: theme.textTheme.labelMedium?.copyWith(
// //                         fontWeight: FontWeight.w600,
// //                         color: colorScheme.onSurfaceVariant,
// //                       )),
// //                 ),
// //                 IconButton(
// //                   onPressed: () => _handleRemovePart(formArray, index),
// //                   icon: const Icon(Icons.delete),
// //                   color: colorScheme.error,
// //                 ),
// //               ],
// //             ),
// //             RSizedBox(height: DesignTokens.space2),
// //             ReactiveTextInput(
// //                 formControlName: 'partNumber', label: 'Part Number'),
// //             RSizedBox(height: DesignTokens.space2),
// //             ReactiveTextInput(formControlName: 'partName', label: 'Part Name'),
// //             RSizedBox(height: DesignTokens.space2),
// //             ReactiveTextInput(
// //               formControlName: 'quantity',
// //               label: 'Quantity',
// //               keyboardType: TextInputType.number,
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildStep2Content(ThemeData theme, ColorScheme colorScheme) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text('Step 2: Capture Images',
// //             style: theme.textTheme.titleMedium
// //                 ?.copyWith(fontWeight: FontWeight.w600)),
// //         DesignTokens.verticalSpaceSmall,
// //         Text('Take photos of the completed work (optional)',
// //             style: theme.textTheme.bodyMedium
// //                 ?.copyWith(color: colorScheme.onSurfaceVariant)),
// //         DesignTokens.verticalSpaceLg,
// //         ReactiveImagePicker(formControlName: 'files', maxImages: 10),
// //       ],
// //     );
// //   }
// //
// //   Widget _buildStep3Content(ThemeData theme, ColorScheme colorScheme) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text('Step 3: Customer Signature',
// //             style: theme.textTheme.titleMedium
// //                 ?.copyWith(fontWeight: FontWeight.w600)),
// //         DesignTokens.verticalSpaceSmall,
// //         Text('Get customer confirmation and signature',
// //             style: theme.textTheme.bodyMedium
// //                 ?.copyWith(color: colorScheme.onSurfaceVariant)),
// //         DesignTokens.verticalSpaceLg,
// //         ReactiveTextInput(formControlName: 'customerName', hint: 'Enter name'),
// //         DesignTokens.verticalSpaceLg,
// //         ReactiveSignaturePad(formControlName: 'signature'),
// //         DesignTokens.verticalSpaceLg,
// //         ReactiveMultilineInput(
// //           formControlName: 'completionNotes',
// //           hint: 'Add any additional notes...',
// //           minLines: 3,
// //           maxLines: 5,
// //         ),
// //       ],
// //     );
// //   }
// //
// //   Widget _buildNavigationButtons(ThemeData theme, ColorScheme colorScheme) {
// //     final isLastStep = _currentStep == 2;
// //
// //     return Container(
// //       padding: REdgeInsets.all(DesignTokens.space4),
// //       decoration: BoxDecoration(
// //         color: colorScheme.surface,
// //         border: Border(
// //           top: BorderSide(color: colorScheme.outline.withValues(alpha: 0.2)),
// //         ),
// //       ),
// //       child: SafeArea(
// //         top: false,
// //         child: Row(
// //           children: [
// //             if (_currentStep > 0)
// //               Expanded(
// //                 child: OutlinedButton(
// //                   onPressed: () {
// //                     setState(() {
// //                       _currentStep--;
// //                     });
// //                   },
// //                   child: const Text('Back'),
// //                 ),
// //               ),
// //             if (_currentStep > 0) RSizedBox(width: DesignTokens.space3),
// //             Expanded(
// //               child: FilledButton(
// //                 onPressed: () async {
// //                   final currentForm = _getCurrentForm();
// //                   currentForm.markAllAsTouched();
// //
// //                   if (currentForm.valid) {
// //                     await _saveCache();
// //
// //                     if (isLastStep) {
// //                       _handleSubmit();
// //                     } else {
// //                       setState(() {
// //                         _currentStep++;
// //                       });
// //                     }
// //                   }
// //                 },
// //                 child: Text(isLastStep ? 'Submit' : 'Next'),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   @override
// //   void dispose() {
// //     _step1Form.dispose();
// //     _step2Form.dispose();
// //     _step3Form.dispose();
// //     super.dispose();
// //   }
// // }
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:reactive_forms/reactive_forms.dart';
//
// import '../../../../core/di/injection.dart';
// import '../../../../core/theme/design_tokens.dart';
// import '../../../../core/widgets/form/location_status_widget.dart';
// import '../../../../core/widgets/form/reactive_image_picker.dart';
// import '../../../../core/widgets/form/reactive_multiline_input.dart';
// import '../../../../core/widgets/form/reactive_signature_pad.dart';
// import '../../../../core/widgets/form/reactive_text_input.dart';
// import '../../data/models/work_order_completion_cache_model.dart';
// import '../../data/services/work_order_completion_cache_service.dart';
// import '../../domain/entities/location_entity.dart';
// import '../../domain/entities/work_order_entity.dart';
// import '../blocs/work_order_action/work_order_action_bloc.dart';
// import '../blocs/work_order_action/work_order_action_event.dart';
// import '../blocs/work_order_action/work_order_action_state.dart';
// import '../forms/work_order_forms.dart';
//
// class WorkOrderCompleteWizard extends StatefulWidget {
//   final WorkOrderEntity workOrder;
//   final LocationEntity? location;
//   final WorkOrderActionBloc bloc;
//   final WorkOrderCompletionCacheService cacheService;
//
//   const WorkOrderCompleteWizard({
//     super.key,
//     required this.workOrder,
//     required this.location,
//     required this.bloc,
//     required this.cacheService,
//   });
//
//   static Future<void> show({
//     required BuildContext context,
//     required WorkOrderEntity workOrder,
//     LocationEntity? location,
//   }) async {
//     final bloc = context.read<WorkOrderActionBloc>();
//     final cacheService = getIt<WorkOrderCompletionCacheService>();
//
//     await showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       isDismissible: false,
//       enableDrag: false,
//       builder: (bottomSheetContext) => BlocProvider.value(
//         value: bloc,
//         child: WorkOrderCompleteWizard(
//           workOrder: workOrder,
//           location: location,
//           bloc: bloc,
//           cacheService: cacheService,
//         ),
//       ),
//     );
//   }
//
//   @override
//   State<WorkOrderCompleteWizard> createState() =>
//       _WorkOrderCompleteWizardState();
// }
//
// class _WorkOrderCompleteWizardState extends State<WorkOrderCompleteWizard> {
//   int _currentStep = 0;
//   late FormGroup _step1Form;
//   late FormGroup _step2Form;
//   late FormGroup _step3Form;
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeForms();
//     _loadCachedData();
//   }
//
//   void _initializeForms() {
//     _step1Form = WorkOrderForms.buildCompleteFormStep1();
//     _step2Form = WorkOrderForms.buildCompleteFormStep2();
//     _step3Form = WorkOrderForms.buildCompleteFormStep3();
//   }
//
//   Future<void> _loadCachedData() async {
//     final cache = await widget.cacheService.loadCache(widget.workOrder.id);
//     if (cache != null && mounted) {
//       setState(() {
//         _currentStep = cache.currentStep;
//       });
//
//       if (cache.workLog != null) {
//         _step1Form.control('workLog').value = cache.workLog;
//       }
//
//       if (cache.partsUsed.isNotEmpty) {
//         final partsArray = _step1Form.control('parts') as FormArray;
//         partsArray.clear();
//         for (final cachedPart in cache.partsUsed) {
//           final partGroup = WorkOrderForms.createPartEntry(
//             partNumber: cachedPart.partNumber,
//             partName: cachedPart.partName,
//             quantity: cachedPart.quantity,
//           );
//           partsArray.add(partGroup);
//         }
//       }
//
//       if (cache.images.isNotEmpty) {
//         final imageFiles = cache.images.map((path) => File(path)).toList();
//         _step2Form.control('files').value = imageFiles;
//       }
//
//       if (cache.customerName != null) {
//         _step3Form.control('customerName').value = cache.customerName;
//       }
//       if (cache.completionNotes != null) {
//         _step3Form.control('completionNotes').value = cache.completionNotes;
//       }
//       if (cache.signaturePath != null) {
//         final signatureFile = File(cache.signaturePath!);
//         if (await signatureFile.exists()) {
//           _step3Form.control('signature').value = signatureFile;
//         }
//       }
//     }
//   }
//
//   Future<void> _saveCache() async {
//     final step1Data =
//         WorkOrderForms.getCompleteFormData(_step1Form, _step2Form, _step3Form);
//
//     final cachedParts = (step1Data['partsUsed'] as List? ?? [])
//         .map((part) => CachedPartUsedModel(
//               partNumber: part.partNumber,
//               quantity: part.quantityUsed,
//               partName: part.partName ?? '',
//               category: '',
//               quantityAvailable: 0,
//               unitPrice: 0.0,
//               status: 'used',
//             ))
//         .toList();
//
//     final imagePaths = (step1Data['files'] as List<File>? ?? [])
//         .map((file) => file.path)
//         .toList();
//
//     final cache = WorkOrderCompletionCacheModel(
//       workOrderId: widget.workOrder.id,
//       currentStep: _currentStep,
//       workLog: step1Data['workLog'],
//       partsUsed: cachedParts,
//       images: imagePaths,
//       customerName: step1Data['customerName'],
//       signaturePath: step1Data['signature']?.path,
//       completionNotes: step1Data['completionNotes'],
//       lastUpdated: DateTime.now(),
//     );
//
//     await widget.cacheService.saveCache(cache);
//   }
//
//   void _handleClose() {
//     _saveCache();
//     Navigator.of(context).pop();
//   }
//
//   void _handleAddPart(FormArray formArray) {
//     formArray.add(WorkOrderForms.createPartEntry(
//       partNumber: '',
//       partName: '',
//       quantity: 1,
//     ));
//   }
//
//   void _handleRemovePart(FormArray formArray, int index) {
//     formArray.removeAt(index);
//   }
//
//   FormGroup _getCurrentForm() {
//     switch (_currentStep) {
//       case 0:
//         return _step1Form;
//       case 1:
//         return _step2Form;
//       case 2:
//         return _step3Form;
//       default:
//         return _step1Form;
//     }
//   }
//
//   void _handleSubmit() {
//     final data = WorkOrderForms.getCompleteFormData(
//       _step1Form,
//       _step2Form,
//       _step3Form,
//     );
//
//     final workLog = data['workLog'] as String;
//     final customerName = data['customerName'] as String;
//     final signature = data['signature'] as File;
//     final partsUsed = (data['partsUsed'] as List<PartUsedEntity>?) ?? [];
//     final files = (data['files'] as List<File>?) ?? [];
//     final completionNotes = data['completionNotes'] as String?;
//     final latitude = widget.location?.latitude ?? 0.0;
//     final longitude = widget.location?.longitude ?? 0.0;
//
//     widget.bloc.add(
//       WorkOrderActionEvent.completeWorkOrder(
//         workOrderId: widget.workOrder.id,
//         workLog: workLog,
//         customerName: customerName,
//         signature: signature,
//         partsUsed: partsUsed,
//         files: files,
//         latitude: latitude,
//         longitude: longitude,
//         completionNotes: completionNotes,
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final colorScheme = theme.colorScheme;
//     final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
//
//     return BlocConsumer<WorkOrderActionBloc, WorkOrderActionState>(
//       bloc: widget.bloc,
//       listener: (context, state) {
//         state.maybeWhen(
//           actionSuccess: (workOrder, actionType, message, groupedImages) {
//             widget.cacheService.clearCache(widget.workOrder.id);
//             Navigator.of(context).pop();
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text(message),
//                 backgroundColor: colorScheme.primary,
//               ),
//             );
//           },
//           error: (failure, workOrder, isOffline) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text(failure.message),
//                 backgroundColor: colorScheme.error,
//               ),
//             );
//           },
//           orElse: () {},
//         );
//       },
//       builder: (context, state) {
//         return GestureDetector(
//           onTap: () => FocusScope.of(context).unfocus(),
//           child: Container(
//             height: MediaQuery.of(context).size.height * 0.9,
//             decoration: BoxDecoration(
//               color: colorScheme.surface,
//               borderRadius: BorderRadius.vertical(
//                 top: Radius.circular(DesignTokens.radiusLg.r),
//               ),
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 // Fixed Header
//                 _buildHeader(theme, colorScheme),
//                 Divider(height: 1.h, color: colorScheme.outline),
//
//                 // Fixed Progress Indicator
//                 _buildProgressIndicator(theme, colorScheme),
//
//                 // Scrollable Content
//                 Expanded(
//                   child: SingleChildScrollView(
//                     padding: EdgeInsets.only(
//                       left: DesignTokens.space4.w,
//                       right: DesignTokens.space4.w,
//                       top: DesignTokens.space4.h,
//                       bottom: keyboardHeight +
//                           100.h, // Space for keyboard + buttons
//                     ),
//                     keyboardDismissBehavior:
//                         ScrollViewKeyboardDismissBehavior.onDrag,
//                     child: _buildStepContent(),
//                   ),
//                 ),
//
//                 // Fixed Navigation Buttons (Outside scroll, always visible)
//                 _buildNavigationButtons(theme, colorScheme),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildHeader(ThemeData theme, ColorScheme colorScheme) {
//     return Padding(
//       padding: REdgeInsets.all(DesignTokens.space4),
//       child: Row(
//         children: [
//           Icon(Icons.check_circle, color: colorScheme.primary, size: 28.sp),
//           RSizedBox(width: DesignTokens.space3),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Complete Work Order',
//                     style: theme.textTheme.titleMedium
//                         ?.copyWith(fontWeight: FontWeight.w600)),
//                 Text('Work Order #${widget.workOrder.id}',
//                     style: theme.textTheme.bodyMedium
//                         ?.copyWith(color: colorScheme.onSurfaceVariant)),
//               ],
//             ),
//           ),
//           IconButton(
//             onPressed: _handleClose,
//             icon: Icon(Icons.close, color: colorScheme.onSurfaceVariant),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildProgressIndicator(ThemeData theme, ColorScheme colorScheme) {
//     return Padding(
//       padding:
//           REdgeInsets.symmetric(horizontal: DesignTokens.space4, vertical: 8),
//       child: Row(
//         children: [
//           _buildStepIndicator(0, 'Work Log', theme, colorScheme),
//           Expanded(child: _buildStepConnector(0, colorScheme)),
//           _buildStepIndicator(1, 'Images', theme, colorScheme),
//           Expanded(child: _buildStepConnector(1, colorScheme)),
//           _buildStepIndicator(2, 'Signature', theme, colorScheme),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildStepIndicator(
//       int step, String label, ThemeData theme, ColorScheme colorScheme) {
//     final isActive = step == _currentStep;
//     final isCompleted = step < _currentStep;
//
//     return Column(
//       children: [
//         Container(
//           width: 32.w,
//           height: 32.h,
//           decoration: BoxDecoration(
//             color: isCompleted || isActive
//                 ? colorScheme.primary
//                 : colorScheme.surfaceContainerHighest,
//             shape: BoxShape.circle,
//           ),
//           child: Center(
//             child: isCompleted
//                 ? Icon(Icons.check, color: colorScheme.onPrimary, size: 16.sp)
//                 : Text('${step + 1}',
//                     style: theme.textTheme.labelMedium?.copyWith(
//                         color: colorScheme.onPrimary,
//                         fontWeight: FontWeight.w600)),
//           ),
//         ),
//         RSizedBox(height: DesignTokens.space1),
//         Text(label,
//             style: theme.textTheme.labelSmall?.copyWith(
//               color: isActive
//                   ? colorScheme.onSurface
//                   : colorScheme.onSurfaceVariant,
//               fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
//             )),
//       ],
//     );
//   }
//
//   Widget _buildStepConnector(int step, ColorScheme colorScheme) {
//     final isCompleted = step < _currentStep;
//     return Container(
//       height: 2.h,
//       margin: REdgeInsets.only(bottom: 20.h),
//       color: isCompleted
//           ? colorScheme.primary
//           : colorScheme.surfaceContainerHighest,
//     );
//   }
//
//   Widget _buildStepContent() {
//     final theme = Theme.of(context);
//     final colorScheme = theme.colorScheme;
//
//     return ReactiveForm(
//       formGroup: _getCurrentForm(),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           LocationStatusWidget(location: widget.location),
//           DesignTokens.verticalSpaceMd,
//           if (_currentStep == 0) _buildStep1Content(theme, colorScheme),
//           if (_currentStep == 1) _buildStep2Content(theme, colorScheme),
//           if (_currentStep == 2) _buildStep3Content(theme, colorScheme),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildStep1Content(ThemeData theme, ColorScheme colorScheme) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Step 1: Work Details',
//             style: theme.textTheme.titleMedium
//                 ?.copyWith(fontWeight: FontWeight.w600)),
//         DesignTokens.verticalSpaceSmall,
//         Text('Provide details about the work performed and parts used',
//             style: theme.textTheme.bodyMedium
//                 ?.copyWith(color: colorScheme.onSurfaceVariant)),
//         DesignTokens.verticalSpaceLg,
//         ReactiveMultilineInput(
//           formControlName: 'workLog',
//           hint: 'Describe the work performed...',
//           minLines: 4,
//           maxLines: 8,
//         ),
//         DesignTokens.verticalSpaceLg,
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text('Parts Used (Optional)',
//                 style: theme.textTheme.bodyMedium
//                     ?.copyWith(fontWeight: FontWeight.w500)),
//             ReactiveFormArray(
//               formArrayName: 'parts',
//               builder: (context, formArray, child) {
//                 return TextButton.icon(
//                   onPressed: () => _handleAddPart(formArray),
//                   icon: const Icon(Icons.add),
//                   label: const Text('Add Part'),
//                 );
//               },
//             ),
//           ],
//         ),
//         RSizedBox(height: DesignTokens.space2),
//         ReactiveFormArray(
//           formArrayName: 'parts',
//           builder: (context, formArray, child) {
//             if (formArray.value == null || (formArray.value as List).isEmpty) {
//               return Container(
//                 padding: REdgeInsets.all(DesignTokens.space4),
//                 decoration: BoxDecoration(
//                   color: colorScheme.surfaceContainerHighest,
//                   borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
//                   border: Border.all(
//                       color: colorScheme.outline.withValues(alpha: 0.3)),
//                 ),
//                 child: Row(
//                   children: [
//                     Icon(Icons.info_outline,
//                         color: colorScheme.onSurfaceVariant),
//                     RSizedBox(width: DesignTokens.space3),
//                     Expanded(
//                       child: Text(
//                         'No parts added yet. Tap "Add Part" to record parts used.',
//                         style: theme.textTheme.bodySmall?.copyWith(
//                           color: colorScheme.onSurfaceVariant,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             }
//
//             return Column(
//               children: List.generate(
//                 formArray.controls.length,
//                 (index) =>
//                     _buildPartEntry(formArray, index, theme, colorScheme),
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
//
//   Widget _buildPartEntry(FormArray formArray, int index, ThemeData theme,
//       ColorScheme colorScheme) {
//     return ReactiveForm(
//       formGroup: formArray.controls[index] as FormGroup,
//       child: Container(
//         margin: REdgeInsets.only(bottom: DesignTokens.space3),
//         padding: REdgeInsets.all(DesignTokens.space4),
//         decoration: BoxDecoration(
//           color: colorScheme.surface,
//           borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
//           border: Border.all(color: colorScheme.outline.withValues(alpha: 0.3)),
//         ),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   child: Text('Part ${index + 1}',
//                       style: theme.textTheme.labelMedium?.copyWith(
//                         fontWeight: FontWeight.w600,
//                         color: colorScheme.onSurfaceVariant,
//                       )),
//                 ),
//                 IconButton(
//                   onPressed: () => _handleRemovePart(formArray, index),
//                   icon: const Icon(Icons.delete),
//                   color: colorScheme.error,
//                 ),
//               ],
//             ),
//             RSizedBox(height: DesignTokens.space2),
//             ReactiveTextInput(
//                 formControlName: 'partNumber', label: 'Part Number'),
//             RSizedBox(height: DesignTokens.space2),
//             ReactiveTextInput(formControlName: 'partName', label: 'Part Name'),
//             RSizedBox(height: DesignTokens.space2),
//             ReactiveTextInput(
//               formControlName: 'quantity',
//               label: 'Quantity',
//               keyboardType: TextInputType.number,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildStep2Content(ThemeData theme, ColorScheme colorScheme) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Step 2: Capture Images',
//             style: theme.textTheme.titleMedium
//                 ?.copyWith(fontWeight: FontWeight.w600)),
//         DesignTokens.verticalSpaceSmall,
//         Text('Take photos of the completed work (optional)',
//             style: theme.textTheme.bodyMedium
//                 ?.copyWith(color: colorScheme.onSurfaceVariant)),
//         DesignTokens.verticalSpaceLg,
//         ReactiveImagePicker(formControlName: 'files', maxImages: 10),
//       ],
//     );
//   }
//
//   Widget _buildStep3Content(ThemeData theme, ColorScheme colorScheme) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Step 3: Customer Signature',
//             style: theme.textTheme.titleMedium
//                 ?.copyWith(fontWeight: FontWeight.w600)),
//         DesignTokens.verticalSpaceSmall,
//         Text('Get customer confirmation and signature',
//             style: theme.textTheme.bodyMedium
//                 ?.copyWith(color: colorScheme.onSurfaceVariant)),
//         DesignTokens.verticalSpaceLg,
//         ReactiveTextInput(formControlName: 'customerName', hint: 'Enter name'),
//         DesignTokens.verticalSpaceLg,
//         ReactiveSignaturePad(formControlName: 'signature'),
//         DesignTokens.verticalSpaceLg,
//         ReactiveMultilineInput(
//           formControlName: 'completionNotes',
//           hint: 'Add any additional notes...',
//           minLines: 3,
//           maxLines: 5,
//         ),
//       ],
//     );
//   }
//
//   Widget _buildNavigationButtons(ThemeData theme, ColorScheme colorScheme) {
//     final isLastStep = _currentStep == 2;
//
//     return Container(
//       padding: REdgeInsets.all(DesignTokens.space4),
//       decoration: BoxDecoration(
//         color: colorScheme.surface,
//         border: Border(
//           top: BorderSide(color: colorScheme.outline.withValues(alpha: 0.2)),
//         ),
//       ),
//       child: SafeArea(
//         top: false,
//         child: Row(
//           children: [
//             if (_currentStep > 0)
//               Expanded(
//                 child: OutlinedButton(
//                   onPressed: () {
//                     setState(() {
//                       _currentStep--;
//                     });
//                   },
//                   child: const Text('Back'),
//                 ),
//               ),
//             if (_currentStep > 0) RSizedBox(width: DesignTokens.space3),
//             Expanded(
//               child: FilledButton(
//                 onPressed: () async {
//                   final currentForm = _getCurrentForm();
//                   currentForm.markAllAsTouched();
//
//                   if (currentForm.valid) {
//                     await _saveCache();
//
//                     if (isLastStep) {
//                       _handleSubmit();
//                     } else {
//                       setState(() {
//                         _currentStep++;
//                       });
//                     }
//                   }
//                 },
//                 child: Text(isLastStep ? 'Submit' : 'Next'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _step1Form.dispose();
//     _step2Form.dispose();
//     _step3Form.dispose();
//     super.dispose();
//   }
// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../core/widgets/form/reactive_image_picker.dart';
import '../../../../core/widgets/form/reactive_multiline_input.dart';
import '../../../../core/widgets/form/reactive_signature_pad.dart';
import '../../../../core/widgets/form/reactive_text_input.dart';
import '../../../parts/domain/entities/part_entity.dart';
import '../../../parts/domain/usecases/get_parts_usecase.dart';
import '../../data/models/work_order_completion_cache_model.dart';
import '../../data/services/work_order_completion_cache_service.dart';
import '../../domain/entities/location_entity.dart';
import '../../domain/entities/work_order_entity.dart';
import '../blocs/work_order_action/work_order_action_bloc.dart';
import '../blocs/work_order_action/work_order_action_event.dart';
import '../blocs/work_order_action/work_order_action_state.dart';
import '../forms/work_order_forms.dart';

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
  State<WorkOrderCompleteWizard> createState() =>
      _WorkOrderCompleteWizardState();
}

class _WorkOrderCompleteWizardState extends State<WorkOrderCompleteWizard> {
  int _currentStep = 0;
  late FormGroup _step1Form;
  late FormGroup _step2Form;
  late FormGroup _step3Form;

  // Parts management
  final _getPartsUseCase = getIt<GetPartsUseCase>();
  List<PartEntity> _availableParts = [];
  bool _isLoadingParts = false;

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

      if (cache.workLog != null) {
        _step1Form.control('workLog').value = cache.workLog;
      }

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

      if (cache.images.isNotEmpty) {
        final imageFiles = cache.images.map((path) => File(path)).toList();
        _step2Form.control('files').value = imageFiles;
      }

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
    final step1Data =
        WorkOrderForms.getCompleteFormData(_step1Form, _step2Form, _step3Form);

    final cachedParts = (step1Data['partsUsed'] as List? ?? [])
        .map((part) => CachedPartUsedModel(
              partNumber: part.partNumber,
              quantity: part.quantityUsed,
              partName: part.partName ?? '',
              category: '',
              quantityAvailable: 0,
              unitPrice: 0.0,
              status: 'used',
            ))
        .toList();

    final imagePaths = (step1Data['files'] as List<File>? ?? [])
        .map((file) => file.path)
        .toList();

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

  void _handleClose() {
    _saveCache();
    Navigator.of(context).pop();
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
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
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
            Divider(height: 1.h),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                padding: REdgeInsets.all(DesignTokens.space4),
                itemCount: _availableParts.length,
                itemBuilder: (context, index) {
                  final part = _availableParts[index];
                  return Card(
                    margin: REdgeInsets.only(bottom: DesignTokens.space3),
                    child: ListTile(
                      title: Text(
                        part.partName,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RSizedBox(height: DesignTokens.space1),
                          Text('Part #: ${part.partNumber}'),
                          Text('Category: ${part.category}'),
                          Text('Available: ${part.quantityAvailable}'),
                        ],
                      ),
                      trailing: Icon(
                        part.isInStock
                            ? Icons.check_circle
                            : part.isLowStock
                                ? Icons.warning
                                : Icons.cancel,
                        color: part.isInStock
                            ? Colors.green
                            : part.isLowStock
                                ? Colors.orange
                                : Colors.red,
                      ),
                      onTap: () {
                        formArray.add(WorkOrderForms.createPartEntry(
                          partNumber: part.partNumber,
                          partName: part.partName,
                          quantity: 1,
                        ));
                        Navigator.pop(context);
                      },
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

  void _handleSubmit() {
    final data = WorkOrderForms.getCompleteFormData(
      _step1Form,
      _step2Form,
      _step3Form,
    );

    final workLog = data['workLog'] as String;
    final customerName = data['customerName'] as String;
    final signature = data['signature'] as File;
    final partsUsed = (data['partsUsed'] as List<PartUsedEntity>?) ?? [];
    final files = (data['files'] as List<File>?) ?? [];
    final completionNotes = data['completionNotes'] as String?;
    final latitude = widget.location?.latitude ?? 0.0;
    final longitude = widget.location?.longitude ?? 0.0;

    widget.bloc.add(
      WorkOrderActionEvent.completeWorkOrder(
        workOrderId: widget.workOrder.id,
        workLog: workLog,
        customerName: customerName,
        signature: signature,
        partsUsed: partsUsed,
        files: files,
        latitude: latitude,
        longitude: longitude,
        completionNotes: completionNotes,
      ),
    );
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
              Divider(height: 1.h, color: colorScheme.outline),
              _buildProgressIndicator(theme, colorScheme),
              Flexible(child: _buildStepContent()),
              _buildNavigationButtons(theme, colorScheme),
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
          Icon(Icons.check_circle, color: colorScheme.primary, size: 28.sp),
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

  Widget _buildProgressIndicator(ThemeData theme, ColorScheme colorScheme) {
    return Padding(
      padding:
          REdgeInsets.symmetric(horizontal: DesignTokens.space4, vertical: 8),
      child: Row(
        children: [
          _buildStepIndicator(0, 'Work Log', theme, colorScheme),
          Expanded(child: _buildStepConnector(0, colorScheme)),
          _buildStepIndicator(1, 'Images', theme, colorScheme),
          Expanded(child: _buildStepConnector(1, colorScheme)),
          _buildStepIndicator(2, 'Signature', theme, colorScheme),
        ],
      ),
    );
  }

  Widget _buildStepIndicator(
      int step, String label, ThemeData theme, ColorScheme colorScheme) {
    final isActive = step == _currentStep;
    final isCompleted = step < _currentStep;

    return Column(
      children: [
        Container(
          width: 32.w,
          height: 32.h,
          decoration: BoxDecoration(
            color: isCompleted || isActive
                ? colorScheme.primary
                : colorScheme.surfaceContainerHighest,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: isCompleted
                ? Icon(Icons.check, color: colorScheme.onPrimary, size: 16.sp)
                : Text('${step + 1}',
                    style: theme.textTheme.labelMedium?.copyWith(
                        color: colorScheme.onPrimary,
                        fontWeight: FontWeight.w600)),
          ),
        ),
        RSizedBox(height: DesignTokens.space1),
        Text(label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: isActive
                  ? colorScheme.onSurface
                  : colorScheme.onSurfaceVariant,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            )),
      ],
    );
  }

  Widget _buildStepConnector(int step, ColorScheme colorScheme) {
    final isCompleted = step < _currentStep;
    return Container(
      height: 2.h,
      margin: REdgeInsets.only(bottom: 20.h),
      color: isCompleted
          ? colorScheme.primary
          : colorScheme.surfaceContainerHighest,
    );
  }

  /// 🔥 CHANGED: adds bottom padding equal to keyboard height so page scrolls
  Widget _buildStepContent() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final viewInsets = MediaQuery.of(context).viewInsets;

    return ReactiveForm(
      formGroup: _getCurrentForm(),
      child: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.only(
          left: DesignTokens.space4,
          right: DesignTokens.space4,
          top: DesignTokens.space4,
          bottom: DesignTokens.space4 + viewInsets.bottom,
        ),
        children: [
          if (_currentStep == 0) _buildStep1Content(theme, colorScheme),
          if (_currentStep == 1) _buildStep2Content(theme, colorScheme),
          if (_currentStep == 2) _buildStep3Content(theme, colorScheme),
        ],
      ),
    );
  }

  Widget _buildStep1Content(ThemeData theme, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Step 1: Work Details',
            style: theme.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.w600)),
        DesignTokens.verticalSpaceSmall,
        Text('Provide details about the work performed and parts used',
            style: theme.textTheme.bodyMedium
                ?.copyWith(color: colorScheme.onSurfaceVariant)),
        DesignTokens.verticalSpaceLg,
        ReactiveMultilineInput(
          formControlName: 'workLog',
          hint: 'Describe the work performed...',
          minLines: 4,
          maxLines: 8,
        ),
        DesignTokens.verticalSpaceLg,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Parts Used (Optional)',
                style: theme.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w500)),
            ReactiveFormArray(
              formArrayName: 'parts',
              builder: (context, formArray, child) {
                return TextButton.icon(
                  onPressed: () => _handleAddPart(formArray),
                  icon: const Icon(Icons.add),
                  label: const Text('Add Part'),
                );
              },
            ),
          ],
        ),
        RSizedBox(height: DesignTokens.space2),
        ReactiveFormArray(
          formArrayName: 'parts',
          builder: (context, formArray, child) {
            if (formArray.value == null || (formArray.value as List).isEmpty) {
              return Container(
                padding: REdgeInsets.all(DesignTokens.space4),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
                  border: Border.all(
                      color: colorScheme.outline.withValues(alpha: 0.3)),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline,
                        color: colorScheme.onSurfaceVariant),
                    RSizedBox(width: DesignTokens.space3),
                    Expanded(
                      child: Text(
                        'No parts added yet. Tap "Add Part" to record parts used.',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
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
                (index) =>
                    _buildPartEntry(formArray, index, theme, colorScheme),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildPartEntry(FormArray formArray, int index, ThemeData theme,
      ColorScheme colorScheme) {
    final partGroup = formArray.controls[index] as FormGroup;
    final partNumber = partGroup.control('partNumber').value as String? ?? '';
    final partName = partGroup.control('partName').value as String? ?? '';

    // Find the part details from available parts for additional info
    final partDetails = _availableParts.firstWhere(
      (p) => p.partNumber == partNumber,
      orElse: () => PartEntity(
        partNumber: partNumber,
        partName: partName,
        category: '',
        quantityAvailable: 0,
        unitPrice: 0.0,
        status: PartStatus.active,
      ),
    );

    return ReactiveForm(
      formGroup: partGroup,
      child: Container(
        margin: REdgeInsets.only(bottom: DesignTokens.space3),
        padding: REdgeInsets.all(DesignTokens.space4),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
          border: Border.all(color: colorScheme.outline.withValues(alpha: 0.3)),
        ),
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
                      if (partDetails.category.isNotEmpty) ...[
                        Text(
                          'Category: ${partDetails.category}',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                      if (partDetails.quantityAvailable > 0) ...[
                        Text(
                          'Available: ${partDetails.quantityAvailable}',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: partDetails.isInStock
                                ? Colors.green
                                : partDetails.isLowStock
                                    ? Colors.orange
                                    : Colors.red,
                            fontWeight: FontWeight.w500,
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
            RSizedBox(height: DesignTokens.space3),
            ReactiveTextInput(
              formControlName: 'quantity',
              label: 'Quantity Used',
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep2Content(ThemeData theme, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Step 2: Capture Images',
            style: theme.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.w600)),
        DesignTokens.verticalSpaceSmall,
        Text('Take photos of the completed work (optional)',
            style: theme.textTheme.bodyMedium
                ?.copyWith(color: colorScheme.onSurfaceVariant)),
        DesignTokens.verticalSpaceLg,
        ReactiveImagePicker(formControlName: 'files', maxImages: 10),
      ],
    );
  }

  Widget _buildStep3Content(ThemeData theme, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Step 3: Customer Signature',
            style: theme.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.w600)),
        DesignTokens.verticalSpaceSmall,
        Text('Get customer confirmation and signature',
            style: theme.textTheme.bodyMedium
                ?.copyWith(color: colorScheme.onSurfaceVariant)),
        DesignTokens.verticalSpaceLg,
        ReactiveTextInput(formControlName: 'customerName', hint: 'Enter name'),
        DesignTokens.verticalSpaceLg,
        ReactiveSignaturePad(formControlName: 'signature'),
        DesignTokens.verticalSpaceLg,
        ReactiveMultilineInput(
          formControlName: 'completionNotes',
          hint: 'Add any additional notes...',
          minLines: 3,
          maxLines: 5,
        ),
      ],
    );
  }

  Widget _buildNavigationButtons(ThemeData theme, ColorScheme colorScheme) {
    final isLastStep = _currentStep == 2;

    return Padding(
      padding: REdgeInsets.all(DesignTokens.space4),
      child: Row(
        children: [
          if (_currentStep > 0)
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    _currentStep--;
                  });
                },
                child: const Text('Back'),
              ),
            ),
          if (_currentStep > 0) RSizedBox(width: DesignTokens.space3),
          Expanded(
            child: FilledButton(
              onPressed: () async {
                final currentForm = _getCurrentForm();
                currentForm.markAllAsTouched();

                if (currentForm.valid) {
                  await _saveCache();

                  if (isLastStep) {
                    _handleSubmit();
                  } else {
                    setState(() {
                      _currentStep++;
                    });
                  }
                }
              },
              child: Text(isLastStep ? 'Submit' : 'Next'),
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
