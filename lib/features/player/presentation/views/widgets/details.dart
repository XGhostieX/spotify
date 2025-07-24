import 'package:flutter/material.dart';

import '../../../../../core/models/song.dart';
import '../../../../../core/widgets/favorite_btn.dart';

class Details extends StatelessWidget {
  final Song song;
  const Details({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              song.title!,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 3),
            Text(
              song.artist!,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        FavoriteBtn(song: song),
      ],
    );
  }
}
