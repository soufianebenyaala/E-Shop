import 'package:e_shop/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // light Theme
  static ThemeData appLightTheme = ThemeData(
    fontFamily: 'Lato',
    colorScheme: AppColor.lightScheme(),
    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.tab,
      dividerHeight: 0.2,
      labelStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      filled: true,
      alignLabelWithHint: true,
      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(width: 1.0, color: AppColor.lightScheme().error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(width: 1.0, color: AppColor.lightScheme().error),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(width: 1.0),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(width: 0.5),
      ),
      disabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(width: 0.5),
      ),
    ),
    cardTheme: CardTheme(
      elevation: 5,
      surfaceTintColor: Colors.white,
    ),
  );

  // dark Theme
  static ThemeData appDarkTheme = ThemeData(
    fontFamily: 'Lato',
    colorScheme: AppColor.darkScheme(),
    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.tab,
      dividerHeight: 0.2,
      labelStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      filled: true,
      alignLabelWithHint: true,
      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(width: 1.0, color: AppColor.darkScheme().error),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(width: 1.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(width: 1.0, color: AppColor.darkScheme().error),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(width: 0.5),
      ),
      disabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(width: 0.5),
      ),
    ),
    cardTheme: CardTheme(
      elevation: 5,
    ),
  );
}
