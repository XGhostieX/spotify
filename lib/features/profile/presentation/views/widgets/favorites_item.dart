import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/models/song.dart';
import '../../../../../core/widgets/favorite_btn.dart';

class FavoritesItem extends StatelessWidget {
  final Song song;
  const FavoritesItem({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: song.cover!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
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
                const SizedBox(height: 5),
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
