import 'package:film_negar/feature/home/presentation/screens/home_screen.dart';
import 'package:film_negar/feature/my_movies/presentation/screens/my_movies_screen.dart';
import 'package:film_negar/feature/search/presentation/screens/search_screen.dart';
import 'package:flutter/material.dart';
import "package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart";

import 'core/colors.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({super.key});

  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [HomeScreen(), SearchPage(), SavedMoviesPage()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: 'خانه',
        activeColorPrimary: AppColors.secondaryColor,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        title: 'جستجو',
        activeColorPrimary: AppColors.secondaryColor,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.bookmark_border),
        title: 'فیلم نگار من',
        activeColorPrimary: AppColors.secondaryColor,
        inactiveColorPrimary: Colors.white,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      onItemSelected: (index) {},
      navBarHeight: 65,
      padding: const EdgeInsets.only(top: 15, bottom: 4),
      backgroundColor: AppColors.backgroundColor,
      navBarStyle: NavBarStyle.style11,
      hideNavigationBarWhenKeyboardAppears: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(0),
        colorBehindNavBar: AppColors.backgroundColor,
      ),
    );
  }
}
