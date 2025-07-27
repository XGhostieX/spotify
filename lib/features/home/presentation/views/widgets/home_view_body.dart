import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/utils/functions/is_dark_mode.dart';

import '../../views_model/songs_cubit/songs_cubit.dart';
import 'home_frame.dart';
import 'playlist_listview.dart';
import 'songs_listview.dart';
import 'tabs.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<SongsCubit>().fetchSongs(),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HomeFrame(),
            const Tabs(),
            const SongsListview(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Playlist',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'See More',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: context.isDarkMode
                          ? const Color(0xFFC6C6C6)
                          : const Color(0xFF131313),
                    ),
                  ),
                ],
              ),
            ),
            const PlaylistListview(),
          ],
        ),
      ),
    );
  }
}
