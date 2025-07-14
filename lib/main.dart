import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const Spotify());
}

class Spotify extends StatelessWidget {
  const Spotify({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify',
      theme: AppTheme.lightTheme,
      home: const SplashView(),
    );
  }
}
