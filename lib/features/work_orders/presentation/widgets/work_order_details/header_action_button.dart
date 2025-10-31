import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/design_tokens.dart';
import '../../../../../core/theme/extensions/fsm_theme_extension.dart';

class HeaderActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const HeaderActionButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final fsmTheme = context.fsmTheme;
    
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          padding: REdgeInsets.all(DesignTokens.space2 + 2),
          decoration: BoxDecoration(
            color: colorScheme.onPrimary.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: colorScheme.onPrimary.withOpacity(0.2),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: fsmTheme.shadowCard,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: colorScheme.onPrimary,
            size: 18.sp,
          ),
        ),
      ),
    );
  }
}
