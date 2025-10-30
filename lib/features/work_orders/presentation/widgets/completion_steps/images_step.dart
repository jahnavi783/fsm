import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fsm/core/theme/app_colors.dart';

/// Step 2: Images (Optional)
/// Allows capturing/selecting images for work order completion
class ImagesStep extends StatefulWidget {
  final List<XFile> imageFiles;
  final Function(XFile) onAddImage;
  final Function(int) onRemoveImage;

  const ImagesStep({
    super.key,
    required this.imageFiles,
    required this.onAddImage,
    required this.onRemoveImage,
  });

  @override
  State<ImagesStep> createState() => _ImagesStepState();
}

class _ImagesStepState extends State<ImagesStep> {
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
                      'Images',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      'Capture photos (optional)',
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

        // Images Section
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Capture Images',
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

        // Info card for empty state
        if (widget.imageFiles.isEmpty)
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: AppColors.primary.withOpacity(0.2),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.photo_camera_outlined,
                  size: 32.sp,
                  color: AppColors.primary,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add Photos',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Document the work with photos. This step is optional.',
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
                'This step is optional. You can skip to the next step or add photos for documentation.',
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
