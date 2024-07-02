import 'dart:io';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoner/screens/doctor/profile/doctor_profile_screen.dart';

import '../../shared/home/home_screen.dart';
import '../sessions/doctor_sessions_screen.dart';

class DoctorBottomNavBar extends ConsumerStatefulWidget {
  static const String id = "doctor_nav_bar";
  const DoctorBottomNavBar({super.key});

  @override
  ConsumerState<DoctorBottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends ConsumerState<DoctorBottomNavBar> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  final List<Widget> pages = [
    const HomeScreen(
      isDoctor: true,
      key: PageStorageKey(HomeScreen.doctorId),
    ),
    const DoctorSessionsScreen(
      key: PageStorageKey(DoctorSessionsScreen.id),
    ),
    const DoctorProfileScreen(
      key: PageStorageKey(DoctorProfileScreen.id),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  Widget _bottomNavBar({required int selectedIndex}) {
    return NavigationBar(
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
              colorFilter: ColorFilter.mode(
                  Theme.of(context).iconTheme.color!, BlendMode.srcIn),
            ),
            selectedIcon: SvgPicture.asset(
              "assets/svg/home-alt-filled.svg",
              colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.primary, BlendMode.srcIn),
            )),
        NavigationDestination(
          label: "Sessions",
          icon: Icon(FluentIcons.clock_24_regular,
              color: Theme.of(context).iconTheme.color!),
          selectedIcon: Icon(FluentIcons.clock_24_filled,
              color: Theme.of(context).colorScheme.primary),
        ),
        NavigationDestination(
          label: "Profile",
          icon: Icon(FluentIcons.person_24_regular,
              color: Theme.of(context).iconTheme.color!),
          selectedIcon: Icon(FluentIcons.person_24_filled,
              color: Theme.of(context).colorScheme.primary),
        ),

        ///Todo Add a Profile Screen
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      bottomNavigationBar: _bottomNavBar(
        selectedIndex: _selectedIndex,
      ),
      body: PageStorage(
        bucket: bucket,
        child: pages[_selectedIndex],
      ),
    );
  }
}
