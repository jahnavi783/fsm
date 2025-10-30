import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/core/di/injection.dart';
import 'package:fsm/features/parts/domain/entities/part_entity.dart';
import 'package:fsm/features/parts/domain/usecases/get_parts_usecase.dart';
import 'models/part_used_input.dart';
import 'components/part_used_card.dart';

/// Step 1: Work Log and Parts Used
/// Collects work log and allows parts selection from inventory
class WorkAndPartsStep extends StatefulWidget {
  final TextEditingController workLogController;
  final GlobalKey<FormState> formKey;
  final List<PartUsedInput> partsUsed;
  final Function(PartUsedInput) onAddPart;
  final Function(int) onRemovePart;
  final bool enableMultiSelect;
  final Function(List<PartUsedInput>)? onAddMultipleParts;

  const WorkAndPartsStep({
    super.key,
    required this.workLogController,
    required this.formKey,
    required this.partsUsed,
    required this.onAddPart,
    required this.onRemovePart,
    this.enableMultiSelect = false,
    this.onAddMultipleParts,
  });

  @override
  State<WorkAndPartsStep> createState() => _WorkAndPartsStepState();
}

class _WorkAndPartsStepState extends State<WorkAndPartsStep> {
  final _getPartsUseCase = getIt<GetPartsUseCase>();
  List<PartEntity> _availableParts = [];
  bool _isLoadingParts = false;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();
  final Set<String> _selectedPartNumbers = {};

  @override
  void initState() {
    super.initState();
    _loadParts();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadParts() async {
    setState(() {
      _isLoadingParts = true;
    });

    final result = await _getPartsUseCase(searchQuery: _searchQuery);
    result.fold(
      (failure) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to load parts: ${failure.message}'),
              backgroundColor: AppColors.error,
            ),
          );
        }
        setState(() {
          _isLoadingParts = false;
        });
      },
      (parts) {
        setState(() {
          _availableParts = parts.where((p) => p.status == PartStatus.active).toList();
          _isLoadingParts = false;
        });
      },
    );
  }

  void _showPartsSelectionDialog() {
    // Reset selected parts at the start
    _selectedPartNumbers.clear();
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: !widget.enableMultiSelect,
      enableDrag: !widget.enableMultiSelect,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => DraggableScrollableSheet(
          initialChildSize: 0.9,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          expand: false,
          builder: (context, scrollController) => Column(
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.enableMultiSelect ? 'Select Parts' : 'Select Part',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (widget.enableMultiSelect && _selectedPartNumbers.isNotEmpty)
                          Text(
                            '${_selectedPartNumbers.length} selected',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 16.h),

                    // Search bar
                    TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search parts...',
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: _searchController.text.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  _searchController.clear();
                                  setState(() {
                                    _searchQuery = '';
                                  });
                                  _loadParts();
                                },
                              )
                            : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        contentPadding: EdgeInsets.all(16.w),
                      ),
                      onSubmitted: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                        _loadParts();
                      },
                    ),
                  ],
                ),
              ),

              // Parts list
              Expanded(
                child: _isLoadingParts
                    ? const Center(child: CircularProgressIndicator())
                    : _availableParts.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.inventory_2_outlined,
                                  size: 64.sp,
                                  color: Colors.grey,
                                ),
                                SizedBox(height: 16.h),
                                Text(
                                  'No parts available',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            controller: scrollController,
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            itemCount: _availableParts.length,
                            itemBuilder: (context, index) {
                              final part = _availableParts[index];
                              final isAlreadyAdded = widget.partsUsed
                                  .any((p) => p.part.partNumber == part.partNumber);
                              final isSelected = _selectedPartNumbers.contains(part.partNumber);

                              return Card(
                                margin: EdgeInsets.only(bottom: 12.h),
                                child: ListTile(
                                  contentPadding: EdgeInsets.all(12.w),
                                  leading: Container(
                                    width: 48.w,
                                    height: 48.w,
                                    decoration: BoxDecoration(
                                      color: part.isInStock
                                          ? AppColors.success.withValues(alpha: 0.1)
                                          : AppColors.error.withValues(alpha: 0.1),
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: Icon(
                                      Icons.inventory_2,
                                      color: part.isInStock
                                          ? AppColors.success
                                          : AppColors.error,
                                    ),
                                  ),
                                  title: Text(
                                    part.partName,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 4.h),
                                      Text(
                                        'Part #: ${part.partNumber}',
                                        style: TextStyle(fontSize: 12.sp),
                                      ),
                                      Text(
                                        'Available: ${part.quantityAvailable}',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: part.isInStock
                                              ? AppColors.success
                                              : AppColors.error,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  trailing: isAlreadyAdded
                                      ? Icon(
                                          Icons.check_circle,
                                          color: AppColors.success,
                                          size: 24.sp,
                                        )
                                      : widget.enableMultiSelect
                                          ? Checkbox(
                                              value: isSelected,
                                              onChanged: (value) {
                                                setModalState(() {
                                                  if (value == true) {
                                                    _selectedPartNumbers.add(part.partNumber);
                                                  } else {
                                                    _selectedPartNumbers.remove(part.partNumber);
                                                  }
                                                });
                                              },
                                            )
                                          : Icon(
                                              Icons.add_circle_outline,
                                              color: AppColors.primary,
                                              size: 24.sp,
                                            ),
                                  onTap: isAlreadyAdded
                                      ? null
                                      : () {
                                          if (widget.enableMultiSelect) {
                                            setModalState(() {
                                              if (isSelected) {
                                                _selectedPartNumbers.remove(part.partNumber);
                                              } else {
                                                _selectedPartNumbers.add(part.partNumber);
                                              }
                                            });
                                          } else {
                                            widget.onAddPart(PartUsedInput(
                                              part: part,
                                              quantityController:
                                                  TextEditingController(text: '1'),
                                            ));
                                            Navigator.pop(context);
                                          }
                                        },
                                ),
                              );
                            },
                          ),
              ),

              // Add selected button (only for multi-select mode)
              if (widget.enableMultiSelect) ...[
                Container(
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: Offset(0, -2.h),
                      ),
                    ],
                  ),
                  child: SafeArea(
                    top: false,
                    child: ElevatedButton(
                      onPressed: _selectedPartNumbers.isEmpty
                          ? null
                          : () {
                              final selectedParts = _availableParts
                                  .where((p) => _selectedPartNumbers.contains(p.partNumber))
                                  .map((part) => PartUsedInput(
                                        part: part,
                                        quantityController: TextEditingController(text: '1'),
                                      ))
                                  .toList();
                              
                              if (widget.onAddMultipleParts != null) {
                                widget.onAddMultipleParts!(selectedParts);
                              }
                              
                              Navigator.pop(context);
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        minimumSize: Size(double.infinity, 48.h),
                      ),
                      child: Text(
                        'Add ${_selectedPartNumbers.length} Part${_selectedPartNumbers.length == 1 ? '' : 's'}',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Form(
      key: widget.formKey,
      child: Column(
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
                      '1',
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
                        'Work Details',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        'Work log and parts used',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 24.h),

          // Work Log Field (Required)
          Text(
            'Work Log *',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 8.h),
          TextFormField(
            controller: widget.workLogController,
            maxLines: 4,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please describe the work performed';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Describe the work performed, issues resolved, etc...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: AppColors.outline.withValues(alpha: 0.3),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(
                  color: AppColors.error,
                ),
              ),
              contentPadding: EdgeInsets.all(16.w),
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
                onPressed: _showPartsSelectionDialog,
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
              return PartUsedCard(
                partInput: part,
                index: index,
                onRemove: () => widget.onRemovePart(index),
              );
            }),
          ],

          if (widget.partsUsed.isEmpty) ...[
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: AppColors.outline.withValues(alpha: 0.2),
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
                      'No parts added yet. Tap "Add Part" to select from inventory.',
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
                  'Work log is required. Parts are optional but recommended.',
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
      ),
    );
  }
}
