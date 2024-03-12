import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core.dart';

class ZonerThemeData {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: ZonerColors.blue40,
    primaryColorLight: ZonerColors.blue50,
    primaryColorDark: ZonerColors.blue30,
    scaffoldBackgroundColor: ZonerColors.white,
    iconTheme: const IconThemeData(color: ZonerColors.black),
    primaryIconTheme: const IconThemeData(color: ZonerColors.black),
    cardTheme: CardTheme(
      color: ZonerColors.blue95,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    ),
    fontFamily: 'Plus Jakarta Sans',
    textTheme: TextTheme(
      displayLarge:
          SicklerTextStyles.displayLarge.copyWith(color: ZonerColors.black),
      displayMedium:
          SicklerTextStyles.displayMedium.copyWith(color: ZonerColors.black),
      displaySmall:
          SicklerTextStyles.displaySmall.copyWith(color: ZonerColors.black),

      ///
      headlineLarge:
          SicklerTextStyles.headlineLarge.copyWith(color: ZonerColors.black),
      headlineSmall:
          SicklerTextStyles.headlineSmall.copyWith(color: ZonerColors.black),
      headlineMedium: SicklerTextStyles.headlineMedium
          .copyWith(color: ZonerColors.black),

      ///
      titleLarge:
          SicklerTextStyles.titleLarge.copyWith(color: ZonerColors.black),
      titleMedium:
          SicklerTextStyles.titleMedium.copyWith(color: ZonerColors.black),
      titleSmall:
          SicklerTextStyles.titleSmall.copyWith(color: ZonerColors.black),

      ///
      bodyLarge:
          SicklerTextStyles.bodyLarge.copyWith(color: ZonerColors.black),
      bodyMedium:
          SicklerTextStyles.bodyMedium.copyWith(color: ZonerColors.black),
      bodySmall:
          SicklerTextStyles.bodySmall.copyWith(color: ZonerColors.black),
    ),
    appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0,
        backgroundColor: Colors.transparent),
    cardColor: ZonerColors.blue95,
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        fixedSize: MaterialStatePropertyAll<Size>(Size.fromHeight(52)),
        padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(horizontal: 16)),
        elevation: MaterialStatePropertyAll<double>(0),
      ),
    ),
    chipTheme: ChipThemeData(
      labelStyle:
          SicklerTextStyles.bodyMedium.copyWith(color: ZonerColors.blue10),
      elevation: 0,
      selectedColor: ZonerColors.blue90,
      backgroundColor: ZonerColors.neutral95,
      side: BorderSide.none,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
    ),
    sliderTheme: const SliderThemeData(
        activeTickMarkColor: ZonerColors.blue40,
        inactiveTrackColor: ZonerColors.neutral90,
        trackHeight: 4,
        trackShape: RoundedRectSliderTrackShape(),
        thumbShape: RoundSliderThumbShape(
          elevation: 0,
          enabledThumbRadius: 18,
          disabledThumbRadius: 4,
          pressedElevation: 0,
        ),
        thumbColor: ZonerColors.white,
        overlayColor: Colors.transparent,
        overlayShape: RoundSliderOverlayShape(overlayRadius: 0)),
    switchTheme: SwitchThemeData(
      thumbColor: const MaterialStatePropertyAll<Color>(ZonerColors.white),
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return ZonerColors.blue40;
        }
        return ZonerColors.blue90;
      }),
      trackOutlineColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return ZonerColors.blue40;
        }
        return ZonerColors.blue90;
      }),
      trackOutlineWidth: const MaterialStatePropertyAll<double>(0),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: ZonerColors.blueSeed,
      primary: ZonerColors.blue40,
      onPrimary: ZonerColors.white,
      primaryContainer: ZonerColors.blue90,
      onPrimaryContainer: ZonerColors.blue10,
      error: ZonerColors.red50,
      onError: ZonerColors.white,
      errorContainer: ZonerColors.red90,
      onErrorContainer: ZonerColors.red10,
    ),
  );

  ///--------Dark Theme-------///
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: ZonerColors.blue70,
    primaryColorLight: ZonerColors.blue90,
    primaryColorDark: ZonerColors.blue70,
    scaffoldBackgroundColor: ZonerColors.black,
    iconTheme: const IconThemeData(color: ZonerColors.white),
    primaryIconTheme: const IconThemeData(color: ZonerColors.white),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return ZonerColors.blue10;
        }
        return ZonerColors.neutral70;
      }),
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return ZonerColors.blue70;
        }
        return ZonerColors.neutral20;
      }),
      trackOutlineColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return ZonerColors.blue70;
        }
        return ZonerColors.neutral20;
      }),
      trackOutlineWidth: const MaterialStatePropertyAll<double>(0),
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
          SicklerTextStyles.displayLarge.copyWith(color: ZonerColors.white),
      displayMedium:
          SicklerTextStyles.displayMedium.copyWith(color: ZonerColors.white),
      displaySmall:
          SicklerTextStyles.displaySmall.copyWith(color: ZonerColors.white),

      ///
      headlineLarge:
          SicklerTextStyles.headlineLarge.copyWith(color: ZonerColors.white),
      headlineSmall:
          SicklerTextStyles.headlineSmall.copyWith(color: ZonerColors.white),
      headlineMedium: SicklerTextStyles.headlineMedium
          .copyWith(color: ZonerColors.white),

      ///
      titleLarge:
          SicklerTextStyles.titleLarge.copyWith(color: ZonerColors.white),
      titleMedium:
          SicklerTextStyles.titleMedium.copyWith(color: ZonerColors.white),
      titleSmall:
          SicklerTextStyles.titleSmall.copyWith(color: ZonerColors.white),

      ///
      bodyLarge:
          SicklerTextStyles.bodyLarge.copyWith(color: ZonerColors.white),
      bodyMedium:
          SicklerTextStyles.bodyMedium.copyWith(color: ZonerColors.white),
      bodySmall:
          SicklerTextStyles.bodySmall.copyWith(color: ZonerColors.white),
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),
    cardColor: ZonerColors.neutral20,
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        fixedSize: MaterialStatePropertyAll<Size>(Size.fromHeight(52)),
        padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(horizontal: 16)),
        elevation: MaterialStatePropertyAll<double>(0),
      ),
    ),
    chipTheme: ChipThemeData(
      elevation: 0,
      selectedColor: ZonerColors.blue70,
      backgroundColor: ZonerColors.neutral20,
      side: BorderSide.none,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
    ),
    sliderTheme: const SliderThemeData(
        activeTickMarkColor: ZonerColors.blue40,
        inactiveTrackColor: ZonerColors.neutral90,
        trackHeight: 4,
        trackShape: RoundedRectSliderTrackShape(),
        thumbShape: RoundSliderThumbShape(
          elevation: 0,
          enabledThumbRadius: 18,
          disabledThumbRadius: 4,
          pressedElevation: 0,
        ),
        thumbColor: ZonerColors.white,
        overlayColor: Colors.transparent,
        overlayShape: RoundSliderOverlayShape(overlayRadius: 0)),
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: ZonerColors.blueSeed,
      primary: ZonerColors.blue70,
      onPrimary: ZonerColors.blue10,
      primaryContainer: ZonerColors.blue10,
      onPrimaryContainer: ZonerColors.blue95,
      error: ZonerColors.red60,
      onError: ZonerColors.white,
      errorContainer: ZonerColors.red10,
      onErrorContainer: ZonerColors.red90,
    ),
  );
}
