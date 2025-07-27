import 'package:flutter/material.dart';

import '../../../../../core/models/song.dart';
import 'cover.dart';
import 'details.dart';
import 'player.dart';

class PlayerViewBody extends StatelessWidget {
  final List<Song> songs;
  final int index;
  const PlayerViewBody({super.key, required this.songs, required this.index});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Cover(cover: songs[index].cover!),
          const SizedBox(height: 20),
          Details(song: songs[index]),
          const SizedBox(height: 40),
          Player(songs: songs, index: index),
        ],
      ),
    );
  }
}
