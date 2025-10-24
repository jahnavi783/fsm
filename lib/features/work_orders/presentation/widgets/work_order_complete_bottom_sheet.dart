import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/location_entity.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_order_action/work_order_action_bloc.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_order_action/work_order_action_event.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_order_action/work_order_action_state.dart';

class WorkOrderCompleteBottomSheet extends StatefulWidget {
  final WorkOrderEntity workOrder;
  final LocationEntity? currentLocation;

  const WorkOrderCompleteBottomSheet({
    super.key,
    required this.workOrder,
    this.currentLocation,
  });

  @override
  State<WorkOrderCompleteBottomSheet> createState() =>
      _WorkOrderCompleteBottomSheetState();
}

class _WorkOrderCompleteBottomSheetState
    extends State<WorkOrderCompleteBottomSheet> {
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _customerNameController =
      TextEditingController();
  final TextEditingController _workLogController = TextEditingController();
  final TextEditingController _completionNotesController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();

  final List<XFile> _imageFiles = [];
  final List<PartUsedInput> _partsUsed = [];
  bool _hasSignature = false;

  @override
  void dispose() {
    _customerNameController.dispose();
    _workLogController.dispose();
    _completionNotesController.dispose();
    super.dispose();
  }

  Future<void> _getImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );
      if (pickedFile != null) {
        setState(() {
          _imageFiles.add(pickedFile);
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error capturing image: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  void _removeImage(int index) {
    setState(() {
      _imageFiles.removeAt(index);
    });
  }

  void _showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(top: 12.h),
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                children: [
                  Text(
                    'Add Image',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildImageSourceOption(
                        icon: Icons.camera_alt,
                        label: 'Camera',
                        onTap: () {
                          Navigator.pop(context);
                          _getImage(ImageSource.camera);
                        },
                      ),
                      _buildImageSourceOption(
                        icon: Icons.photo_library,
                        label: 'Gallery',
                        onTap: () {
                          Navigator.pop(context);
                          _getImage(ImageSource.gallery);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSourceOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60.w,
            height: 60.w,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Icon(
              icon,
              size: 28.sp,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  void _addPartUsed() {
    setState(() {
      _partsUsed.add(PartUsedInput(
        partNumberController: TextEditingController(),
        quantityController: TextEditingController(text: '1'),
      ));
    });
  }

  void _removePartUsed(int index) {
    setState(() {
      _partsUsed[index].dispose();
      _partsUsed.removeAt(index);
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
      final signatureData =
          await _signaturePadKey.currentState?.toImage(pixelRatio: 3.0);
      if (signatureData == null) return null;

      final byteData =
          await signatureData.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) return null;

      final buffer = byteData.buffer.asUint8List();
      final tempDir = await getTemporaryDirectory();
      final file = File(
          '${tempDir.path}/signature_${DateTime.now().millisecondsSinceEpoch}.png');
      await file.writeAsBytes(buffer);
      return file;
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error saving signature: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocConsumer<WorkOrderActionBloc, WorkOrderActionState>(
      listener: (context, state) {
        state.maybeWhen(
          actionSuccess: (workOrder, actionType, message, _) {
            Navigator.of(context).pop(true);
          },
          error: (failure, workOrder, isOffline) {
            // Error handling is already done in parent widget
          },
          locationError: (workOrder, message) {
            // Location error handling is already done in parent widget
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
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
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
                                      .withOpacity(0.6),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (!isLoading)
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.close,
                              size: 20.sp,
                              color:
                                  theme.colorScheme.onSurface.withOpacity(0.6),
                            ),
                          ),
                      ],
                    ),
                  ),

                  // Content
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Current Time Display
                          Container(
                            padding: EdgeInsets.all(16.w),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.surfaceVariant
                                  .withOpacity(0.3),
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
                                        color: theme.colorScheme.onSurface
                                            .withOpacity(0.7),
                                      ),
                                    ),
                                    Text(
                                      DateFormat('MMM dd, yyyy HH:mm')
                                          .format(DateTime.now()),
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
                          ),

                          SizedBox(height: 16.h),

                          // Location Status
                          Container(
                            padding: EdgeInsets.all(16.w),
                            decoration: BoxDecoration(
                              color: widget.currentLocation != null
                                  ? AppColors.success.withOpacity(0.1)
                                  : AppColors.warning.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(
                                color: widget.currentLocation != null
                                    ? AppColors.success.withOpacity(0.3)
                                    : AppColors.warning.withOpacity(0.3),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  widget.currentLocation != null
                                      ? Icons.location_on
                                      : Icons.location_searching,
                                  size: 20.sp,
                                  color: widget.currentLocation != null
                                      ? AppColors.success
                                      : AppColors.warning,
                                ),
                                SizedBox(width: 12.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.currentLocation != null
                                            ? 'Location Captured'
                                            : 'Getting Location',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          color: widget.currentLocation != null
                                              ? AppColors.success
                                              : AppColors.warning,
                                        ),
                                      ),
                                      if (widget.currentLocation != null)
                                        Text(
                                          '${widget.currentLocation!.latitude.toStringAsFixed(6)}, ${widget.currentLocation!.longitude.toStringAsFixed(6)}',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: theme.colorScheme.onSurface
                                                .withOpacity(0.6),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                if (widget.currentLocation == null)
                                  SizedBox(
                                    width: 16.w,
                                    height: 16.h,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        AppColors.warning,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),

                          SizedBox(height: 20.h),

                          // Customer Name Section (Required)
                          Text(
                            'Customer Name *',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          TextFormField(
                            controller: _customerNameController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter customer name';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter customer name...',
                              prefixIcon: Icon(Icons.person_outline),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              contentPadding: EdgeInsets.all(16.w),
                            ),
                          ),

                          SizedBox(height: 20.h),

                          // Work Log Section (Required)
                          Text(
                            'Work Log *',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          TextFormField(
                            controller: _workLogController,
                            maxLines: 4,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please describe the work performed';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText:
                                  'Describe the work performed, issues resolved, etc...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              contentPadding: EdgeInsets.all(16.w),
                            ),
                          ),

                          SizedBox(height: 20.h),

                          // Parts Used Section (Optional)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Parts Used (Optional)',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextButton.icon(
                                onPressed: _addPartUsed,
                                icon: Icon(Icons.add, size: 18.sp),
                                label: Text('Add Part'),
                              ),
                            ],
                          ),
                          if (_partsUsed.isNotEmpty) ...[
                            SizedBox(height: 8.h),
                            ..._partsUsed.asMap().entries.map((entry) {
                              final index = entry.key;
                              final part = entry.value;
                              return _buildPartUsedInput(part, index);
                            }),
                          ],

                          SizedBox(height: 20.h),

                          // Signature Section (Required)
                          Text(
                            'Customer Signature *',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Container(
                            height: 200.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: _hasSignature
                                    ? AppColors.success
                                    : AppColors.outline.withOpacity(0.5),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(11.r),
                              child: SfSignaturePad(
                                key: _signaturePadKey,
                                backgroundColor: Colors.white,
                                strokeColor: Colors.black,
                                minimumStrokeWidth: 1.0,
                                maximumStrokeWidth: 3.0,
                                onDrawStart: () {
                                  setState(() {
                                    _hasSignature = true;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              Icon(
                                _hasSignature ? Icons.check_circle : Icons.info,
                                size: 16.sp,
                                color: _hasSignature
                                    ? AppColors.success
                                    : AppColors.warning,
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: Text(
                                  _hasSignature
                                      ? 'Signature captured'
                                      : 'Draw customer signature above',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: _hasSignature
                                        ? AppColors.success
                                        : theme.colorScheme.onSurface
                                            .withOpacity(0.6),
                                  ),
                                ),
                              ),
                              TextButton.icon(
                                onPressed: _clearSignature,
                                icon: Icon(Icons.clear, size: 16.sp),
                                label: Text('Clear'),
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.w, vertical: 4.h),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 20.h),

                          // Completion Notes Section (Optional)
                          Text(
                            'Completion Notes (Optional)',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          TextFormField(
                            controller: _completionNotesController,
                            maxLines: 3,
                            decoration: InputDecoration(
                              hintText: 'Add any additional notes...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              contentPadding: EdgeInsets.all(16.w),
                            ),
                          ),

                          SizedBox(height: 20.h),

                          // Image Section
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Capture Images (Optional)',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '${_imageFiles.length} image${_imageFiles.length != 1 ? 's' : ''}',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: theme.colorScheme.onSurface
                                      .withOpacity(0.6),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),

                          // Image Grid
                          Wrap(
                            spacing: 12.w,
                            runSpacing: 12.h,
                            children: [
                              // Display captured images
                              ..._imageFiles.asMap().entries.map((entry) {
                                final index = entry.key;
                                final image = entry.value;
                                return _buildImageThumbnail(image, index);
                              }),
                              // Add image button
                              _buildAddImageButton(),
                            ],
                          ),

                          SizedBox(height: 32.h),

                          // Action Buttons
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: isLoading
                                      ? null
                                      : () => Navigator.pop(context),
                                  style: OutlinedButton.styleFrom(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 16.h),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                  ),
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                flex: 2,
                                child: ElevatedButton(
                                  onPressed: (isLoading ||
                                          widget.currentLocation == null ||
                                          !_hasSignature)
                                      ? null
                                      : _completeWorkOrder,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.success,
                                    foregroundColor: Colors.white,
                                    padding:
                                        EdgeInsets.symmetric(vertical: 16.h),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                    elevation: 2,
                                  ),
                                  child: isLoading
                                      ? SizedBox(
                                          width: 20.w,
                                          height: 20.h,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.white),
                                          ),
                                        )
                                      : Text(
                                          'Complete Work Order',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPartUsedInput(PartUsedInput part, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.outline.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: TextFormField(
              controller: part.partNumberController,
              decoration: InputDecoration(
                labelText: 'Part Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 12.h,
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: TextFormField(
              controller: part.quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Qty',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 12.h,
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          IconButton(
            onPressed: () => _removePartUsed(index),
            icon: Icon(Icons.delete, color: AppColors.error),
            style: IconButton.styleFrom(
              padding: EdgeInsets.all(8.w),
              minimumSize: Size(32.w, 32.h),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageThumbnail(XFile image, int index) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: SizedBox(
            width: 100.w,
            height: 100.w,
            child: Image.file(
              File(image.path),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 4.h,
          right: 4.w,
          child: GestureDetector(
            onTap: () => _removeImage(index),
            child: Container(
              width: 24.w,
              height: 24.w,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 16.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddImageButton() {
    return GestureDetector(
      onTap: _showImageSourceDialog,
      child: Container(
        width: 100.w,
        height: 100.w,
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: AppColors.primary.withOpacity(0.3),
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_a_photo_outlined,
              color: AppColors.primary,
              size: 28.sp,
            ),
            SizedBox(height: 4.h),
            Text(
              'Add Image',
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _completeWorkOrder() async {
    if (_formKey.currentState?.validate() != true) {
      return;
    }

    if (!_hasSignature) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please capture customer signature'),
          backgroundColor: AppColors.warning,
        ),
      );
      return;
    }

    if (widget.currentLocation == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please wait for location to be captured'),
          backgroundColor: AppColors.warning,
        ),
      );
      return;
    }

    // Save signature as file
    final signatureFile = await _saveSignatureAsFile();
    if (signatureFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to save signature'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    // Convert image files
    final files = _imageFiles.map((xFile) => File(xFile.path)).toList();

    // Parse parts used
    final partsUsed = _partsUsed
        .where((part) =>
            part.partNumberController.text.trim().isNotEmpty &&
            part.quantityController.text.trim().isNotEmpty)
        .map((part) => PartUsedEntity(
              partNumber: part.partNumberController.text.trim(),
              quantityUsed: int.tryParse(part.quantityController.text.trim()) ?? 0,
            ))
        .toList();

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
  }
}

class PartUsedInput {
  final TextEditingController partNumberController;
  final TextEditingController quantityController;

  PartUsedInput({
    required this.partNumberController,
    required this.quantityController,
  });

  void dispose() {
    partNumberController.dispose();
    quantityController.dispose();
  }
}
