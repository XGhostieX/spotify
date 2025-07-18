import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/utils/app_navigator.dart';
import 'package:spotify/core/utils/functions/is_dark_mode.dart';
import 'package:spotify/features/auth/presentation/views/widgets/register.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/basic_app_bar.dart';
import '../../../../../core/widgets/basic_button.dart';
import 'sign_in.dart';

class AuthViewBody extends StatelessWidget {
  const AuthViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BasicAppBar(),
        Align(
          alignment: Alignment.topRight,
          child: SvgPicture.asset(Assets.unionTop),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: SvgPicture.asset(Assets.unionBottom),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Image.asset(Assets.authBG),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(right: 40, left: 40, bottom: 150),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.logo),
                const SizedBox(height: 50),
                const Text(
                  'Enjoy Listening to Music',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    // color: AppColors.lightBackground,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Spotify is a proprietary Swedish audio streaming and media services provider.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: context.isDarkMode
                        ? AppColors.grey
                        : const Color(0xFF797979),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: BasicButton(
                        title: 'Register',
                        onPressed: () => AppNavigator.push(context, Register()),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () => AppNavigator.push(context, SignIn()),
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: context.isDarkMode
                                ? AppColors.lightBackground
                                : AppColors.darkBackground,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
