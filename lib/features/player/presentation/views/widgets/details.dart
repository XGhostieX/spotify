import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/core/utils/functions/is_dark_mode.dart';

import '../../../../../core/models/song.dart';
import '../../../../../core/utils/assets.dart';

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
        SvgPicture.asset(
          Assets.heart,
          colorFilter: context.isDarkMode
              ? const ColorFilter.mode(Color(0xFF565656), BlendMode.srcIn)
              : const ColorFilter.mode(Color(0xFFB4B4B4), BlendMode.srcIn),
        ),
      ],
    );
  }
}
