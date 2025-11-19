import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/widgets/indicators/carousel_page_indicator.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/presentation/widgets/cards/in_progress_work_order_card.dart';

/// Horizontal scrollable carousel displaying in-progress work orders
///
/// Features:
/// - PageView with smooth page-snapping scroll
/// - Peek of next card visible (viewportFraction: 0.82)
/// - Page indicator dots below carousel
/// - Empty state when no in-progress work orders
class InProgressWorkOrderCarousel extends StatefulWidget {
  const InProgressWorkOrderCarousel({
    super.key,
    required this.workOrders,
  });

  final List<WorkOrderEntity> workOrders;

  @override
  State<InProgressWorkOrderCarousel> createState() =>
      _InProgressWorkOrderCarouselState();
}

class _InProgressWorkOrderCarouselState
    extends State<InProgressWorkOrderCarousel> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.82,
      initialPage: 0,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Show empty state when no in-progress work orders
    if (widget.workOrders.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: REdgeInsets.only(
              left: DesignTokens.space4, top: DesignTokens.space3),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'In Progress',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onPrimary,
              ),
            ),
          ),
        ),
        DesignTokens.verticalSpaceSmall,
        SizedBox(
          height: 140.h,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: widget.workOrders.length,
            padEnds: false,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: index == 0
                    ? REdgeInsets.only(left: DesignTokens.space4)
                    : EdgeInsets.zero,
                child: InProgressWorkOrderCard(
                  workOrder: widget.workOrders[index],
                ),
              );
            },
          ),
        ),
        DesignTokens.verticalSpaceSmall,
        if (widget.workOrders.length > 1)
          Center(
            child: CarouselPageIndicator(
              itemCount: widget.workOrders.length,
              currentIndex: _currentPage,
            ),
          ),
      ],
    );
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }
}
