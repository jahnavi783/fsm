import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/part_item.dart';

class PartsUsedSection extends StatelessWidget {
  final List<PartUsedEntity> partsUsed;

  const PartsUsedSection({
    super.key,
    required this.partsUsed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: partsUsed
          .map((part) => Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: PartItem(part: part),
              ))
          .toList(),
    );
  }
}
