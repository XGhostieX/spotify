import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/models/auth/create_user_req.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/functions/display_message.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/widgets/basic_app_bar.dart';
import '../../../../../core/widgets/basic_button.dart';
import '../../../../home/presentation/views/home_view.dart';
import '../../../data/repos/auth_repo.dart';
import 'sign_in.dart';

class Register extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Register({super.key});

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
              'Register',
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
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: 'Full Name',
              ).applyDefaults(Theme.of(context).inputDecorationTheme),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: 'Enter Email',
              ).applyDefaults(Theme.of(context).inputDecorationTheme),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                hintText: 'Password',
              ).applyDefaults(Theme.of(context).inputDecorationTheme),
            ),
            const SizedBox(height: 25),
            BasicButton(
              title: 'Create Account',
              onPressed: () async {
                if (_nameController.text.isEmpty) {
                  displayMessage('Please Enter Your Name', true);
                } else if (_emailController.text.isEmpty) {
                  displayMessage('Please Enter Your Email', true);
                } else if (_passwordController.text.isEmpty) {
                  displayMessage('Please Enter Your Password', true);
                } else {
                  var result = await getIt<AuthRepo>().register(
                    CreateUserReq(
                      _nameController.text,
                      _emailController.text,
                      _passwordController.text,
                    ),
                  );
                  result.fold((left) => displayMessage(left, true), (r) {
                    displayMessage('Register Was Successfull', false);
                    AppNavigator.pushAndRemove(context, const HomeView());
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
            const Text('Do You Have an Account?'),
            TextButton(
              onPressed: () => AppNavigator.pushReplacement(context, SignIn()),
              child: const Text(
                'Sign In',
                style: TextStyle(color: Color(0xFF288CE9)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
