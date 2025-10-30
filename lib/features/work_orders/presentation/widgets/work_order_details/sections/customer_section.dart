import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/info_item_card.dart';

class CustomerSection extends StatelessWidget {
  final dynamic customer;

  const CustomerSection({
    super.key,
    required this.customer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoItemCard(
          label: 'Customer Name',
          value: customer.name ?? 'N/A',
          icon: Icons.person,
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Expanded(
              child: InfoItemCard(
                label: 'Location',
                value: customer.city ?? customer.address ?? 'N/A',
                icon: Icons.location_on,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: InfoItemCard(
                label: 'Postal Code',
                value: customer.postalCode ?? 'N/A',
                icon: Icons.local_post_office,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
