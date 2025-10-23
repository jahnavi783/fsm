import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/info_item_card.dart';

class MachineDetailsSection extends StatelessWidget {
  final dynamic serviceRequest;

  const MachineDetailsSection({
    super.key,
    required this.serviceRequest,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: InfoItemCard(
                label: 'Machine Serial',
                value: serviceRequest.machineSerial ?? 'N/A',
                icon: Icons.qr_code,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: InfoItemCard(
                label: 'Model',
                value: serviceRequest.model ?? 'Power Adapter',
                icon: Icons.devices,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        InfoItemCard(
          label: 'Machine on Warranty',
          value: serviceRequest.underWarranty ?? 'Warranty Exceeded',
          icon: Icons.verified_user_outlined,
        ),
      ],
    );
  }
}
