import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/core/utils/functions/is_dark_mode.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/theme_btn.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            Assets.search,
            colorFilter: context.isDarkMode
                ? const ColorFilter.mode(Color(0xFFCFCFCF), BlendMode.srcIn)
                : const ColorFilter.mode(Color(0xFF2D264B), BlendMode.srcIn),
          ),
        ),
        title: SvgPicture.asset(Assets.logo, height: 40, width: 40),
        centerTitle: true,
        actions: [const ThemeBtn()],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
