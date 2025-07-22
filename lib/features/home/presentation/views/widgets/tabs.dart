import 'package:flutter/material.dart';
import 'package:spotify/core/utils/functions/is_dark_mode.dart';

import '../../../../../core/theme/app_colors.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      dividerHeight: 0,
      indicatorColor: AppColors.primary,
      padding: const EdgeInsets.only(right: 10, left: 10, bottom: 20),
      indicatorPadding: const EdgeInsets.symmetric(horizontal: 7),
      splashFactory: NoSplash.splashFactory,
      labelColor: context.isDarkMode ? const Color(0xFFDBDBDB) : Colors.black,
      unselectedLabelColor: context.isDarkMode
          ? const Color(0xFF616161)
          : const Color(0xFFBEBEBE),
      labelStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
      // isScrollable: true,
      tabs: const [
        Text('News'),
        Text('Video'),
        Text('Artists'),
        Text('Podcast'),
      ],
    );
  }
}
