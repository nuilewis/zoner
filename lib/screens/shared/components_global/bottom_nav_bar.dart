import 'dart:io';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoner/screens/patient/discover/discover_screen.dart';
import 'package:zoner/screens/patient/sessions/sessions_screen.dart';

import '../../../core/constants.dart';
import '../home/home_screen.dart';

class BottomNavBar extends ConsumerStatefulWidget {
  static const String id = "nav_bar";
  const BottomNavBar({super.key});

  @override
  ConsumerState<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends ConsumerState<BottomNavBar> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  final List<Widget> pages = [
    const HomeScreen(
      key: PageStorageKey(HomeScreen.id),
    ),
    const SessionsScreen(
      key: PageStorageKey(SessionsScreen.id),
    ),
    const DiscoverScreen(
      key: PageStorageKey(DiscoverScreen.id),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  Widget _bottomNavBar(
      {required int selectedIndex, required Color selectedItemColor}) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        NavigationBar(
          indicatorColor: Platform.isIOS
              ? Theme.of(context).scaffoldBackgroundColor.withOpacity(0)
              : Theme.of(context).colorScheme.primaryContainer,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          elevation: 0,
          selectedIndex: selectedIndex,
          destinations: [
            NavigationDestination(
                label: "Home",
                icon: SvgPicture.asset(
                  "assets/svg/home-alt.svg",
                  colorFilter: const ColorFilter.mode(
                      ZonerColors.black, BlendMode.srcIn),
                ),
                selectedIcon: SvgPicture.asset(
                  "assets/svg/home-alt-filled.svg",
                  colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.primary, BlendMode.srcIn),
                )),
            NavigationDestination(
              label: "Sessions",
              icon: const Icon(FluentIcons.clock_24_regular,
                  color: ZonerColors.black),
              selectedIcon: Icon(FluentIcons.clock_24_filled,
                  color: Theme.of(context).colorScheme.primary),
            ),
            NavigationDestination(
              label: "Discover",
              icon: const Icon(FluentIcons.search_24_regular,
                  color: ZonerColors.black),
              selectedIcon: Icon(FluentIcons.search_24_filled,
                  color: Theme.of(context).colorScheme.primary),
            ),

            ///Todo Add a Profile Screen
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: _bottomNavBar(
          selectedIndex: _selectedIndex,
          selectedItemColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Theme.of(context).primaryColor),
      body: PageStorage(
        bucket: bucket,
        child: pages[_selectedIndex],
      ),
    );
  }
}
