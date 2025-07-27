import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/utils/functions/is_dark_mode.dart';

import '../../../../../core/models/song.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../core/utils/assets.dart';
import '../../views_model/audio_player_cubit/audio_player_cubit.dart';
import '../player_view.dart';

class Player extends StatelessWidget {
  final List<Song> songs;
  final int index;
  const Player({super.key, required this.songs, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioPlayerCubit, AudioPlayerState>(
      builder: (context, state) {
        if (state is AudioPlayerLoading) {
          return const Center(child: CircularProgressIndicator());
          // return const ShimmerSkeleton();
        } else if (state is AudioPlayerSuccess) {
          return Column(
            children: [
              Slider(
                value: context
                    .read<AudioPlayerCubit>()
                    .position
                    .inSeconds
                    .toDouble(),
                min: 0.0,
                max: context
                    .read<AudioPlayerCubit>()
                    .duration
                    .inSeconds
                    .toDouble(),
                activeColor: context.isDarkMode
                    ? const Color(0xFFB7B7B7)
                    : const Color(0xFF434343),
                thumbColor: context.isDarkMode
                    ? const Color(0xFFB7B7B7)
                    : const Color(0xFF5C5C5C),
                inactiveColor: context.isDarkMode
                    ? const Color(0xFF888888).withValues(alpha: 0.3)
                    : const Color(0xFF000000).withValues(alpha: 0.3),
                padding: EdgeInsets.zero,
                onChanged: (value) {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    format(context.read<AudioPlayerCubit>().position),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: context.isDarkMode
                          ? const Color(0xFF878787)
                          : const Color(0xFF404040),
                    ),
                  ),
                  Text(
                    format(context.read<AudioPlayerCubit>().duration),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: context.isDarkMode
                          ? const Color(0xFF878787)
                          : const Color(0xFF404040),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(Assets.repeats),
                  ),
                  IconButton(
                    onPressed: () {
                      if (index == 0) {
                        AppNavigator.pushReplacement(
                          context,
                          PlayerView(songs: songs, index: songs.length - 1),
                        );
                      } else {
                        AppNavigator.pushReplacement(
                          context,
                          PlayerView(songs: songs, index: index - 1),
                        );
                      }
                    },
                    icon: SvgPicture.asset(
                      Assets.previous,
                      colorFilter: context.isDarkMode
                          ? const ColorFilter.mode(
                              Color(0xFFA7A7A7),
                              BlendMode.srcIn,
                            )
                          : const ColorFilter.mode(
                              Color(0xFF363636),
                              BlendMode.srcIn,
                            ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => context.read<AudioPlayerCubit>().check(),
                    icon: Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary,
                      ),
                      child: Icon(
                        context.read<AudioPlayerCubit>().audioPlayer.playing
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (index == songs.length - 1) {
                        AppNavigator.pushReplacement(
                          context,
                          PlayerView(songs: songs, index: 0),
                        );
                      } else {
                        AppNavigator.pushReplacement(
                          context,
                          PlayerView(songs: songs, index: index + 1),
                        );
                      }
                    },
                    icon: SvgPicture.asset(
                      Assets.next,
                      colorFilter: context.isDarkMode
                          ? const ColorFilter.mode(
                              Color(0xFFA7A7A7),
                              BlendMode.srcIn,
                            )
                          : const ColorFilter.mode(
                              Color(0xFF363636),
                              BlendMode.srcIn,
                            ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(Assets.shuffle),
                  ),
                ],
              ),
            ],
          );
        } else if (state is AudioPlayerFailure) {
          return Center(child: Text(state.errMsg));
        } else {
          return const SizedBox();
        }
      },
    );
  }

  String format(Duration duration) {
    final min = duration.inMinutes.remainder(60);
    final sec = duration.inSeconds.remainder(60);
    return '${min.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}';
  }
}
