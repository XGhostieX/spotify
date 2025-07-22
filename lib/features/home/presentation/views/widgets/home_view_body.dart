import 'package:flutter/material.dart';

import 'home_frame.dart';
import 'songs_listview.dart';
import 'tabs.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [HomeFrame(), Tabs(), SongsListview()],
      ),
    );
  }
}
