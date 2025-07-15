import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/basic_button.dart';
import 'mode_box.dart';

class ChooseMode extends StatelessWidget {
  const ChooseMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          left: 40,
          right: 40,
          bottom: 50,
          top: 40,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.chooseMode),
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
              'Choose Mode',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.lightBackground,
              ),
            ),
            const SizedBox(height: 40),
            const ModeBox(),
            const SizedBox(height: 50),
            BasicButton(
              title: 'Continue',
              onPressed: () =>
                  AppNavigator.pushReplacement(context, const ChooseMode()),
            ),
          ],
        ),
      ),
    );
  }
}
