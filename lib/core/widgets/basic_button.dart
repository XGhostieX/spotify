import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class BasicButton extends StatelessWidget {
  final String title;
  final double? height;
  final VoidCallback onPressed;
  const BasicButton({
    required this.title,
    this.height,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 80),
        foregroundColor: AppColors.lightBackground,
      ),
      child: Text(title),
    );
  }
}
