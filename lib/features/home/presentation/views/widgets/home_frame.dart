import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/assets.dart';

class HomeFrame extends StatelessWidget {
  const HomeFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // height: 190,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Align(
            //   alignment: Alignment.center,
            //   child: SvgPicture.asset(Assets.frame),
            // ),
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: Image.asset(Assets.frameImage),
            // ),
            SvgPicture.asset(Assets.frame),
            Positioned(
              // top: -67.8,
              top: -95,
              left: 20,
              child: Image.asset(Assets.frameImage, width: 270, height: 270),
            ),
          ],
        ),
      ),
    );
  }
}
