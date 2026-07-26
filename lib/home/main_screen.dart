import 'package:evently/home/taps/favorite/favorite.dart';
import 'package:evently/home/taps/home/home_screen.dart';
import 'package:evently/home/taps/profile/profile_tab.dart';
import 'package:evently/l10n/app_localizations.dart';

import 'package:evently/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  List<Widget> tabsList = [HomeScreen(), Favorite(), ProfileTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,

        onTap: (index) {
          selectedIndex = index;

          setState(() {});
        },

        items: [
          buildItemBottom(
            selectedIcon: SvgPicture.asset('assets/homeselected.svg'),
            unSelectedIcon: SvgPicture.asset(AppAssets.iconHome),
            label: AppLocalizations.of(context)!.home,
            isSelected: selectedIndex == 0,
          ),
          buildItemBottom(
            selectedIcon: SvgPicture.asset('assets/heartselected.svg'),
            unSelectedIcon: SvgPicture.asset(AppAssets.iconHeartNavigationBar),
            label: AppLocalizations.of(context)!.favorite,
            isSelected: selectedIndex == 1,
          ),
          buildItemBottom(
            selectedIcon: SvgPicture.asset('assets/userselected.svg'),
            unSelectedIcon: SvgPicture.asset(AppAssets.iconProfile),
            label: AppLocalizations.of(context)!.profile,
            isSelected: selectedIndex == 2,
          ),
        ],
      ),
      body: tabsList[selectedIndex],
    );
  }

  BottomNavigationBarItem buildItemBottom({
    required Widget selectedIcon,
    required Widget unSelectedIcon,
    required String label,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: isSelected ? selectedIcon : unSelectedIcon,
      label: label,
    );
  }
}
