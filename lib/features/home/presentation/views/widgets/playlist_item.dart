import 'package:flutter/material.dart';

import '../../../../../core/models/song.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/favorite_btn.dart';
import '../../../../../core/widgets/play_btn.dart';

class PlaylistItem extends StatelessWidget {
  final Song song;
  const PlaylistItem({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const PlayBtn(size: 40, icon: Assets.playLg),
            const SizedBox(width: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  song.title!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  song.artist!.split(',')[0],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(song.duration!.toStringAsFixed(2).replaceAll('.', ':')),
            const SizedBox(width: 30),
            FavoriteBtn(song: song),
          ],
        ),
      ],
    );
  }
}
