import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/core/utils/functions/is_dark_mode.dart';

class PlayBtn extends StatelessWidget {
  final double size;
  final String icon;
  const PlayBtn({super.key, required this.size, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.isDarkMode
            ? const Color(0xFF2C2C2C)
            : const Color(0xFFE6E6E6),
      ),
      child: SvgPicture.asset(
        icon,
        fit: BoxFit.none,
        colorFilter: context.isDarkMode
            ? const ColorFilter.mode(Color(0xFF959595), BlendMode.srcIn)
            : const ColorFilter.mode(Color(0xFF555555), BlendMode.srcIn),
      ),
    );
  }
}
