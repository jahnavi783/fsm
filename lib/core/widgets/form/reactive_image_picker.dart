import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';
import 'package:fsm/core/widgets/form/reactive_file_control.dart';
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
    final theme = Theme.of(context);

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
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontSize: DesignTokens.fontSize14.sp,
                      fontWeight: DesignTokens.fontWeightSemiBold,
                    ),
                  ),
                  if (required) ...[
                    RSizedBox(width: DesignTokens.space1),
                    Text(
                      '*',
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: theme.colorScheme.error,
                        fontSize: DesignTokens.fontSize14.sp,
                      ),
                    ),
                  ],
                ],
              ),
              RSizedBox(height: DesignTokens.space3),
            ],

            // Add image button
            InkWell(
              onTap: files.length < maxImages
                  ? () => _showImageSourceDialog(context, field)
                  : null,
              borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
              child: Container(
                width: double.infinity,
                padding: REdgeInsets.all(DesignTokens.space4),
                decoration: BoxDecoration(
                  color: files.length < maxImages
                      ? theme.colorScheme.primary.withValues(alpha: 0.05)
                      : theme.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
                  border: Border.all(
                    color: hasError
                        ? theme.colorScheme.error
                        : theme.colorScheme.outline.withValues(alpha: 0.5),
                    width: DesignTokens.borderWidthMedium,
                  ),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.add_photo_alternate_outlined,
                      size: DesignTokens.iconLg.sp,
                      color: files.length < maxImages
                          ? theme.colorScheme.primary
                          : theme.colorScheme.onSurfaceVariant,
                    ),
                    RSizedBox(height: DesignTokens.space2),
                    Text(
                      files.length < maxImages
                          ? 'Add Photos'
                          : 'Maximum $maxImages photos',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: DesignTokens.fontSize14.sp,
                        color: files.length < maxImages
                            ? theme.colorScheme.primary
                            : theme.colorScheme.onSurfaceVariant,
                        fontWeight: DesignTokens.fontWeightMedium,
                      ),
                    ),
                    if (files.isNotEmpty) ...[
                      RSizedBox(height: DesignTokens.space1),
                      Text(
                        '${files.length} of $maxImages photos',
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: DesignTokens.fontSize12.sp,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),

            // Image grid
            if (files.isNotEmpty) ...[
              RSizedBox(height: DesignTokens.space4),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: DesignTokens.space2.w,
                  mainAxisSpacing: DesignTokens.space2.h,
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
              RSizedBox(height: DesignTokens.space2),
              Text(
                field.errorText!,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: DesignTokens.fontSize12.sp,
                  color: theme.colorScheme.error,
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
    final theme = Theme.of(context);

    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (bottomSheetContext) => Container(
        padding: REdgeInsets.all(DesignTokens.space5),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(DesignTokens.radiusLg.r),
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
                color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(DesignTokens.radiusXs.r),
              ),
            ),
            RSizedBox(height: DesignTokens.space5),

            Text(
              'Add Photo',
              style: theme.textTheme.titleLarge?.copyWith(
                fontSize: DesignTokens.fontSize18.sp,
                fontWeight: DesignTokens.fontWeightSemiBold,
              ),
            ),
            RSizedBox(height: DesignTokens.space5),

            _ImageSourceOption(
              icon: Icons.camera_alt,
              label: 'Take Photo',
              onTap: () {
                Navigator.pop(bottomSheetContext);
                _pickImage(ImageSource.camera, field);
              },
            ),
            RSizedBox(height: DesignTokens.space3),
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
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
      child: Container(
        padding: REdgeInsets.all(DesignTokens.space4),
        decoration: BoxDecoration(
          border: Border.all(
            color: theme.colorScheme.outline,
            width: DesignTokens.borderWidthThin,
          ),
          borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
        ),
        child: Row(
          children: [
            Container(
              padding: REdgeInsets.all(DesignTokens.space3),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
              ),
              child: Icon(
                icon,
                color: theme.colorScheme.primary,
                size: DesignTokens.iconMd.sp,
              ),
            ),
            RSizedBox(width: DesignTokens.space4),
            Text(
              label,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontSize: DesignTokens.fontSize16.sp,
                fontWeight: DesignTokens.fontWeightMedium,
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
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
        border: Border.all(
          color: theme.colorScheme.outline,
          width: DesignTokens.borderWidthThin,
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
            child: Image.file(
              file,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: DesignTokens.space1.h,
            right: DesignTokens.space1.w,
            child: GestureDetector(
              onTap: onRemove,
              child: Container(
                padding: REdgeInsets.all(DesignTokens.space1),
                decoration: BoxDecoration(
                  color: theme.colorScheme.scrim.withValues(alpha: 0.6),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.close,
                  size: DesignTokens.iconSm.sp,
                  color: theme.colorScheme.onInverseSurface,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
