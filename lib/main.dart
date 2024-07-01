import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:zoner/screens/doctor/sessions/doctor_session_details_screen.dart';

import 'core/core.dart';
import 'core/routes.dart';

void main() {
  runApp(const MyApp());
}

final AppRouter appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController(),
      child: MaterialApp(
        title: 'Zoner',
        debugShowCheckedModeBanner: false,
        theme: ZonerThemeData.lightTheme,
        darkTheme: ZonerThemeData.darkTheme,
        themeMode: ThemeMode.system,
        themeAnimationStyle: AnimationStyle(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 300),
        ),
        // routerConfig: appRouter.router,
        home: const DoctorSessionDetailsScreen(),
      ),
    );
  }
}
