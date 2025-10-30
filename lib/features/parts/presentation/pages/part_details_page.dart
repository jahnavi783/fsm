import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/widgets/fsm_app_bar.dart';
import '../../../../core/widgets/fsm_card.dart';
import '../../domain/entities/part_entity.dart';
import '../blocs/parts/parts_bloc.dart';
import '../blocs/parts/parts_event.dart';
import '../blocs/parts/parts_state.dart';

import '../widgets/inventory_indicator.dart';

@RoutePage()
class PartDetailsPage extends StatelessWidget {
  final String partNumber;
  final PartEntity? part;

  const PartDetailsPage({
    super.key,
    @PathParam('partNumber') required this.partNumber,
    this.part,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PartsBloc>()
        ..add(PartsEvent.loadInventoryHistory(partId: 0)),
      child: _PartDetailsPageView(
        partNumber: partNumber,
        part: part,
      ),
    );
  }
}

class _PartDetailsPageView extends StatelessWidget {
  final String partNumber;
  final PartEntity? part;

  const _PartDetailsPageView({
    required this.partNumber,
    this.part,
  });

  @override
  Widget build(BuildContext context) {
    // PopScope workaround removed - Auto Route with includePrefixMatches handles deep link stacks automatically
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: FSMAppBar.gradient(
          title: 'Part Details',
          subtitle: part?.partName ?? 'Loading...',
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
    return FSMCard(
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
                // Part image placeholder
                Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: Colors.grey[300]!),
                    color: Colors.grey[100],
                  ),
                  child: Icon(
                    Icons.inventory,
                    size: 30.sp,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Text(
              'Part Number: ${part!.partNumber}',
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
    return FSMCard(
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
                  minQuantity: 10,
                  maxQuantity: 100,
                  size: 80.w,
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: Column(
                    children: [
                      _buildInventoryRow(
                        'Current Stock',
                        '${part!.quantityAvailable} pcs',
                        part!.isLowStock
                            ? Colors.orange[700]!
                            : Colors.green[700]!,
                      ),
                      SizedBox(height: 8.h),
                      _buildInventoryRow(
                        'Minimum Stock',
                        '10 pcs',
                        Colors.grey[600]!,
                      ),
                      SizedBox(height: 8.h),
                      _buildInventoryRow(
                        'Maximum Stock',
                        '100 pcs',
                        Colors.grey[600]!,
                      ),
                      SizedBox(height: 8.h),
                      _buildInventoryRow(
                        'Unit Price',
                        '\$${part!.unitPrice.toStringAsFixed(2)}',
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
              minQuantity: 10,
              maxQuantity: 100,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecificationsCard() {
    // No additional details available for this part
    return Container();
  }
}

Widget _buildInventoryHistoryCard() {
  return FSMCard(
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
                      _getHistoryIcon(
                          history['type'] as String? ?? 'adjustment'),
                      color: _getHistoryColor(
                          history['type'] as String? ?? 'adjustment'),
                      size: 20.sp,
                    ),
                    title: Text(
                      _getHistoryTitle(
                          history['type'] as String? ?? 'adjustment'),
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      history['reason'] as String? ?? 'No reason provided',
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
                          () {
                            final change =
                                history['quantityChange'] as int? ?? 0;
                            return '${change > 0 ? '+' : ''}$change';
                          }(),
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: (history['quantityChange'] as int? ?? 0) > 0
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                        Text(
                          _formatDate(history['timestamp'] as DateTime? ??
                              DateTime.now()),
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
      color: color.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(6.r),
      border: Border.all(color: color.withValues(alpha: 0.3)),
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
