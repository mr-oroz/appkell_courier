import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Themes
enum ThemeType {
  lightGreen,
  darkGreen;

  bool get isLightGreen => this == lightGreen;
  bool get isDarkGreen => this == darkGreen;
}

class AppTheme {
  static const defaultType = ThemeType.lightGreen;
  static final defaultTheme = AppTheme.fromType(defaultType);

  late ThemeType type;
  bool isDark;

  late Color primaryColor;
  late Color onPrimaryColor;
  late Color primaryTintColor;

  late Color secondaryColor;
  late Color accentColor;
  late Color onAccentColor;
  late Color bgColor;
  late Color bgColor1;
  late Color bgColor2;
  late Color focusColor;
  late Color onFocusColor;
  late Color greyWeakColor;
  late Color greyColor;
  late Color greyMediumColor;
  late Color greyStrongColor;
  late Color surface;
  late Color greySoftColor;
  late Color softBlackColor;
  late Color greyLightColor;
  late Color bottomNavBarColor;

  late Color iconColor;
  late Color mainTextColor;
  late Color secondTextColor;
  late Color inverseTextColor;

  AppTheme({this.isDark = false}) {
    mainTextColor = isDark ? Colors.white : const Color(0xFF222222);
    secondTextColor = const Color(0xFF8A8A8A);
    inverseTextColor = isDark ? Colors.black : Colors.white;
    iconColor = isDark ? Colors.white : const Color(0xFF242424);
  }

  factory AppTheme.fromType(ThemeType t) {
    switch (t) {
      case ThemeType.lightGreen:
        return AppTheme(isDark: false)
          ..type = t
          ..bottomNavBarColor = const Color(0xffffffff)
          ..greyStrongColor = const Color(0xff333333)
          ..greyLightColor = const Color.fromRGBO(248, 248, 248, 1)
          ..softBlackColor = const Color.fromRGBO(36, 36, 36, 0.64)
          ..greySoftColor = const Color.fromRGBO(245, 245, 245, 1)
          ..primaryColor = const Color(0xFFFF6C29)
          ..onPrimaryColor = const Color(0xFFFFFFFF)
          ..primaryTintColor = const Color(0x3053B175)
          ..accentColor = const Color(0xFFD0103F)
          ..onAccentColor = const Color(0xFFFFFFFF)
          ..focusColor = const Color(0x3000BB29)
          ..onFocusColor = const Color(0xFFFFFFFF)
          ..secondaryColor = const Color(0xFFf0f0f0)
          ..bgColor = const Color(0xFFFFFFFF)
          ..bgColor1 = Colors.white
          ..bgColor2 = Colors.white
          ..surface = const Color(0xFFF0F0F0)
          ..greyWeakColor = const Color(0xffffffff)
          ..greyColor = const Color(0xFFd9d9d9)
          ..greyMediumColor = const Color(0xff747474)
          ..greyStrongColor = const Color(0xff333333);

      case ThemeType.darkGreen:
        return AppTheme(isDark: true)
          ..type = t
          ..softBlackColor = Colors.white
          ..bottomNavBarColor = const Color(0xff2b2b2b)
          ..greySoftColor = const Color.fromRGBO(245, 245, 245, 1)
          ..primaryColor = const Color(0xFFFE9F0C)
          ..onPrimaryColor = const Color(0xFFFFFFFF)
          ..primaryTintColor = const Color(0x3053B175)
          ..accentColor = const Color.fromARGB(255, 208, 138, 16)
          ..onAccentColor = const Color(0xFFFFFFFF)
          ..focusColor = const Color(0x3053B175)
          ..onFocusColor = const Color(0xFFFFFFFF)
          ..secondaryColor = const Color(0xFF2b2b2b)
          ..bgColor = const Color(0xFF191919)
          ..bgColor1 = const Color.fromARGB(255, 30, 40, 43)
          ..bgColor2 = const Color(0xFFf0f3f8)
          ..surface = const Color(0xFF2B2B2B)
          ..greyWeakColor = const Color(0xFF2b2b2b)
          ..greyColor = const Color(0xFF6a6a6a)
          ..greyMediumColor = const Color(0xff747474)
          ..greyStrongColor = const Color(0xff333333)
          ..greyLightColor = const Color.fromRGBO(248, 248, 248, 1);
    }
  }

  ThemeData get themeData {
    var t = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: bgColor,
      fontFamily: 'Helvetica',
      snackBarTheme: SnackBarThemeData(
        actionTextColor: primaryColor,
      ),
      cardTheme: CardTheme(
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      colorScheme: ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: primaryColor,
        secondary: secondaryColor,
        background: bgColor,
        surface: surface,
        surfaceTint: bgColor,
        onBackground: mainTextColor,
        onSurface: mainTextColor,
        onError: mainTextColor,
        onPrimary: onPrimaryColor,
        onSecondary: inverseTextColor,
        error: focusColor,
      ),
    );
    return t.copyWith(
      textTheme: t.textTheme.apply(
        displayColor: mainTextColor,
        bodyColor: mainTextColor,
      ),
      visualDensity: VisualDensity.compact,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: primaryColor,
        selectionHandleColor: Colors.transparent,
        selectionColor: primaryColor,
      ),
      buttonTheme: ButtonThemeData(
        height: 55,
        buttonColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        highlightColor: greyWeakColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: onPrimaryColor,
          disabledBackgroundColor: const Color(0xFFBABABA),
          minimumSize: const Size.fromHeight(55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 13),
          textStyle: TextStyle(
            fontSize: 16,
            color: onPrimaryColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        color: bgColor,
        elevation: 0,
      ),
      iconTheme: IconThemeData(color: iconColor),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 14,
        ),
        hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: bgColor,
        errorStyle: const TextStyle(fontSize: 12, color: Colors.redAccent),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color(0xFFD9D9D9),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.redAccent,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color(0xFFD9D9D9),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color(0xFFD9D9D9),
          ),
        ),
      ),
      primaryColor: primaryColor,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return primaryColor;
          }
          return null;
        }),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return primaryColor;
          }
          return null;
        }),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return primaryColor;
          }
          return null;
        }),
        trackColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return primaryColor;
          }
          return null;
        }),
      ),
    );
  }

  Color shift(Color c, double amt) {
    amt *= (isDark ? -1 : 1);
    var hslc = HSLColor.fromColor(c); // Convert to HSL
    double lightness =
        (hslc.lightness + amt).clamp(0, 1.0).toDouble(); // Add/Remove lightness
    return hslc.withLightness(lightness).toColor(); // Convert back to Color
  }
}
