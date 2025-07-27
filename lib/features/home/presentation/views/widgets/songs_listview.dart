import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../player/presentation/views/player_view.dart';
import '../../views_model/songs_cubit/songs_cubit.dart';
import 'song_card.dart';

class SongsListview extends StatelessWidget {
  const SongsListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongsCubit, SongsState>(
      builder: (context, state) {
        if (state is SongsLoading) {
          return const Center(child: CircularProgressIndicator());
          // return const ShimmerSkeleton();
        } else if (state is SongsSuccess) {
          return SizedBox(
            height: 250,
            child: ListView.separated(
              itemCount: state.songs.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: PlayerView(songs: state.songs, index: index),
                  withNavBar: false,
                ),
                child: SongCard(song: state.songs[index]),
              ),
            ),
          );
        } else if (state is SongsFailure) {
          return Center(child: Text(state.errMsg));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
