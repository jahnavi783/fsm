import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingCircles extends StatelessWidget {
  const LoadingCircles({
    super.key,
    required AnimationController controller,
  }) : _controller = controller;

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: 20.w,
          height: 20.h,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          transform: Matrix4.translationValues(0, _controller.value * 10, 0),
        );
      },
    );
  }
}