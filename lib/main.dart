import 'package:flutter/material.dart';
import 'package:zoner/core/core.dart';
import 'screens/patient/home/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Zoner',
        debugShowCheckedModeBanner: false,
        theme: ZonerThemeData.lightTheme,
        darkTheme: ZonerThemeData.darkTheme,
        themeMode: ThemeMode.system,
        home: const HomeScreen());
  }
}



