import 'package:flutter/material.dart';
import 'package:spotify/core/utils/functions/is_dark_mode.dart';

import 'user_info.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
              color: context.isDarkMode
                  ? const Color(0xFF2C2B2B)
                  : Colors.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: const UserInfo(),
          ),
        ],
      ),
    );
  }
}
