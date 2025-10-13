import 'package:flutter/material.dart';

import '../resources/image_resources.dart';

class NoDataWidget extends StatelessWidget {
  final String title;
  final String description;

  const NoDataWidget({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: (8)),
      child: Center(
        child: Card(
          elevation: 0,
          color: Colors.green.shade50,
          child: Padding(
            padding: EdgeInsets.all((10)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image.asset(
                //   AppImages.csgLogo,
                //   height: (75),
                // ),
                Text(
                  "No $title Data!",
                  style: TextStyle(
                    fontSize: (25),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: (18),
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
