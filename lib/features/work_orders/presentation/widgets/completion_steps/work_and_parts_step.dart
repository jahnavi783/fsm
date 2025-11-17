import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';
import 'package:fsm/core/di/injection.dart';
import 'package:fsm/core/widgets/inputs/fsm_search_bar.dart';
import 'package:fsm/core/widgets/inputs/fsm_filter_chip_group.dart';
import 'package:fsm/core/widgets/inputs/quantity_selector.dart';
import 'package:fsm/core/widgets/buttons/fsm_button.dart';
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
  String? _selectedCategory;
  final Map<String, int> _partQuantities = {}; // Part number -> quantity

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
          _availableParts =
              parts.where((p) => p.status == PartStatus.active).toList();
          _isLoadingParts = false;
        });
      },
    );
  }

  List<PartEntity> _getFilteredParts() {
    return _availableParts.where((part) {
      // Search filter
      final matchesSearch = _searchQuery.isEmpty ||
          part.partName.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          part.partNumber.toLowerCase().contains(_searchQuery.toLowerCase());

      // Category filter
      final matchesCategory = _selectedCategory == null ||
          _selectedCategory == 'All' ||
          part.category == _selectedCategory;

      return matchesSearch && matchesCategory;
    }).toList();
  }

  List<String> _getUniqueCategories() {
    final categories = _availableParts
        .map((p) => p.category)
        .where((cat) => cat.isNotEmpty)
        .toSet()
        .toList()
      ..sort();
    return ['All', ...categories];
  }

  double _calculateTotalCost() {
    double total = 0.0;
    for (final partNumber in _selectedPartNumbers) {
      final part = _availableParts.firstWhere(
        (p) => p.partNumber == partNumber,
        orElse: () => _availableParts.first,
      );
      final quantity = _partQuantities[partNumber] ?? 1;
      total += part.unitPrice * quantity;
    }
    return total;
  }

  void _showPartsSelectionDialog() {
    // Reset state at the start
    _selectedPartNumbers.clear();
    _partQuantities.clear();
    _selectedCategory = null;
    _searchQuery = '';
    _searchController.clear();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: !widget.enableMultiSelect,
      enableDrag: !widget.enableMultiSelect,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(DesignTokens.radiusLg.r),
        ),
      ),
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) {
          final fsmTheme = context.fsmTheme;
          final filteredParts = _getFilteredParts();
          final categories = _getUniqueCategories();

          return DraggableScrollableSheet(
            initialChildSize: 0.9,
            minChildSize: 0.5,
            maxChildSize: 0.95,
            expand: false,
            builder: (context, scrollController) => Column(
              children: [
                // Handle bar
                Container(
                  margin: REdgeInsets.only(top: DesignTokens.space3),
                  width: 40.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .outline
                        .withValues(alpha: 0.3),
                    borderRadius:
                        BorderRadius.circular(DesignTokens.radiusXs.r),
                  ),
                ),

                // Header with close button
                Padding(
                  padding: REdgeInsets.all(DesignTokens.space4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.enableMultiSelect
                            ? 'Add Parts'
                            : 'Add Part',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      if (widget.enableMultiSelect &&
                          _selectedPartNumbers.isNotEmpty)
                        Container(
                          padding: REdgeInsets.symmetric(
                            horizontal: DesignTokens.space3,
                            vertical: DesignTokens.space1,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .primaryContainer,
                            borderRadius: BorderRadius.circular(
                                DesignTokens.radiusFull.r),
                          ),
                          child: Text(
                            '${_selectedPartNumbers.length} selected',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                    ],
                  ),
                ),

                // Search bar
                Padding(
                  padding: REdgeInsets.symmetric(
                    horizontal: DesignTokens.space4,
                  ),
                  child: FSMSearchBar(
                    hintText: 'Search parts by name or number...',
                    onChanged: (value) {
                      setModalState(() {
                        _searchQuery = value;
                      });
                    },
                  ),
                ),

                // Category filters
                if (categories.length > 1) ...[
                  DesignTokens.verticalSpaceMedium,
                  Padding(
                    padding: REdgeInsets.symmetric(
                      horizontal: DesignTokens.space4,
                    ),
                    child: FSMFilterChipGroup<String>(
                      options: categories
                          .map((cat) => FilterChipData(
                                value: cat,
                                label: cat,
                                leadingIcon:
                                    cat == 'All' ? Icons.grid_view : null,
                              ))
                          .toList(),
                      selectedValues: _selectedCategory != null
                          ? [_selectedCategory!]
                          : ['All'],
                      onSelectionChanged: (selected) {
                        setModalState(() {
                          _selectedCategory =
                              selected.isEmpty || selected.first == 'All'
                                  ? null
                                  : selected.first;
                        });
                      },
                      multiSelect: false,
                    ),
                  ),
                ],

                DesignTokens.verticalSpaceMedium,

                // Parts list
                Expanded(
                  child: _isLoadingParts
                      ? const Center(child: CircularProgressIndicator())
                      : filteredParts.isEmpty
                          ? _buildEmptyState(context)
                          : ListView.builder(
                              controller: scrollController,
                              padding: REdgeInsets.symmetric(
                                horizontal: DesignTokens.space4,
                              ),
                              itemCount: filteredParts.length,
                              itemBuilder: (context, index) {
                                final part = filteredParts[index];
                                final isAlreadyAdded = widget.partsUsed
                                    .any((p) =>
                                        p.part.partNumber == part.partNumber);
                                final isSelected = _selectedPartNumbers
                                    .contains(part.partNumber);
                                final quantity =
                                    _partQuantities[part.partNumber] ?? 1;

                                return _buildPartCard(
                                  context,
                                  part,
                                  isAlreadyAdded,
                                  isSelected,
                                  quantity,
                                  fsmTheme,
                                  setModalState,
                                );
                              },
                            ),
                ),

                // Bottom summary and action button
                if (widget.enableMultiSelect) ...[
                  Container(
                    padding: REdgeInsets.all(DesignTokens.space4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context)
                              .colorScheme
                              .shadow
                              .withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: Offset(0, -2.h),
                        ),
                      ],
                    ),
                    child: SafeArea(
                      top: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (_selectedPartNumbers.isNotEmpty) ...[
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${_selectedPartNumbers.length} part${_selectedPartNumbers.length == 1 ? '' : 's'} selected',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Text(
                                  'Total: \$${_calculateTotalCost().toStringAsFixed(2)}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                ),
                              ],
                            ),
                            DesignTokens.verticalSpaceMedium,
                          ],
                          FsmButton.primary(
                            text: _selectedPartNumbers.isEmpty
                                ? 'Select Parts'
                                : 'Add ${_selectedPartNumbers.length} Part${_selectedPartNumbers.length == 1 ? '' : 's'}',
                            onPressed: _selectedPartNumbers.isEmpty
                                ? null
                                : _handleAddSelectedParts,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inventory_2_outlined,
            size: DesignTokens.iconXxl.sp,
            color: Theme.of(context)
                .colorScheme
                .onSurface
                .withValues(alpha: 0.4),
          ),
          DesignTokens.verticalSpaceMedium,
          Text(
            _searchQuery.isNotEmpty || _selectedCategory != null
                ? 'No parts found'
                : 'No parts available',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.6),
                ),
          ),
          if (_searchQuery.isNotEmpty || _selectedCategory != null) ...[
            DesignTokens.verticalSpaceSmall,
            Text(
              'Try adjusting your search or filters',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.5),
                  ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildPartCard(
    BuildContext context,
    PartEntity part,
    bool isAlreadyAdded,
    bool isSelected,
    int quantity,
    FSMThemeExtension fsmTheme,
    StateSetter setModalState,
  ) {
    final stockColor = fsmTheme.getStockColorByQuantity(
      part.quantityAvailable,
      10, // minQuantity
      50, // maxQuantity
    );

    return Card(
      margin: REdgeInsets.only(bottom: DesignTokens.space3),
      child: Padding(
        padding: REdgeInsets.all(DesignTokens.space4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Part icon with stock indicator
                Container(
                  width: 48.w,
                  height: 48.w,
                  decoration: BoxDecoration(
                    color: stockColor.withValues(alpha: 0.1),
                    borderRadius:
                        BorderRadius.circular(DesignTokens.radiusMd.r),
                  ),
                  child: Icon(
                    Icons.inventory_2,
                    color: stockColor,
                    size: DesignTokens.iconMd.sp,
                  ),
                ),
                RSizedBox(width: DesignTokens.space3),

                // Part info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        part.partName,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      RSizedBox(height: DesignTokens.space1),
                      Text(
                        '#${part.partNumber}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withValues(alpha: 0.6),
                            ),
                      ),
                    ],
                  ),
                ),

                // Selection checkbox or checkmark
                if (isAlreadyAdded)
                  Icon(
                    Icons.check_circle,
                    color: fsmTheme.success,
                    size: DesignTokens.iconMd.sp,
                  )
                else if (widget.enableMultiSelect)
                  Checkbox(
                    value: isSelected,
                    onChanged: (value) {
                      setModalState(() {
                        if (value == true) {
                          _selectedPartNumbers.add(part.partNumber);
                          _partQuantities[part.partNumber] = 1;
                        } else {
                          _selectedPartNumbers.remove(part.partNumber);
                          _partQuantities.remove(part.partNumber);
                        }
                      });
                    },
                  )
                else
                  IconButton(
                    icon: Icon(
                      Icons.add_circle_outline,
                      color: Theme.of(context).colorScheme.primary,
                      size: DesignTokens.iconMd.sp,
                    ),
                    onPressed: () {
                      widget.onAddPart(PartUsedInput(
                        part: part,
                        quantityController: TextEditingController(text: '1'),
                      ));
                      Navigator.pop(context);
                    },
                  ),
              ],
            ),

            DesignTokens.verticalSpaceMedium,

            // Stock info and price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Stock: ${part.quantityAvailable}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: stockColor,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    RSizedBox(width: DesignTokens.space3),
                    Text(
                      '\$${part.unitPrice.toStringAsFixed(2)}/unit',
                      style:
                          Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withValues(alpha: 0.8),
                              ),
                    ),
                  ],
                ),
              ],
            ),

            // Quantity selector (only if selected in multi-select mode)
            if (widget.enableMultiSelect && isSelected && !isAlreadyAdded) ...[
              DesignTokens.verticalSpaceMedium,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  QuantitySelector(
                    initialQuantity: quantity,
                    availableStock: part.quantityAvailable,
                    onQuantityChanged: (newQuantity) {
                      setModalState(() {
                        _partQuantities[part.partNumber] = newQuantity;
                      });
                    },
                  ),
                  Text(
                    'Total: \$${(part.unitPrice * quantity).toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _handleClearSearch() {
    _searchController.clear();
    setState(() {
      _searchQuery = '';
    });
    _loadParts();
  }

  void _handleAddSelectedParts() {
    final selectedParts = _availableParts
        .where((p) => _selectedPartNumbers.contains(p.partNumber))
        .map((part) {
          final quantity = _partQuantities[part.partNumber] ?? 1;
          return PartUsedInput(
            part: part,
            quantityController: TextEditingController(text: quantity.toString()),
          );
        })
        .toList();

    if (widget.onAddMultipleParts != null) {
      widget.onAddMultipleParts!(selectedParts);
    }

    Navigator.pop(context);
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
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8.r),
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
                        color: AppColors.onPrimary,
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
                color: theme.colorScheme.surfaceContainerHighest
                    .withValues(alpha: 0.3),
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
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Text(
                      'No parts added yet. Tap "Add Part" to select from inventory.',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color:
                            theme.colorScheme.onSurface.withValues(alpha: 0.6),
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
