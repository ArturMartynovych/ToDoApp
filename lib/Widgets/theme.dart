import 'package:flutter/material.dart';
import 'package:todoapp/Utils/color_utils.dart';

final ThemeData myTheme = ThemeData().copyWith(
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    backgroundColor: hexStringToColor('#E1D4C8'),
  ),
  scaffoldBackgroundColor: hexStringToColor('#E1D4C8'),
  cardColor: hexStringToColor('#222325'),
  cardTheme: const CardTheme().copyWith(
    margin: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 5,
    ),
  ),
  dialogTheme: DialogTheme(
    backgroundColor: hexStringToColor('#E1D4C8'),
    titleTextStyle: TextStyle(
      color: hexStringToColor('#C49653'),
      fontSize: 26,
      fontWeight: FontWeight.bold,
    ),
    contentTextStyle: TextStyle(
      color: hexStringToColor('#222325'),
    ),
  ),
  textTheme: const TextTheme().copyWith(
    titleLarge: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 14,
      color: hexStringToColor('#C49653'),
    ),
    labelSmall: TextStyle(
      color: hexStringToColor('#E1D4C8'),
    ),
    bodySmall: TextStyle(
      color: hexStringToColor('#222325'),
    ),
    bodyLarge: TextStyle(
      color: hexStringToColor('#222325'),
    ),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: hexStringToColor('#E1D4C8'),
    modalBackgroundColor: hexStringToColor('#E1D4C8'),
  ),
  iconTheme: IconThemeData(
    color: hexStringToColor('#C49653'),
  ),
  dropdownMenuTheme: DropdownMenuThemeData(
    textStyle: TextStyle(
      color: hexStringToColor('#222325'),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: hexStringToColor('#222325'),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
        hexStringToColor('#222325'),
      ),
      foregroundColor: MaterialStateProperty.all<Color>(
        hexStringToColor('#E1D4C8'),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(
        hexStringToColor('#222325'),
      ),
    ),
  ),
);
