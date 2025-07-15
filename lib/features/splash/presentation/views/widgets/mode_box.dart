import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/assets.dart';
import '../../views_model/theme_cubit/theme_cubit.dart';

class ModeBox extends StatelessWidget {
  const ModeBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            InkWell(
              onTap: () =>
                  context.read<ThemeCubit>().updateTheme(ThemeMode.dark),
              child: SizedBox(
                width: 80,
                height: 80,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.primary
                              : Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    ClipOval(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          height: 73,
                          width: 73,
                          decoration: BoxDecoration(
                            color: const Color(
                              0xFF30393C,
                            ).withValues(alpha: 0.5),
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            Assets.moon,
                            fit: BoxFit.none,
                            colorFilter:
                                Theme.of(context).brightness == Brightness.dark
                                ? const ColorFilter.mode(
                                    AppColors.primary,
                                    BlendMode.srcIn,
                                  )
                                : const ColorFilter.mode(
                                    AppColors.lightBackground,
                                    BlendMode.srcIn,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
            InkWell(
              onTap: () =>
                  context.read<ThemeCubit>().updateTheme(ThemeMode.light),
              child: SizedBox(
                width: 80,
                height: 80,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).brightness == Brightness.light
                              ? AppColors.primary
                              : Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    ClipOval(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          height: 73,
                          width: 73,
                          decoration: BoxDecoration(
                            color: const Color(
                              0xFF30393C,
                            ).withValues(alpha: 0.5),
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            Assets.sun,
                            fit: BoxFit.none,
                            colorFilter:
                                Theme.of(context).brightness == Brightness.light
                                ? const ColorFilter.mode(
                                    AppColors.primary,
                                    BlendMode.srcIn,
                                  )
                                : const ColorFilter.mode(
                                    AppColors.lightBackground,
                                    BlendMode.srcIn,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
