import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../player/presentation/views/player_view.dart';
import '../../views_model/favorites_cubit/favorites_cubit.dart';
import 'favorites_item.dart';

class FavoritesListview extends StatelessWidget {
  const FavoritesListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesLoading) {
          return const Center(child: CircularProgressIndicator());
          // return const ShimmerSkeleton();
        } else if (state is FavoritesSuccess) {
          return SizedBox(
            // height: 175,
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.favorites.length,
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: PlayerView(songs: state.favorites, index: index),
                  withNavBar: false,
                ),
                child: FavoritesItem(song: state.favorites[index]),
              ),
            ),
          );
        } else if (state is FavoritesFailure) {
          return Center(child: Text(state.errMsg));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
