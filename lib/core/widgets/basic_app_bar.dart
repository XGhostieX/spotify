import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../utils/functions/is_dark_mode.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? action;
  final bool hideBack;
  final Color backgroundColor;
  final double padding;
  const BasicAppBar({
    super.key,
    this.title,
    this.hideBack = false,
    this.action,
    this.backgroundColor = Colors.transparent,
    this.padding = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        leading: hideBack
            ? null
            : IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.isDarkMode
                        ? Colors.white.withValues(alpha: 0.03)
                        : Colors.black.withValues(alpha: 0.04),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 15,
                    color: context.isDarkMode
                        ? AppColors.lightBackground
                        : AppColors.darkBackground,
                  ),
                ),
              ),
        title: title ?? const Text(''),
        centerTitle: true,
        actions: [action ?? const SizedBox()],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
