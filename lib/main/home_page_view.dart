import 'package:consultation_project/common/local/local_repo.dart';
import 'package:consultation_project/features/category_details/screens/consultation_details_tab_bar_view.dart';
import 'package:consultation_project/locator.dart';
import 'package:consultation_project/main/home/provider/consultation_cat_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:consultation_project/main/favorites/favorites_screen.dart';
import 'package:consultation_project/main/home/screens/home_screen.dart';
import 'package:consultation_project/main/settings/screens/settings_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePageView extends StatefulWidget {
  static const routeName = '/home-page-view';
  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  var bottoNavBarTextStyle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  void animateToPage(int pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 200),
      curve: Curves.bounceIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    var bottoNavBarTextStyle = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
    );
    var purple = Theme.of(context).colorScheme.primary;
    var indigo = Theme.of(context).colorScheme.secondary;

    print(locator.get<LocalRepo>().token);

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          child: GNav(
            selectedIndex: _currentIndex,
            tabs: [
              GButton(
                icon: Icons.home_max_rounded,
                iconSize: 23.sp,
                iconColor: purple,
                iconActiveColor: purple,
                text: AppLocalizations.of(context)!.home,
                textStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: purple,
                ),
                rippleColor: purple.withOpacity(0.7),
                backgroundColor: purple.withOpacity(0.6),
                borderRadius: BorderRadius.circular(30),
                gap: 4.w,
                onPressed: () {
                  animateToPage(0);
                },
              ),
              GButton(
                icon: Icons.favorite,
                iconSize: 23.sp,
                iconColor: Colors.red,
                iconActiveColor: Colors.red,
                text: AppLocalizations.of(context)!.favorites,
                textStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
                rippleColor: Colors.red.withOpacity(0.7),
                backgroundColor: Colors.red.withOpacity(0.3),
                borderRadius: BorderRadius.circular(30),
                gap: 4.w,
                onPressed: () {
                  animateToPage(1);
                },
              ),
              GButton(
                icon: Icons.settings,
                iconSize: 23.sp,
                iconColor: indigo,
                iconActiveColor: indigo,
                text: AppLocalizations.of(context)!.settings,
                textStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: indigo,
                ),
                rippleColor: indigo.withOpacity(0.7),
                backgroundColor: indigo.withOpacity(0.6),
                borderRadius: BorderRadius.circular(30),
                gap: 4.w,
                onPressed: () {
                  animateToPage(2);
                },
              ),
            ],
          ),
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (value) {
            _currentIndex = value;
            setState(() {});
          },
          children: [
            HomeScreen(controller: _pageController),
            FavoritesScreen(),
            SettingsScreen(),
          ],
        ),
      ),
    );
  }
}
