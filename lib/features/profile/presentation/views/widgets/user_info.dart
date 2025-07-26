import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/utils/functions/is_dark_mode.dart';

import '../../../../../core/utils/assets.dart';
import '../../views_model/profile_cubit/profile_cubit.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const Center(child: CircularProgressIndicator());
          // return const ShimmerSkeleton();
        } else if (state is ProfileSuccess) {
          return Column(
            children: [
              Image.asset(Assets.profileImage),
              const SizedBox(height: 10),
              Text(
                state.user.email!,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: context.isDarkMode
                      ? const Color(0xFFD8D4D4)
                      : const Color(0xFF222222),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                state.user.name!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: context.isDarkMode
                      ? Colors.white
                      : const Color(0xFF222222),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        '778',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: context.isDarkMode
                              ? Colors.white
                              : const Color(0xFF222222),
                        ),
                      ),
                      Text(
                        'Followers',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: context.isDarkMode
                              ? const Color(0xFFA1A1A1)
                              : const Color(0xFF585858),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '248',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: context.isDarkMode
                              ? Colors.white
                              : const Color(0xFF222222),
                        ),
                      ),
                      Text(
                        'Following',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: context.isDarkMode
                              ? const Color(0xFFA1A1A1)
                              : const Color(0xFF585858),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        } else if (state is ProfileFailure) {
          return Center(child: Text(state.errMsg));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
