import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/info_item_card.dart';
import 'package:fsm/core/theme/design_tokens.dart';

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
        DesignTokens.verticalSpaceSmall,
        Row(
          children: [
            Expanded(
              child: InfoItemCard(
                label: 'Location',
                value: customer.city ?? customer.address ?? 'N/A',
                icon: Icons.location_on,
              ),
            ),
            DesignTokens.horizontalSpaceMd,
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
