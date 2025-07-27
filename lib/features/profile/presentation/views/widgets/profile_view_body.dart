import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/utils/functions/is_dark_mode.dart';

import '../../views_model/favorites_cubit/favorites_cubit.dart';
import 'favorites_listview.dart';
import 'user_info.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<FavoritesCubit>().fetchFavoriteSongs(),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Favorite Songs'.toUpperCase(),
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: context.isDarkMode
                      ? const Color(0xFFD6D6D6)
                      : const Color(0xFF222222),
                ),
              ),
            ),
            const FavoritesListview(),
          ],
        ),
      ),
    );
  }
}
