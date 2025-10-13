import 'package:flutter/material.dart';

import '../themes/app_theme.dart';

showCustomSnackbar(BuildContext context, String text,
    {Color color = AppColors.errorColor}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      showCloseIcon: true,
      behavior: SnackBarBehavior.floating,
      backgroundColor: color,
      dismissDirection: DismissDirection.vertical,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}
