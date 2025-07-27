import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/song.dart';
import '../../../../core/widgets/basic_app_bar.dart';
import '../../../../core/widgets/theme_btn.dart';
import '../views_model/audio_player_cubit/audio_player_cubit.dart';
import 'widgets/player_view_body.dart';

class PlayerView extends StatelessWidget {
  final List<Song> songs;
  final int index;
  const PlayerView({super.key, required this.songs, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AudioPlayerCubit()..load(songs[index].song!),
      child: Scaffold(
        appBar: const BasicAppBar(
          title: Text(
            'Now Playing',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          action: ThemeBtn(),
        ),
        body: PlayerViewBody(songs: songs, index: index),
      ),
    );
  }
}
