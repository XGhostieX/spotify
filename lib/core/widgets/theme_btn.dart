import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/utils/functions/is_dark_mode.dart';

import '../../features/splash/presentation/views_model/theme_cubit/theme_cubit.dart';

class ThemeBtn extends StatelessWidget {
  const ThemeBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.isDarkMode
          ? context.read<ThemeCubit>().updateTheme(ThemeMode.light)
          : context.read<ThemeCubit>().updateTheme(ThemeMode.dark),
      icon: Icon(
        Icons.more_vert_rounded,
        color: context.isDarkMode
            ? const Color(0xFFCFCFCF)
            : const Color(0xFF7D7D7D),
      ),
    );
  }
}
