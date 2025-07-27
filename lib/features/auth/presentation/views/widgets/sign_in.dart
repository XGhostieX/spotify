import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/core/utils/functions/is_dark_mode.dart';

import '../../../../../core/models/auth/signin_user_req.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/functions/display_message.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/widgets/basic_app_bar.dart';
import '../../../../../core/widgets/basic_button.dart';
import '../../../data/repos/auth_repo.dart';
import 'register.dart';
import 'root.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool hiddenPassword;

  @override
  void initState() {
    super.initState();
    hiddenPassword = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(Assets.logo, height: 40, width: 40),
      ),
      body: SingleChildScrollView(
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
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
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
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: 'Enter Email',
              ).applyDefaults(Theme.of(context).inputDecorationTheme),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: hiddenPassword,
              decoration: InputDecoration(
                hintText: 'Password',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hiddenPassword = !hiddenPassword;
                    });
                  },
                  icon: Icon(
                    hiddenPassword
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                  ),
                ),
                suffixIconColor: hiddenPassword
                    ? context.isDarkMode
                          ? const Color(0xFF5B5B5B)
                          : const Color(0xFF8D8D8D)
                    : AppColors.primary,
              ).applyDefaults(Theme.of(context).inputDecorationTheme),
            ),

            const SizedBox(height: 30),
            BasicButton(
              title: 'Sign In',
              onPressed: () async {
                if (_emailController.text.isEmpty) {
                  displayMessage('Please Enter Your Email', true);
                } else if (_passwordController.text.isEmpty) {
                  displayMessage('Please Enter Your Password', true);
                } else {
                  var result = await getIt<AuthRepo>().signin(
                    SigninUserReq(
                      _emailController.text,
                      _passwordController.text,
                    ),
                  );
                  result.fold((left) => displayMessage(left, true), (r) {
                    displayMessage('Sign In Was Successfull', false);
                    AppNavigator.pushAndRemove(context, const Root());
                  });
                }
              },
            ),
          ],
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
                  AppNavigator.pushReplacement(context, const Register()),
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
