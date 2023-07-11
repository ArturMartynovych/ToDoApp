import 'package:flutter/material.dart';
import 'package:todoapp/Utils/color_utils.dart';
import 'package:todoapp/Widgets/notes.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
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
      ),
      home: const Notes(),
    ),
  );
}
