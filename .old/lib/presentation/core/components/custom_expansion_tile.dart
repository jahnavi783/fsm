import 'package:flutter/material.dart';

import '../themes/app_theme.dart';

class CustomExpansionTile extends StatefulWidget {
  final Widget title;
  final Widget subTitle;
  final bool initiallyExpanded;
  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.subTitle,
    this.initiallyExpanded = false,
  });

  @override
  CustomExpansionTileState createState() => CustomExpansionTileState();
}

class CustomExpansionTileState extends State<CustomExpansionTile> {
  late bool isExpanded;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular((10)),
        border: Border.all(
          color: AppColors.blackColor,
          width: 1.25,
        ),
      ),
      padding: EdgeInsets.all(12),
      child: InkWell(
        onTap: () {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.title,
                AnimatedRotation(
                  turns: isExpanded ? 0.5 : 0,
                  duration: Duration(milliseconds: 300),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    size: (30),
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ],
            ),
            AnimatedSize(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: isExpanded
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: widget.subTitle)
                  : SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
