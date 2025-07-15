import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/core/theme/app_colors.dart';

import '../../../../../core/utils/assets.dart';

class ModeBox extends StatelessWidget {
  const ModeBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            ClipOval(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  height: 73,
                  width: 73,
                  decoration: BoxDecoration(
                    color: const Color(0xFF30393C).withValues(alpha: 0.5),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(Assets.moon, fit: BoxFit.none),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Dark Mode',
              style: TextStyle(
                color: AppColors.lightBackground,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
        Column(
          children: [
            ClipOval(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  height: 73,
                  width: 73,
                  decoration: BoxDecoration(
                    color: const Color(0xFF30393C).withValues(alpha: 0.5),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(Assets.sun, fit: BoxFit.none),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Light Mode',
              style: TextStyle(
                color: AppColors.lightBackground,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
