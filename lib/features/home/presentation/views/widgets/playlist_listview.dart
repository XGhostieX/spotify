import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../views_model/songs_cubit/songs_cubit.dart';
import 'playlist_item.dart';

class PlaylistListview extends StatelessWidget {
  const PlaylistListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongsCubit, SongsState>(
      builder: (context, state) {
        if (state is SongsLoading) {
          return const Center(child: CircularProgressIndicator());
          // return const ShimmerSkeleton();
        } else if (state is SongsSuccess) {
          return SizedBox(
            height: 175,
            child: ListView.separated(
              itemCount: state.songs.length,
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemBuilder: (context, index) =>
                  PlaylistItem(song: state.songs[index]),
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
