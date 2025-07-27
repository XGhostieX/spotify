import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/utils/functions/is_dark_mode.dart';
import 'package:spotify/core/widgets/basic_app_bar.dart';

import '../../../../core/widgets/theme_btn.dart';
import '../views_model/favorites_cubit/favorites_cubit.dart';
import '../views_model/profile_cubit/profile_cubit.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProfileCubit()..fetchUser()),
        BlocProvider(
          create: (context) => FavoritesCubit()..fetchFavoriteSongs(),
        ),
      ],
      child: Scaffold(
        appBar: BasicAppBar(
          title: const Text(
            'Profile',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          backgroundColor: context.isDarkMode
              ? const Color(0xFF2C2B2B)
              : Colors.white,
          hideBack: true,
          padding: 0,
          action: const ThemeBtn(),
        ),
        body: const ProfileViewBody(),
      ),
    );
  }
}
