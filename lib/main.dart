import 'package:flutter/material.dart';
import 'package:zoner/core/core.dart';
import 'package:zoner/core/routes.dart';

void main() {
  runApp(const MyApp());
}

final AppRouter appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Zoner',
      debugShowCheckedModeBanner: false,
      theme: ZonerThemeData.lightTheme,
      darkTheme: ZonerThemeData.darkTheme,
      themeMode: ThemeMode.system,
      themeAnimationStyle: AnimationStyle(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 300),
      ),
      routerConfig: appRouter.router,
      //home: const DocumentsSubmittedScreen(),
    );
  }
}
