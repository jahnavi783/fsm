import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entities/part_entity.dart';
import '../../domain/entities/inventory_entity.dart';

class InventoryUpdateForm extends StatefulWidget {
  final PartEntity part;
  final ValueChanged<InventoryUpdateData>? onSubmit;
  final VoidCallback? onCancel;

  const InventoryUpdateForm({
    super.key,
    required this.part,
    this.onSubmit,
    this.onCancel,
  });

  @override
  State<InventoryUpdateForm> createState() => _InventoryUpdateFormState();
}

class _InventoryUpdateFormState extends State<InventoryUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _quantityController = TextEditingController();
  final _reasonController = TextEditingController();
  final _notesController = TextEditingController();
  final _workOrderController = TextEditingController();

  InventoryUpdateType _selectedType = InventoryUpdateType.adjustment;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _quantityController.dispose();
    _reasonController.dispose();
    _notesController.dispose();
    _workOrderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Update Inventory',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        '${widget.part.partName} (${widget.part.partNumber})',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: widget.onCancel,
                  icon: Icon(Icons.close, size: 24.sp),
                ),
              ],
            ),
            SizedBox(height: 20.h),

            // Current stock info
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Current Stock:',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '${widget.part.quantityAvailable} ${widget.part.unit}',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: widget.part.isLowStock ? Colors.orange[700] : Colors.green[700],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            // Update type
            Text(
              'Update Type',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8.h),
            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: InventoryUpdateType.values.map((type) {
                final isSelected = _selectedType == type;
                return GestureDetector(
                  onTap: () => setState(() => _selectedType = type),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: isSelected ? Theme.of(context).primaryColor : Colors.grey[100],
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                        color: isSelected ? Theme.of(context).primaryColor : Colors.grey[300]!,
                      ),
                    ),
                    child: Text(
                      _getUpdateTypeLabel(type),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: isSelected ? Colors.white : Colors.grey[700],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16.h),

            // Quantity change
            TextFormField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^-?\d*')),
              ],
              decoration: InputDecoration(
                labelText: 'Quantity Change',
                hintText: _getQuantityHint(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                suffixText: widget.part.unit,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter quantity change';
                }
                final quantity = int.tryParse(value);
                if (quantity == null) {
                  return 'Please enter a valid number';
                }
                if (quantity == 0) {
                  return 'Quantity change cannot be zero';
                }
                return null;
              },
            ),
            SizedBox(height: 16.h),

            // Work Order ID (optional)
            TextFormField(
              controller: _workOrderController,
              decoration: InputDecoration(
                labelText: 'Work Order ID (Optional)',
                hintText: 'Enter work order number if applicable',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
            SizedBox(height: 16.h),

            // Reason
            TextFormField(
              controller: _reasonController,
              decoration: InputDecoration(
                labelText: 'Reason *',
                hintText: 'Enter reason for inventory update',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a reason';
                }
                return null;
              },
            ),
            SizedBox(height: 16.h),

            // Notes (optional)
            TextFormField(
              controller: _notesController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Notes (Optional)',
                hintText: 'Additional notes or comments',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
            SizedBox(height: 24.h),

            // Action buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _isSubmitting ? null : widget.onCancel,
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _isSubmitting ? null : _handleSubmit,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: _isSubmitting
                        ? SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : Text(
                            'Update Inventory',
                            style: TextStyle(fontSize: 14.sp),
                          ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
          ],
        ),
      ),
    );
  }

  String _getUpdateTypeLabel(InventoryUpdateType type) {
    switch (type) {
      case InventoryUpdateType.usage:
        return 'Usage';
      case InventoryUpdateType.restock:
        return 'Restock';
      case InventoryUpdateType.adjustment:
        return 'Adjustment';
      case InventoryUpdateType.returned:
        return 'Return';
      case InventoryUpdateType.damaged:
        return 'Damaged';
      case InventoryUpdateType.lost:
        return 'Lost';
    }
  }

  String _getQuantityHint() {
    switch (_selectedType) {
      case InventoryUpdateType.usage:
      case InventoryUpdateType.damaged:
      case InventoryUpdateType.lost:
        return 'Enter negative number (e.g., -5)';
      case InventoryUpdateType.restock:
      case InventoryUpdateType.returned:
        return 'Enter positive number (e.g., 10)';
      case InventoryUpdateType.adjustment:
        return 'Enter positive or negative number';
    }
  }

  void _handleSubmit() {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    final quantityChange = int.parse(_quantityController.text);
    
    final updateData = InventoryUpdateData(
      partId: widget.part.id,
      quantityChange: quantityChange,
      type: _selectedType,
      reason: _reasonController.text.trim(),
      workOrderId: _workOrderController.text.trim().isEmpty 
          ? null 
          : _workOrderController.text.trim(),
      notes: _notesController.text.trim().isEmpty 
          ? null 
          : _notesController.text.trim(),
    );

    widget.onSubmit?.call(updateData);
  }
}

class InventoryUpdateData {
  final int partId;
  final int quantityChange;
  final InventoryUpdateType type;
  final String reason;
  final String? workOrderId;
  final String? notes;

  InventoryUpdateData({
    required this.partId,
    required this.quantityChange,
    required this.type,
    required this.reason,
    this.workOrderId,
    this.notes,
  });
}