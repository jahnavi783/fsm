import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/forms/reactive_file_control.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

/// Reusable reactive image picker widget
/// Integrates with ReactiveFileControl for form management
class ReactiveImagePicker extends StatelessWidget {
  final String formControlName;
  final int maxImages;
  final bool required;
  final String? label;

  const ReactiveImagePicker({
    super.key,
    required this.formControlName,
    this.maxImages = 10,
    this.required = false,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveFormField<List<File>, List<File>>(
      formControlName: formControlName,
      builder: (ReactiveFormFieldState<List<File>, List<File>> field) {
        final files = field.value ?? [];
        final hasError = field.errorText != null && field.control.touched;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (label != null) ...[
              Row(
                children: [
                  Text(
                    label!,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  if (required) ...[
                    SizedBox(width: 4.w),
                    Text(
                      '*',
                      style: TextStyle(
                        color: AppColors.error,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ],
              ),
              SizedBox(height: 12.h),
            ],

            // Add image button
            InkWell(
              onTap: files.length < maxImages
                  ? () => _showImageSourceDialog(context, field)
                  : null,
              borderRadius: BorderRadius.circular(8.r),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: files.length < maxImages
                      ? AppColors.primary.withValues(alpha: 0.05)
                      : AppColors.grey200,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: hasError
                        ? AppColors.error
                        : AppColors.outline.withValues(alpha: 0.5),
                    width: 1.5,
                  ),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.add_photo_alternate_outlined,
                      size: 32.sp,
                      color: files.length < maxImages
                          ? AppColors.primary
                          : AppColors.grey500,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      files.length < maxImages
                          ? 'Add Photos'
                          : 'Maximum $maxImages photos',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: files.length < maxImages
                            ? AppColors.primary
                            : AppColors.grey600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (files.isNotEmpty) ...[
                      SizedBox(height: 4.h),
                      Text(
                        '${files.length} of $maxImages photos',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.grey600,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),

            // Image grid
            if (files.isNotEmpty) ...[
              SizedBox(height: 16.h),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.w,
                  mainAxisSpacing: 8.h,
                  childAspectRatio: 1,
                ),
                itemCount: files.length,
                itemBuilder: (context, index) {
                  final file = files[index];
                  return _ImageThumbnail(
                    file: file,
                    onRemove: () {
                      final control = field.control as ReactiveFileControl;
                      control.removeFile(index);
                    },
                  );
                },
              ),
            ],

            // Error message
            if (hasError) ...[
              SizedBox(height: 8.h),
              Text(
                field.errorText!,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.error,
                ),
              ),
            ],
          ],
        );
      },
    );
  }

  Future<void> _showImageSourceDialog(
    BuildContext context,
    ReactiveFormFieldState<List<File>, List<File>> field,
  ) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (bottomSheetContext) => Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.r),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppColors.grey400,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            SizedBox(height: 20.h),

            Text(
              'Add Photo',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20.h),

            _ImageSourceOption(
              icon: Icons.camera_alt,
              label: 'Take Photo',
              onTap: () {
                Navigator.pop(bottomSheetContext);
                _pickImage(ImageSource.camera, field);
              },
            ),
            SizedBox(height: 12.h),
            _ImageSourceOption(
              icon: Icons.photo_library,
              label: 'Choose from Gallery',
              onTap: () {
                Navigator.pop(bottomSheetContext);
                _pickImage(ImageSource.gallery, field);
              },
            ),

            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage(
    ImageSource source,
    ReactiveFormFieldState<List<File>, List<File>> field,
  ) async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: source,
      imageQuality: 85,
      maxWidth: 1920,
      maxHeight: 1920,
    );

    if (pickedFile != null) {
      final file = File(pickedFile.path);
      final control = field.control as ReactiveFileControl;
      control.addFile(file);
    }
  }
}

class _ImageSourceOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ImageSourceOption({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.outline),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(icon, color: AppColors.primary, size: 24.sp),
            ),
            SizedBox(width: 16.w),
            Text(
              label,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ImageThumbnail extends StatelessWidget {
  final File file;
  final VoidCallback onRemove;

  const _ImageThumbnail({
    required this.file,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.outline),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.file(
              file,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 4.h,
            right: 4.w,
            child: GestureDetector(
              onTap: onRemove,
              child: Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.6),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.close,
                  size: 16.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
