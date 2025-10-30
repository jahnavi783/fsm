import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fsm/core/theme/app_colors.dart';

/// Model for part used input
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

/// Step 2: Resources
/// Collects parts used and images
class ResourcesStep extends StatefulWidget {
  final List<PartUsedInput> partsUsed;
  final List<XFile> imageFiles;
  final VoidCallback onAddPart;
  final Function(int) onRemovePart;
  final Function(XFile) onAddImage;
  final Function(int) onRemoveImage;

  const ResourcesStep({
    super.key,
    required this.partsUsed,
    required this.imageFiles,
    required this.onAddPart,
    required this.onRemovePart,
    required this.onAddImage,
    required this.onRemoveImage,
  });

  @override
  State<ResourcesStep> createState() => _ResourcesStepState();
}

class _ResourcesStepState extends State<ResourcesStep> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _getImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );
      if (pickedFile != null) {
        widget.onAddImage(pickedFile);
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
            onPressed: () => widget.onRemovePart(index),
            icon: const Icon(Icons.delete, color: AppColors.error),
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
            onTap: () => widget.onRemoveImage(index),
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Step header
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              Container(
                width: 32.w,
                height: 32.w,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '2',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Resources',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      'Parts used and images (optional)',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: theme.colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 24.h),

        // Parts Used Section
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Parts Used (Optional)',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
              ),
            ),
            TextButton.icon(
              onPressed: widget.onAddPart,
              icon: Icon(Icons.add, size: 18.sp),
              label: const Text('Add Part'),
            ),
          ],
        ),

        if (widget.partsUsed.isNotEmpty) ...[
          SizedBox(height: 8.h),
          ...widget.partsUsed.asMap().entries.map((entry) {
            final index = entry.key;
            final part = entry.value;
            return _buildPartUsedInput(part, index);
          }),
        ],

        if (widget.partsUsed.isEmpty) ...[
          SizedBox(height: 8.h),
          Container(
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
                  Icons.info_outline,
                  size: 20.sp,
                  color: theme.colorScheme.onSurface.withOpacity(0.5),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    'No parts added yet. Tap "Add Part" to include parts used.',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: theme.colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],

        SizedBox(height: 24.h),

        // Images Section
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Capture Images (Optional)',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
              ),
            ),
            Text(
              '${widget.imageFiles.length} image${widget.imageFiles.length != 1 ? 's' : ''}',
              style: TextStyle(
                fontSize: 14.sp,
                color: theme.colorScheme.onSurface.withOpacity(0.6),
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
            ...widget.imageFiles.asMap().entries.map((entry) {
              final index = entry.key;
              final image = entry.value;
              return _buildImageThumbnail(image, index);
            }),
            // Add image button
            _buildAddImageButton(),
          ],
        ),

        SizedBox(height: 16.h),

        // Helper text
        Row(
          children: [
            Icon(
              Icons.info_outline,
              size: 16.sp,
              color: theme.colorScheme.onSurface.withOpacity(0.5),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                'All fields in this step are optional. You can skip to the next step.',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: theme.colorScheme.onSurface.withOpacity(0.5),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
