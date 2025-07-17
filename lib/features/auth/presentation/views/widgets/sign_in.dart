import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/basic_app_bar.dart';

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
      body: const Column(children: []),
    );
  }
}
