import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/theme/design_tokens.dart';

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

  void _handleRemovePart(int index) {
    widget.onRemovePart(index);
  }

  void _handleCameraImage(BuildContext context) {
    Navigator.pop(context);
    _getImage(ImageSource.camera);
  }

  void _handleGalleryImage(BuildContext context) {
    Navigator.pop(context);
    _getImage(ImageSource.gallery);
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
        widget.onAddImage(pickedFile);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error capturing image: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
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
              margin: REdgeInsets.only(top: DesignTokens.space3),
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(DesignTokens.radiusXs.r),
              ),
            ),
            Padding(
              padding: REdgeInsets.all(DesignTokens.space5),
              child: Column(
                children: [
                  Text(
                    'Add Image',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  RSizedBox(height: DesignTokens.space5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildImageSourceOption(
                        icon: Icons.camera_alt,
                        label: 'Camera',
                        onTap: () => _handleCameraImage(context),
                      ),
                      _buildImageSourceOption(
                        icon: Icons.photo_library,
                        label: 'Gallery',
                        onTap: () => _handleGalleryImage(context),
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
              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
            ),
            child: Icon(
              icon,
              size: DesignTokens.iconMd.sp,
              color: Theme.of(context).colorScheme.primary,
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
      margin: REdgeInsets.only(bottom: DesignTokens.space3),
      padding: REdgeInsets.all(DesignTokens.space3),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
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
            onPressed: () => _handleRemovePart(index),
            icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.error),
            style: IconButton.styleFrom(
              padding: REdgeInsets.all(DesignTokens.space2),
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
            child: Builder(
              builder: (context) => Container(
                width: 24.w,
                height: 24.w,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.error,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.2),
                      blurRadius: DesignTokens.elevationSm,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.close,
                  color: Theme.of(context).colorScheme.onError,
                  size: DesignTokens.iconSm.sp,
                ),
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
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
            width: DesignTokens.borderWidthMedium,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_a_photo_outlined,
              color: Theme.of(context).colorScheme.primary,
              size: DesignTokens.iconMd.sp,
            ),
            RSizedBox(height: DesignTokens.space1),
            Text(
              'Add Image',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.primary,
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
          padding: REdgeInsets.all(DesignTokens.space4),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
          ),
          child: Row(
            children: [
              Container(
                width: 32.w,
                height: 32.w,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '2',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onPrimary,
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
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        RSizedBox(height: DesignTokens.space6),

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
          RSizedBox(height: DesignTokens.space2),
          Container(
            padding: REdgeInsets.all(DesignTokens.space4),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
              border: Border.all(
                color: theme.colorScheme.outline.withValues(alpha: 0.2),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  size: DesignTokens.iconMd.sp,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                ),
                RSizedBox(width: DesignTokens.space3),
                Expanded(
                  child: Text(
                    'No parts added yet. Tap "Add Part" to include parts used.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],

        RSizedBox(height: DesignTokens.space6),

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
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),

        RSizedBox(height: DesignTokens.space3),

        // Image Grid
        Wrap(
          spacing: DesignTokens.space3.w,
          runSpacing: DesignTokens.space3.h,
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

        RSizedBox(height: DesignTokens.space4),

        // Helper text
        Row(
          children: [
            Icon(
              Icons.info_outline,
              size: DesignTokens.iconSm.sp,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
            ),
            RSizedBox(width: DesignTokens.space2),
            Expanded(
              child: Text(
                'All fields in this step are optional. You can skip to the next step.',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
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
