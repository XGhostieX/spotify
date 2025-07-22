import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../views_model/songs_cubit/songs_cubit.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SongsCubit()..fetchSongs(),
      child: const Scaffold(appBar: HomeAppBar(), body: HomeViewBody()),
    );
  }
}
