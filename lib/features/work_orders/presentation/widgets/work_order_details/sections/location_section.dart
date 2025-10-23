import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/features/work_orders/domain/entities/location_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/info_item_card.dart';

class LocationSection extends StatelessWidget {
  final WorkOrderEntity workOrder;
  final LocationEntity? currentLocation;
  final bool isLocationLoading;

  const LocationSection({
    super.key,
    required this.workOrder,
    this.currentLocation,
    this.isLocationLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        InfoItemCard(
          label: 'Address',
          value: workOrder.location,
          icon: Icons.location_on,
        ),
        SizedBox(height: 8.h),
        if (currentLocation != null) ...[
          InfoItemCard(
            label: 'Current GPS',
            value: '${currentLocation!.latitude.toStringAsFixed(6)}, ${currentLocation!.longitude.toStringAsFixed(6)}',
            icon: Icons.gps_fixed,
          ),
          SizedBox(height: 8.h),
          InfoItemCard(
            label: 'Accuracy',
            value: '${currentLocation!.accuracy?.toStringAsFixed(1)}m',
            icon: Icons.my_location,
          ),
        ] else if (isLocationLoading) ...[
          Row(
            children: [
              Icon(
                Icons.gps_fixed,
                size: 16.sp,
                color: theme.colorScheme.onSurface.withOpacity(0.6),
              ),
              SizedBox(width: 8.w),
              Text(
                'Getting current location...',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
              SizedBox(width: 8.w),
              SizedBox(
                width: 16.w,
                height: 16.h,
                child: const CircularProgressIndicator(strokeWidth: 2),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
