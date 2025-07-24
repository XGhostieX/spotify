import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/core/utils/functions/display_message.dart';
import 'package:spotify/core/utils/functions/is_dark_mode.dart';

import '../../features/home/presentation/views_model/favorite_cubit/favorite_cubit.dart';
import '../models/song.dart';
import '../utils/assets.dart';

class FavoriteBtn extends StatelessWidget {
  final Song song;
  const FavoriteBtn({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit(),
      child: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteInitial) {
            return IconButton(
              onPressed: () => context.read<FavoriteCubit>().favorite(song.id!),
              icon: SvgPicture.asset(
                song.isFavorite! ? Assets.heartFilled : Assets.heart,
                width: 25,
                height: 25,
                colorFilter: context.isDarkMode
                    ? const ColorFilter.mode(Color(0xFF565656), BlendMode.srcIn)
                    : const ColorFilter.mode(
                        Color(0xFFB4B4B4),
                        BlendMode.srcIn,
                      ),
              ),
            );
          } else if (state is FavoriteSuccess) {
            return IconButton(
              onPressed: () => context.read<FavoriteCubit>().favorite(song.id!),
              icon: SvgPicture.asset(
                state.isFavorite ? Assets.heartFilled : Assets.heart,
                width: 25,
                height: 25,
                colorFilter: context.isDarkMode
                    ? const ColorFilter.mode(Color(0xFF565656), BlendMode.srcIn)
                    : const ColorFilter.mode(
                        Color(0xFFB4B4B4),
                        BlendMode.srcIn,
                      ),
              ),
            );
          } else if (state is FavoriteFailure) {
            displayMessage(state.errMsg, true);
            return IconButton(
              onPressed: () => context.read<FavoriteCubit>().favorite(song.id!),
              icon: SvgPicture.asset(
                song.isFavorite! ? Assets.heartFilled : Assets.heart,
                width: 25,
                height: 25,
                colorFilter: context.isDarkMode
                    ? const ColorFilter.mode(Color(0xFF565656), BlendMode.srcIn)
                    : const ColorFilter.mode(
                        Color(0xFFB4B4B4),
                        BlendMode.srcIn,
                      ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
