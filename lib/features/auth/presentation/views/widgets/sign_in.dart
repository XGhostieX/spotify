import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/basic_app_bar.dart';
import '../../../../../core/widgets/basic_button.dart';
import 'register.dart';

class SignIn extends StatelessWidget {
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();

  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(Assets.logo, height: 40, width: 40),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Sign In',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(height: 15),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'If You Need Any Support ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: 'Click Here',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Enter Username or Email',
                ).applyDefaults(Theme.of(context).inputDecorationTheme),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Password',
                ).applyDefaults(Theme.of(context).inputDecorationTheme),
              ),

              const SizedBox(height: 30),
              BasicButton(title: 'Sign In', onPressed: () {}),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Not a Member ?'),
            TextButton(
              onPressed: () =>
                  AppNavigator.pushReplacement(context, Register()),
              child: const Text(
                'Register Now',
                style: TextStyle(color: Color(0xFF288CE9)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
