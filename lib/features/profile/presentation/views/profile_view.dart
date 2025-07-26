import 'package:flutter/material.dart';
import 'package:spotify/core/widgets/basic_app_bar.dart';

import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: BasicAppBar(), body: ProfileViewBody());
  }
}
