// base theme
import 'package:flutter/material.dart';
import 'package:middleman/core/constants/constants.dart';

final baseTheme = ThemeData.light();

// base border
final outlineInputBorderBase = OutlineInputBorder(
  borderRadius: BorderRadius.circular(12),
  borderSide: BorderSide(
    color: appColors.black.withOpacity(.3),
  ),
);

final ThemeData xcelTheme = baseTheme.copyWith(
  //useMaterial3: false,
  scaffoldBackgroundColor: appColors.white,
  primaryColor: appColors.black,
  appBarTheme: AppBarTheme(
    backgroundColor: appColors.white,
    elevation: 0,
    foregroundColor: appColors.black,
  ),
  colorScheme: baseTheme.colorScheme.copyWith(
    surface: appColors.white,
    // secondary: appColors.blue,
  ),
  // dividerColor: appColors.blue.withOpacity(.5),
  brightness: Brightness.light,
  buttonTheme: baseTheme.buttonTheme.copyWith(
    height: 55,
    minWidth: double.infinity,
    //  buttonColor: appColors.blue,
    textTheme: ButtonTextTheme.normal,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    //  disabledColor: appColors.blue.withOpacity(.3),
  ),
  tabBarTheme: baseTheme.tabBarTheme.copyWith(
    labelStyle: baseTheme.textTheme.bodySmall!.copyWith(
      //  color: appColors.blue,
      fontWeight: FontWeight.w600,
    ),
    unselectedLabelStyle: baseTheme.textTheme.bodySmall!.copyWith(
        //  color: appColors.grey6A7187,
        ),
    indicatorSize: TabBarIndicatorSize.tab,
    // indicatorColor: appColors.blue,
    //labelColor: appColors.blue,
    // unselectedLabelColor: appColors.grey6A7187,
  ),
  inputDecorationTheme: baseTheme.inputDecorationTheme.copyWith(
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    border: outlineInputBorderBase,
    enabledBorder: outlineInputBorderBase,
    focusedBorder: outlineInputBorderBase.copyWith(
      borderSide: const BorderSide(
          // color: appColors.blue,
          ),
    ),
    hintStyle: TextStyle(
      fontSize: 14,
      color: appColors.black,
      fontWeight: FontWeight.w400,
    ),
  ),
  textTheme: baseTheme.copyWith().textTheme.apply(
        fontFamily: kFontFamily,
        bodyColor: appColors.black,
      ),
);
