import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

part 'color_schemes.dart';

class Themes {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: lightColorScheme.brightness,
    colorScheme: lightColorScheme.copyWith(
      background: lightScaffoldBackgroundColor,
      secondary: secondaryAppColor,
      error: Colors.red,
    ),
    canvasColor: lightScaffoldBackgroundColor,
    cardColor: lightScaffoldBackgroundColor,
    dividerColor: secondaryAppColor,
    dividerTheme: DividerThemeData(color: secondaryAppColor, space: 1, thickness: 1),
    cardTheme: const CardTheme(
      color: Colors.white,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAliasWithSaveLayer,
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all<Color>(Colors.black),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      ),
    ),
    primaryColor: secondaryAppColor,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      toolbarTextStyle: const TextStyle(color: Colors.black),
      iconTheme: const IconThemeData(color: Colors.black),
      systemOverlayStyle:
          SystemUiOverlayStyle(systemNavigationBarColor: secondaryAppColor, systemNavigationBarIconBrightness: lightColorScheme.brightness),
    ),
    iconTheme: const IconThemeData(color: Colors.white, size: 16.0),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      colorScheme: lightColorScheme.copyWith(
        surface: lightScaffoldBackgroundColor,
        background: lightScaffoldBackgroundColor,
        primary: secondaryAppColor,
        primaryContainer: secondaryAppColor,
        secondary: secondaryAppColor,
        secondaryContainer: secondaryAppColor,
        surfaceTint: lightScaffoldBackgroundColor,
        surfaceVariant: lightScaffoldBackgroundColor,
        error: Colors.red,
        onPrimary: secondaryAppColor,
        onSecondary: secondaryAppColor,
        onSurface: secondaryAppColor,
        onBackground: secondaryAppColor,
        onError: secondaryAppColor,
      ),
      padding: const EdgeInsets.all(16.0),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
        textStyle: Typography.whiteMountainView.headlineMedium!.copyWith(color: Colors.black, fontFamily: ''),
      ),
    ),
    cupertinoOverrideTheme: CupertinoThemeData(
      brightness: lightColorScheme.brightness,
      primaryColor: secondaryAppColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      errorStyle: const TextStyle(color: Colors.red),
      labelStyle: TextStyle(
        fontFamily: '',
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
        color: Colors.black.withOpacity(0.5),
      ),
      hintStyle: TextStyle(
        color: hexToColor('#8C8C8C'),
        fontSize: 13.0,
        fontWeight: FontWeight.w300,
      ),
      contentPadding: const EdgeInsets.all(0),
      fillColor: Colors.white,
      filled: true,
    ),
    fontFamily: '',
    textTheme: TextTheme(
      displayLarge:
          Typography.whiteMountainView.displayLarge!.copyWith(color: Colors.black, fontSize: 34.0, fontWeight: FontWeight.bold, fontFamily: ''),
      displayMedium: Typography.whiteMountainView.displayMedium!.copyWith(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.bold,
        fontFamily: '',
      ),
      displaySmall: Typography.whiteMountainView.displaySmall!.copyWith(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: '',
      ),
      //============

      headlineMedium: Typography.whiteMountainView.headlineMedium!.copyWith(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        fontFamily: '',
      ),
      headlineSmall: Typography.whiteMountainView.headlineSmall!.copyWith(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w700,
        fontFamily: '',
      ),
      //============

      titleLarge: Typography.whiteMountainView.titleLarge!.copyWith(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        fontFamily: '',
      ),
      titleMedium: Typography.whiteMountainView.titleMedium!.copyWith(
        color: Colors.black,
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
        fontFamily: '',
      ),
      titleSmall: Typography.whiteMountainView.titleSmall!.copyWith(
        color: Colors.white,
        fontSize: 11.0,
        fontWeight: FontWeight.w500,
        fontFamily: '',
      ),
      //=================

      bodyLarge: Typography.whiteMountainView.bodyLarge!.copyWith(
        color: Colors.black,
        fontSize: 15,
        fontFamily: '',
      ),
      bodyMedium: Typography.whiteMountainView.bodyMedium!.copyWith(
        color: Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: '',
      ),
      bodySmall: Typography.whiteMountainView.bodySmall!.copyWith(
        color: Colors.black,
        fontSize: 11.0,
        fontWeight: FontWeight.w300,
        fontFamily: '',
      ),
      //==========

      labelLarge: Typography.whiteMountainView.labelLarge!.copyWith(
        color: Colors.black,
        fontSize: 12.0,
        fontWeight: FontWeight.w700,
        fontFamily: '',
      ),
      labelSmall: Typography.whiteMountainView.labelSmall!.copyWith(
        color: Colors.white,
        fontSize: 11.0,
        fontWeight: FontWeight.w500,
        fontFamily: '',
      ),
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: darkColorScheme.copyWith(
      // background: const Color(0xff303030),
      // secondary: secondaryDarkAppColor,
      error: Colors.red,
    ),
    brightness: darkColorScheme.brightness,
    canvasColor: const Color(0xff303030),
    cardColor: const Color(0xff303030),
    dividerColor: const Color(0xff707070),
    dividerTheme: const DividerThemeData(color: Color(0xff707070), space: 1, thickness: 1),
    cardTheme: const CardTheme(
      color: cardBackground,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAliasWithSaveLayer,
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all<Color>(Colors.black),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      ),
    ),
    primaryColor: secondaryDarkAppColor,
    appBarTheme: AppBarTheme(
      // brightness: Color(0xff303030),
      systemOverlayStyle:
          SystemUiOverlayStyle(systemNavigationBarColor: secondaryDarkAppColor, systemNavigationBarIconBrightness: darkColorScheme.brightness),
      color: const Color.fromARGB(174, 44, 44, 44),
      toolbarTextStyle: const TextStyle(color: Colors.white),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 16.0,
    ),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      colorScheme: darkColorScheme.copyWith(
        primary: secondaryDarkAppColor,
        primaryContainer: secondaryDarkAppColor,
        secondary: secondaryDarkAppColor,
        secondaryContainer: secondaryDarkAppColor,
        surface: const Color(0xff303030),
        background: const Color(0xff303030),
        error: Colors.red,
        onPrimary: secondaryDarkAppColor,
        onSecondary: secondaryDarkAppColor,
        onSurface: secondaryDarkAppColor,
        onBackground: secondaryDarkAppColor,
        onError: secondaryDarkAppColor,
      ),
      padding: const EdgeInsets.all(16.0),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          textStyle: Typography.blackMountainView.headlineMedium!.copyWith(
            color: Colors.white,
            fontFamily: '',
          )),
    ),
    cupertinoOverrideTheme: CupertinoThemeData(
      brightness: darkColorScheme.brightness,
      primaryColor: secondaryDarkAppColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      errorStyle: const TextStyle(color: Colors.red),
      labelStyle: TextStyle(
        fontFamily: '',
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
        color: Colors.white.withOpacity(0.5),
      ),
      hintStyle: TextStyle(
        color: hexToColor('#8C8C8C'),
        fontSize: 13.0,
        fontWeight: FontWeight.w300,
      ),
      contentPadding: const EdgeInsets.all(0),
      fillColor: Colors.white,
      filled: true,
    ),
    fontFamily: '',
    textTheme: TextTheme(
      displayLarge: Typography.blackMountainView.displayLarge!.copyWith(
        color: Colors.white,
        fontSize: 34.0,
        fontWeight: FontWeight.bold,
        fontFamily: '',
      ),
      displayMedium: Typography.blackMountainView.displayMedium!.copyWith(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
        fontFamily: '',
      ),
      displaySmall: Typography.blackMountainView.displaySmall!.copyWith(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: '',
      ),
      headlineMedium: Typography.blackMountainView.headlineMedium!.copyWith(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        fontFamily: '',
      ),
      headlineSmall: Typography.blackMountainView.headlineSmall!.copyWith(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w700,
        fontFamily: '',
      ),
      bodyLarge: Typography.blackMountainView.bodyLarge!.copyWith(
        color: Colors.black,
        fontSize: 15,
        fontFamily: '',
      ),
      bodyMedium: Typography.blackMountainView.bodyMedium!.copyWith(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: '',
      ),
      bodySmall: Typography.blackMountainView.bodySmall!.copyWith(
        color: Colors.white,
        fontSize: 11.0,
        fontWeight: FontWeight.w300,
        fontFamily: '',
      ),
      labelLarge: Typography.blackMountainView.labelLarge!.copyWith(
        color: Colors.white,
        fontSize: 12.0,
        fontWeight: FontWeight.w700,
        fontFamily: '',
      ),
      labelSmall: Typography.blackMountainView.labelSmall!.copyWith(
        color: Colors.white,
        fontSize: 11.0,
        fontWeight: FontWeight.w500,
        fontFamily: '',
      ),
      titleLarge: Typography.blackMountainView.titleLarge!.copyWith(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        fontFamily: '',
      ),
      titleMedium: Typography.blackMountainView.titleMedium!.copyWith(
        color: Colors.white,
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
        fontFamily: '',
      ),
      titleSmall: Typography.blackMountainView.titleSmall!.copyWith(
        color: Colors.white,
        fontSize: 11.0,
        fontWeight: FontWeight.w500,
        fontFamily: '',
      ),
    ),
  );
}

InputDecoration defTextFieldDecoration() {
  return InputDecoration(
      hintText: '',
      labelStyle: const TextStyle(color: Color(0xffFFD700)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Color(0xffFFD700),
          )),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Color(0xffFFD700),
          )),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Color(0xffFFD700),
          )),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Color(0xffFFD700),
          )),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Color(0xffFFD700),
          )),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      filled: true,
      fillColor: Colors.grey.withOpacity(0.2));
}
