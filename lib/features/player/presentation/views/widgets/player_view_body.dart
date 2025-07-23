import 'package:flutter/material.dart';

import '../../../../../core/models/song.dart';
import 'cover.dart';
import 'details.dart';
import 'player.dart';

class PlayerViewBody extends StatelessWidget {
  final Song song;
  const PlayerViewBody({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Cover(cover: song.cover!),
          const SizedBox(height: 20),
          Details(song: song),
          const SizedBox(height: 40),
          Player(song: song),
        ],
      ),
    );
  }
}
