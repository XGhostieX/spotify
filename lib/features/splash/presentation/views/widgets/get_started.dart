import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/basic_button.dart';
import 'choose_mode.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.getStarted),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(Assets.logo),
            ),
            const Spacer(),
            const Text(
              'Enjoy Listening to Music',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.lightBackground,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'a digital music and podcast service that provides access to millions of songs and other content. It offers both free, ad-supported listening and premium, offline downloads.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: AppColors.grey,
              ),
            ),
            const SizedBox(height: 20),
            BasicButton(
              title: 'Get Started',
              onPressed: () =>
                  AppNavigator.pushReplacement(context, const ChooseMode()),
            ),
          ],
        ),
      ),
    );
  }
}
