import 'package:flutter/material.dart';

import '../../../../core/models/song.dart';
import '../../../../core/widgets/basic_app_bar.dart';
import '../../../../core/widgets/theme_btn.dart';
import 'widgets/player_view_body.dart';

class PlayerView extends StatelessWidget {
  final Song song;
  const PlayerView({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(
        title: Text(
          'Now Playing',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        action: ThemeBtn(),
      ),
      body: PlayerViewBody(song: song),
    );
  }
}
