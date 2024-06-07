import 'package:flutter/material.dart';

///-------Paddings--------///

const double kPadding4 = 4.0;
const double kPadding8 = 8.0;
const double kPadding12 = 12.0;
const double kPadding16 = 16.0;
const double kPadding24 = 24.0;
const double kPadding32 = 32.0;
const double kPadding48 = 48.0;
const double kPadding64 = 64.0;

///------Input Decorations-------///
class ZonerInputDecoration {
  static InputDecoration inputDecoration(BuildContext context) {
    return InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        errorStyle: ZonerTextStyles.bodyMedium
            .copyWith(color: Theme.of(context).colorScheme.error),
        errorBorder: OutlineInputBorder(
          gapPadding: 4,
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.error, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          gapPadding: 0,
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          gapPadding: 0,
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        disabledBorder: OutlineInputBorder(
          gapPadding: 0,
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          gapPadding: 0,
          borderSide: const BorderSide(width: 1, color: ZonerColors.purple70),
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        isDense: true,
        fillColor: Theme.of(context).brightness == Brightness.light
            ? ZonerColors.neutral95
            : ZonerColors.neutral20,
        hintStyle: ZonerTextStyles.bodyMedium.copyWith(
            color: ZonerColors.neutral50, fontFamily: "Plus Jakarta Sans"),
        labelStyle:
            ZonerTextStyles.bodyMedium.copyWith(color: ZonerColors.black));
  }
}

///------Colors-------///
class ZonerColors {
  static const Color black = Color(0xFF121014);
  static const Color white = Color(0xFFFFFBFF);

  ///-----------Purple---------///
  static const Color purpleSeed = Color(0xFF8951FE);
  static const Color purple0 = Color(0xFF000000);
  static const Color purple05 = Color(0xFF170040);
  static const Color purple10 = Color(0xFF23005B);
  static const Color purple15 = Color(0xFF300075);
  static const Color purple20 = Color(0xFF3C0090);
  static const Color purple25 = Color(0xFF4900AC);
  static const Color purple30 = Color(0xFF5700C9);
  static const Color purple35 = Color(0xFF631ED7);
  static const Color purple40 = Color(0xFF7032E4);
  static const Color purple50 = Color(0xFF8951FE);
  static const Color purple60 = Color(0xFFA178FF);
  static const Color purple70 = Color(0xFFB89BFF);
  static const Color purple80 = Color(0xFFD1BCFF);
  static const Color purple90 = Color(0xFFE9DDFF);
  static const Color purple95 = Color(0xFFF6EDFF);
  static const Color purple98 = Color(0xFFFEF7FF);
  static const Color purple99 = Color(0xFFFFFBFF);
  static const Color purple100 = Color(0xFFFFFFFF);

  ///-----------Orange---------///
  static const Color orangeSeed = Color(0xFFF28045);
  static const Color orange0 = Color(0xFF000000);
  static const Color orange05 = Color(0xFF240900);
  static const Color orange10 = Color(0xFF351000);
  static const Color orange15 = Color(0xFF451800);
  static const Color orange20 = Color(0xFF562000);
  static const Color orange25 = Color(0xFF682800);
  static const Color orange30 = Color(0xFF7A3000);
  static const Color orange35 = Color(0xFF8D3800);
  static const Color orange40 = Color(0xFFA04100);
  static const Color orange50 = Color(0xFFC1581A);
  static const Color orange60 = Color(0xFFE27132);
  static const Color orange70 = Color(0xFFFF8C51);
  static const Color orange80 = Color(0xFFFFB693);
  static const Color orange90 = Color(0xFFFFDBCC);
  static const Color orange95 = Color(0xFFFFEDE6);
  static const Color orange98 = Color(0xFFFFF8F6);
  static const Color orange99 = Color(0xFFFFFBFF);
  static const Color orange100 = Color(0xFFFFFFFF);

  ///-----------Green---------///
  static const Color greenSeed = Color(0xFF06EDAB);
  static const Color green0 = Color(0xFF000000);
  static const Color green05 = Color(0xFF00150C);
  static const Color green10 = Color(0xFF002114);
  static const Color green15 = Color(0xFF002C1D);
  static const Color green20 = Color(0xFF003826);
  static const Color green25 = Color(0xFF00452F);
  static const Color green30 = Color(0xFF005138);
  static const Color green35 = Color(0xFF005F42);
  static const Color green40 = Color(0xFF006C4C);
  static const Color green50 = Color(0xFF008860);
  static const Color green60 = Color(0xFF00A576);
  static const Color green70 = Color(0xFF00C38C);
  static const Color green80 = Color(0xFF00E1A2);
  static const Color green90 = Color(0xFF9FF4CB);
  static const Color green95 = Color(0xFFBDFFDE);
  static const Color green98 = Color(0xFFE8FFF0);
  static const Color green99 = Color(0xFFF4FFF6);
  static const Color green100 = Color(0xFFFFFFFF);

  ///-----------Red---------///
  static const Color redSeed = Color(0xFFFF4C4C);
  static const Color red0 = Color(0xFF000000);
  static const Color red05 = Color(0xFF2D0002);
  static const Color red10 = Color(0xFF410004);
  static const Color red15 = Color(0xFF540007);
  static const Color red20 = Color(0xFF68000B);
  static const Color red25 = Color(0xFF7D000F);
  static const Color red30 = Color(0xFF930014);
  static const Color red35 = Color(0xFFA90019);
  static const Color red40 = Color(0xFFBB1623);
  static const Color red50 = Color(0xFFDF3438);
  static const Color red60 = Color(0xFFFF5352);
  static const Color red70 = Color(0xFFFF8982);
  static const Color red80 = Color(0xFFFFB3AE);
  static const Color red90 = Color(0xFFFFDAD7);
  static const Color red95 = Color(0xFFFFEDEB);
  static const Color red98 = Color(0xFFFFF8F7);
  static const Color red99 = Color(0xFFFFFBFF);
  static const Color red100 = Color(0xFFFFFFFF);

  ///-----------Neutral---------///
  static const Color neutral0 = Color(0xFF000000);
  static const Color neutral05 = Color(0xFF121014);
  static const Color neutral10 = Color(0xFF1C1B1E);
  static const Color neutral15 = Color(0xFF272529);
  static const Color neutral20 = Color(0xFF323033);
  static const Color neutral25 = Color(0xFF3D3B3E);
  static const Color neutral30 = Color(0xFF48464A);
  static const Color neutral35 = Color(0xFF545156);
  static const Color neutral40 = Color(0xFF605D61);
  static const Color neutral50 = Color(0xFF79767A);
  static const Color neutral60 = Color(0xFF938F94);
  static const Color neutral70 = Color(0xFFAEAAAE);
  static const Color neutral80 = Color(0xFFCAC5CA);
  static const Color neutral90 = Color(0xFFE6E1E6);
  static const Color neutral95 = Color(0xFFF5EFF4);
  static const Color neutral98 = Color(0xFFFDF8FD);
  static const Color neutral99 = Color(0xFFFFFBFF);
  static const Color neutral100 = Color(0xFFFFFFFF);
}

///------Text Styles-------///
class ZonerTextStyles {
  ///---Display---//
  static TextStyle displayLargeAlt = const TextStyle(
    fontFamily: "Gloock",
    fontSize: 57,
    height: 1,
  );

  static TextStyle displayLarge = const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 57,
    height: 1,
  );

  static TextStyle displayMediumAlt = const TextStyle(
    fontFamily: "Gloock",
    fontSize: 45,
    height: 1,
  );

  static TextStyle displayMedium = const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 45,
    height: 1,
  );

  static TextStyle displaySmallAlt = const TextStyle(
    fontFamily: "Gloock",
    fontSize: 36,
    height: 1,
  );
  static TextStyle displaySmall = const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 36,
    height: 1,
  );

  ///---Headline---///
  static TextStyle headlineLarge = const TextStyle(
    fontSize: 32,
    height: 1,
  );
  static TextStyle headlineLargeAlt = const TextStyle(
    fontFamily: "Gloock",
    fontSize: 32,
    height: 1,
  );
  static TextStyle headlineMedium = const TextStyle(
    fontSize: 28,
    height: 1,
  );
  static TextStyle headlineMediumAlt = const TextStyle(
    fontFamily: "Gloock",
    fontSize: 28,
    height: 1,
  );
  static TextStyle headlineSmall = const TextStyle(
    fontSize: 24,
    height: 1,
  );
  static TextStyle headlineSmallAlt = const TextStyle(
    fontFamily: "Gloock",
    fontSize: 24,
    height: 1,
  );

  ///---Title---///
  static TextStyle titleLargeAlt = const TextStyle(
    fontFamily: "Gloock",
    fontSize: 22,
    height: 1,
  );
  static TextStyle titleLarge = const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 22,
    height: 1,
  );

  static TextStyle titleMediumAlt = const TextStyle(
    fontFamily: "Gloock",
    fontSize: 16,
    height: 1,
  );
  static TextStyle titleMedium = const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 16,
    height: 1,
  );

  static TextStyle titleSmallAlt = const TextStyle(
    fontFamily: "Gloock",
    fontSize: 14,
    height: 1,
  );
  static TextStyle titleSmall = const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 14,
    height: 1,
  );

  ///---Body---///
  static TextStyle bodyLargeAlt = const TextStyle(
    fontSize: 16,
    fontFamily: "Gloock",
  );

  static TextStyle bodyLarge = const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 16,
    //  height: 1,
  );

  static TextStyle bodyMediumAlt = const TextStyle(
    fontSize: 14,
    fontFamily: "Gloock",
  );
  static TextStyle bodyMedium = const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 14,
    // height: 1,
  );

  static TextStyle bodySmall = const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 12,
    //  height: 1,
  );
}
