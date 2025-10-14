import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart';
import '../../../../core/di/injection.dart';
import '../../domain/entities/part_entity.dart';
import '../blocs/parts/parts_bloc.dart';
import '../blocs/parts/parts_event.dart';
import '../blocs/parts/parts_state.dart';
import '../widgets/inventory_indicator.dart';
import '../widgets/inventory_update_form.dart';

@RoutePage()
class PartDetailsPage extends StatelessWidget {
  final int partId;
  final PartEntity? part;

  const PartDetailsPage({
    super.key,
    required this.partId,
    this.part,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PartsBloc>()
        ..add(PartsEvent.loadInventoryHistory(partId: partId)),
      child: _PartDetailsPageView(
        partId: partId,
        part: part,
      ),
    );
  }
}

class _PartDetailsPageView extends StatelessWidget {
  final int partId;
  final PartEntity? part;

  const _PartDetailsPageView({
    required this.partId,
    this.part,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Part Details'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
        actions: [
          if (part != null)
            IconButton(
              onPressed: () => _showInventoryUpdateForm(context, part!),
              icon: const Icon(Icons.edit),
              tooltip: 'Update Inventory',
            ),
        ],
      ),
      body: part == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildPartInfoCard(),
                  SizedBox(height: 16.h),
                  _buildInventoryCard(),
                  SizedBox(height: 16.h),
                  _buildSpecificationsCard(),
                  SizedBox(height: 16.h),
                  _buildInventoryHistoryCard(),
                ],
              ),
            ),
    );
  }

  Widget _buildPartInfoCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
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
                        part!.partName,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Part #: ${part!.partNumber}',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                if (part!.imageUrl != null)
                  Container(
                    width: 60.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.network(
                        part!.imageUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.image_not_supported,
                            size: 30.sp,
                            color: Colors.grey[400],
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 16.h),
            Text(
              part!.description,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[700],
                height: 1.4,
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                _buildInfoChip(
                  label: part!.category,
                  icon: Icons.category,
                  color: Colors.blue,
                ),
                SizedBox(width: 8.w),
                _buildInfoChip(
                  label: _getStatusText(part!.status),
                  icon: Icons.info,
                  color: _getStatusColor(part!.status),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Unit Price',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  '\$${part!.unitPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.green[700],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInventoryCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Inventory Status',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                InventoryIndicator(
                  quantity: part!.quantityAvailable,
                  minQuantity: part!.minQuantity,
                  maxQuantity: part!.maxQuantity,
                  size: 80.w,
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: Column(
                    children: [
                      _buildInventoryRow(
                        'Current Stock',
                        '${part!.quantityAvailable} ${part!.unit}',
                        part!.isLowStock ? Colors.orange[700]! : Colors.green[700]!,
                      ),
                      SizedBox(height: 8.h),
                      _buildInventoryRow(
                        'Minimum Stock',
                        '${part!.minQuantity} ${part!.unit}',
                        Colors.grey[600]!,
                      ),
                      SizedBox(height: 8.h),
                      _buildInventoryRow(
                        'Maximum Stock',
                        '${part!.maxQuantity} ${part!.unit}',
                        Colors.grey[600]!,
                      ),
                      SizedBox(height: 8.h),
                      _buildInventoryRow(
                        'Total Value',
                        '\$${part!.totalValue.toStringAsFixed(2)}',
                        Colors.green[700]!,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            InventoryLevelBar(
              quantity: part!.quantityAvailable,
              minQuantity: part!.minQuantity,
              maxQuantity: part!.maxQuantity,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecificationsCard() {
    if (part!.specifications == null && part!.compatibleModels.isEmpty) {
      return const SizedBox.shrink();
    }

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Specifications',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 12.h),
            if (part!.specifications != null) ...[
              Text(
                part!.specifications!,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey[700],
                  height: 1.4,
                ),
              ),
              if (part!.compatibleModels.isNotEmpty) SizedBox(height: 12.h),
            ],
            if (part!.compatibleModels.isNotEmpty) ...[
              Text(
                'Compatible Models',
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
                children: part!.compatibleModels.map((model) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(6.r),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Text(
                      model,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[700],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInventoryHistoryCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Inventory History',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 12.h),
            BlocBuilder<PartsBloc, PartsState>(
              builder: (context, state) {
                if (state.inventoryHistory.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: Text(
                        'No inventory history available',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                  );
                }

                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.inventoryHistory.length,
                  separatorBuilder: (context, index) => Divider(height: 1.h),
                  itemBuilder: (context, index) {
                    final history = state.inventoryHistory[index];
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(
                        _getHistoryIcon(history.type),
                        color: _getHistoryColor(history.type),
                        size: 20.sp,
                      ),
                      title: Text(
                        _getHistoryTitle(history.type),
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        history.reason,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${history.quantityChange > 0 ? '+' : ''}${history.quantityChange}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: history.quantityChange > 0 ? Colors.green : Colors.red,
                            ),
                          ),
                          Text(
                            _formatDate(history.timestamp),
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip({
    required String label,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14.sp,
            color: color,
          ),
          SizedBox(width: 4.w),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInventoryRow(String label, String value, Color valueColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.grey[600],
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: valueColor,
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(PartStatus status) {
    switch (status) {
      case PartStatus.active:
        return Colors.green;
      case PartStatus.inactive:
        return Colors.grey;
      case PartStatus.discontinued:
        return Colors.red;
      case PartStatus.backordered:
        return Colors.orange;
    }
  }

  String _getStatusText(PartStatus status) {
    switch (status) {
      case PartStatus.active:
        return 'Active';
      case PartStatus.inactive:
        return 'Inactive';
      case PartStatus.discontinued:
        return 'Discontinued';
      case PartStatus.backordered:
        return 'Backordered';
    }
  }

  IconData _getHistoryIcon(type) {
    switch (type.toString()) {
      case 'InventoryUpdateType.usage':
        return Icons.remove_circle_outline;
      case 'InventoryUpdateType.restock':
        return Icons.add_circle_outline;
      case 'InventoryUpdateType.adjustment':
        return Icons.tune;
      case 'InventoryUpdateType.returned':
        return Icons.undo;
      case 'InventoryUpdateType.damaged':
        return Icons.warning;
      case 'InventoryUpdateType.lost':
        return Icons.error;
      default:
        return Icons.history;
    }
  }

  Color _getHistoryColor(type) {
    switch (type.toString()) {
      case 'InventoryUpdateType.usage':
      case 'InventoryUpdateType.damaged':
      case 'InventoryUpdateType.lost':
        return Colors.red;
      case 'InventoryUpdateType.restock':
      case 'InventoryUpdateType.returned':
        return Colors.green;
      case 'InventoryUpdateType.adjustment':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  String _getHistoryTitle(type) {
    switch (type.toString()) {
      case 'InventoryUpdateType.usage':
        return 'Used';
      case 'InventoryUpdateType.restock':
        return 'Restocked';
      case 'InventoryUpdateType.adjustment':
        return 'Adjusted';
      case 'InventoryUpdateType.returned':
        return 'Returned';
      case 'InventoryUpdateType.damaged':
        return 'Damaged';
      case 'InventoryUpdateType.lost':
        return 'Lost';
      default:
        return 'Updated';
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  void _showInventoryUpdateForm(BuildContext context, PartEntity part) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => InventoryUpdateForm(
        part: part,
        onSubmit: (updateData) {
          context.read<PartsBloc>().add(
            PartsEvent.updateInventory(
              partId: updateData.partId,
              quantityChange: updateData.quantityChange,
              type: updateData.type,
              reason: updateData.reason,
              workOrderId: updateData.workOrderId,
              notes: updateData.notes,
            ),
          );
          Navigator.of(context).pop();
        },
        onCancel: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}