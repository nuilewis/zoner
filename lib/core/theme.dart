import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core.dart';

class ZonerThemeData {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: ZonerColors.purpleSeed,
    primaryColorLight: ZonerColors.purple50,
    primaryColorDark: ZonerColors.purple30,
    scaffoldBackgroundColor: ZonerColors.white,
    iconTheme: const IconThemeData(color: ZonerColors.black),
    primaryIconTheme: const IconThemeData(color: ZonerColors.black),
    expansionTileTheme: ExpansionTileThemeData(
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: ZonerColors.neutral90),
        borderRadius: BorderRadius.circular(kPadding24),
      ),
      collapsedShape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: ZonerColors.neutral90),
        borderRadius: BorderRadius.circular(kPadding16),
      ),
      childrenPadding: const EdgeInsets.only(
          left: kPadding16, right: kPadding16, bottom: kPadding8),
    ),
    cardTheme: CardTheme(
      color: ZonerColors.purple95,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    ),
    fontFamily: 'Plus Jakarta Sans',
    textTheme: TextTheme(
      displayLarge:
          ZonerTextStyles.displayLarge.copyWith(color: ZonerColors.black),
      displayMedium:
          ZonerTextStyles.displayMedium.copyWith(color: ZonerColors.black),
      displaySmall:
          ZonerTextStyles.displaySmall.copyWith(color: ZonerColors.black),

      ///
      headlineLarge:
          ZonerTextStyles.headlineLarge.copyWith(color: ZonerColors.black),
      headlineSmall:
          ZonerTextStyles.headlineSmall.copyWith(color: ZonerColors.black),
      headlineMedium:
          ZonerTextStyles.headlineMedium.copyWith(color: ZonerColors.black),

      ///
      titleLarge: ZonerTextStyles.titleLarge.copyWith(color: ZonerColors.black),
      titleMedium:
          ZonerTextStyles.titleMedium.copyWith(color: ZonerColors.black),
      titleSmall: ZonerTextStyles.titleSmall.copyWith(color: ZonerColors.black),

      ///
      bodyLarge: ZonerTextStyles.bodyLarge.copyWith(color: ZonerColors.black),
      bodyMedium: ZonerTextStyles.bodyMedium.copyWith(color: ZonerColors.black),
      bodySmall: ZonerTextStyles.bodySmall.copyWith(color: ZonerColors.black),
    ),
    appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0,
        backgroundColor: Colors.transparent),
    cardColor: ZonerColors.purple95,
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          fixedSize: WidgetStatePropertyAll<Size>(Size.fromHeight(52)),
          padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(horizontal: 16)),
          elevation: WidgetStatePropertyAll<double>(0),
          splashFactory: InkSparkle.splashFactory),
    ),
    iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
      splashFactory: InkSparkle.splashFactory,
      elevation: WidgetStatePropertyAll<double>(0),
    )),
    textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
      elevation: WidgetStatePropertyAll<double>(0),
      splashFactory: InkSparkle.splashFactory,
    )),
    chipTheme: ChipThemeData(
      labelStyle:
          ZonerTextStyles.bodyMedium.copyWith(color: ZonerColors.purple10),
      elevation: 0,
      selectedColor: ZonerColors.purple90,
      backgroundColor: ZonerColors.neutral95,
      side: BorderSide.none,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
    ),
    sliderTheme: const SliderThemeData(
        activeTickMarkColor: ZonerColors.purpleSeed,
        inactiveTrackColor: ZonerColors.neutral95,
        trackHeight: 2,
        trackShape: RoundedRectSliderTrackShape(),
        thumbShape: RoundSliderThumbShape(
          elevation: 0,
          enabledThumbRadius: 8,
          disabledThumbRadius: 4,
          pressedElevation: 0,
        ),
        thumbColor: ZonerColors.white,
        overlayColor: Colors.transparent,
        overlayShape: RoundSliderOverlayShape(overlayRadius: 0)),
    switchTheme: SwitchThemeData(
      thumbColor: const WidgetStatePropertyAll<Color>(ZonerColors.white),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return ZonerColors.purple40;
        }
        return ZonerColors.purple90;
      }),
      trackOutlineColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return ZonerColors.purple40;
        }
        return ZonerColors.purple90;
      }),
      trackOutlineWidth: const WidgetStatePropertyAll<double>(0),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: ZonerColors.purpleSeed,
      primary: ZonerColors.purpleSeed,
      onPrimary: ZonerColors.white,
      primaryContainer: ZonerColors.purple90,
      onPrimaryContainer: ZonerColors.purple10,
      secondary: ZonerColors.orangeSeed,
      secondaryContainer: ZonerColors.orange95, //Or maybe do Yellow 90
      onSecondary: Colors.white,
      onSecondaryContainer: ZonerColors.orange20,
      error: ZonerColors.red50,
      onError: ZonerColors.white,
      errorContainer: ZonerColors.red90,
      onErrorContainer: ZonerColors.red10,
    ),
  );

  ///--------Dark Theme-------///
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: ZonerColors.purple70,
    primaryColorLight: ZonerColors.purple90,
    primaryColorDark: ZonerColors.purple70,
    scaffoldBackgroundColor: ZonerColors.black,
    iconTheme: const IconThemeData(color: ZonerColors.white),
    primaryIconTheme: const IconThemeData(color: ZonerColors.white),
    expansionTileTheme: ExpansionTileThemeData(
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: ZonerColors.neutral20),
        borderRadius: BorderRadius.circular(kPadding24),
      ),
      collapsedShape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: ZonerColors.neutral20),
        borderRadius: BorderRadius.circular(kPadding16),
      ),
      childrenPadding: const EdgeInsets.only(
          left: kPadding16, right: kPadding16, bottom: kPadding8),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return ZonerColors.purple10;
        }
        return ZonerColors.neutral70;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return ZonerColors.purple70;
        }
        return ZonerColors.neutral20;
      }),
      trackOutlineColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return ZonerColors.purple70;
        }
        return ZonerColors.neutral20;
      }),
      trackOutlineWidth: const WidgetStatePropertyAll<double>(0),
    ),
    cardTheme: CardTheme(
      color: ZonerColors.neutral20,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    ),
    fontFamily: 'Plus Jakarta Sans',
    textTheme: TextTheme(
      displayLarge:
          ZonerTextStyles.displayLarge.copyWith(color: ZonerColors.white),
      displayMedium:
          ZonerTextStyles.displayMedium.copyWith(color: ZonerColors.white),
      displaySmall:
          ZonerTextStyles.displaySmall.copyWith(color: ZonerColors.white),

      ///
      headlineLarge:
          ZonerTextStyles.headlineLarge.copyWith(color: ZonerColors.white),
      headlineSmall:
          ZonerTextStyles.headlineSmall.copyWith(color: ZonerColors.white),
      headlineMedium:
          ZonerTextStyles.headlineMedium.copyWith(color: ZonerColors.white),

      ///
      titleLarge: ZonerTextStyles.titleLarge.copyWith(color: ZonerColors.white),
      titleMedium:
          ZonerTextStyles.titleMedium.copyWith(color: ZonerColors.white),
      titleSmall: ZonerTextStyles.titleSmall.copyWith(color: ZonerColors.white),

      ///
      bodyLarge: ZonerTextStyles.bodyLarge.copyWith(color: ZonerColors.white),
      bodyMedium: ZonerTextStyles.bodyMedium.copyWith(color: ZonerColors.white),
      bodySmall: ZonerTextStyles.bodySmall.copyWith(color: ZonerColors.white),
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),
    cardColor: ZonerColors.neutral20,
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        fixedSize: WidgetStatePropertyAll<Size>(Size.fromHeight(52)),
        padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(horizontal: 16)),
        elevation: WidgetStatePropertyAll<double>(0),
        splashFactory: InkSparkle.splashFactory,
      ),
    ),
    iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
      splashFactory: InkSparkle.splashFactory,
      elevation: WidgetStatePropertyAll<double>(0),
    )),
    textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
      elevation: WidgetStatePropertyAll<double>(0),
      splashFactory: InkSparkle.splashFactory,
    )),
    chipTheme: ChipThemeData(
      elevation: 0,
      selectedColor: ZonerColors.purple70,
      backgroundColor: ZonerColors.neutral20,
      side: BorderSide.none,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
    ),
    sliderTheme: const SliderThemeData(
        activeTickMarkColor: ZonerColors.purple70,
        inactiveTrackColor: ZonerColors.neutral20,
        trackHeight: 2,
        trackShape: RoundedRectSliderTrackShape(),
        thumbShape: RoundSliderThumbShape(
          elevation: 0,
          enabledThumbRadius: 8,
          disabledThumbRadius: 4,
          pressedElevation: 0,
        ),
        thumbColor: ZonerColors.white,
        overlayColor: Colors.transparent,
        overlayShape: RoundSliderOverlayShape(overlayRadius: 0)),
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: ZonerColors.purpleSeed,
      primary: ZonerColors.purple70,
      onPrimary: ZonerColors.purple10,
      primaryContainer: ZonerColors.purple10,
      onPrimaryContainer: ZonerColors.purple95,
      secondary: ZonerColors.orange70,
      secondaryContainer: ZonerColors.orange10, //Or maybe do Yellow 90
      onSecondary: ZonerColors.black,
      onSecondaryContainer: Colors.white,
      error: ZonerColors.red60,
      onError: ZonerColors.white,
      errorContainer: ZonerColors.red10,
      onErrorContainer: ZonerColors.red90,
    ),
  );
}
