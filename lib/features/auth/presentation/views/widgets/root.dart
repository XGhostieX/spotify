import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:spotify/core/utils/functions/is_dark_mode.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../home/presentation/views/home_view.dart';
import '../../../../profile/presentation/views/profile_view.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller = PersistentTabController(
      initialIndex: 0,
    );
    return PersistentTabView(
      context,
      controller: controller,
      screens: [const HomeView(), const ProfileView()],
      items: [
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(Assets.homeActive),
          inactiveIcon: SvgPicture.asset(Assets.home),
          // title: ("Home"),
          activeColorPrimary: AppColors.primary,
          activeColorSecondary: AppColors.primary,
          inactiveColorPrimary: context.isDarkMode
              ? const Color(0xFF737373)
              : const Color(0xFF808080),
        ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(Assets.profileActive),
          inactiveIcon: SvgPicture.asset(Assets.profile),
          // title: ("Profile"),
          activeColorPrimary: AppColors.primary,
          inactiveColorPrimary: context.isDarkMode
              ? const Color(0xFF737373)
              : const Color(0xFF808080),
        ),
      ],
      popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
      // padding: const EdgeInsets.only(top: 8),
      backgroundColor: context.isDarkMode
          ? const Color(0xFF343434)
          : Colors.white,
      isVisible: true,

      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight,
      navBarStyle: NavBarStyle.style3,
    );
  }
}
