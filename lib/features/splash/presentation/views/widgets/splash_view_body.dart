import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_navigator.dart';
import '../../../../../core/utils/assets.dart';
import 'get_started.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: SvgPicture.asset(Assets.logo));
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    AppNavigator.pushReplacement(context, const GetStarted());
  }
}
