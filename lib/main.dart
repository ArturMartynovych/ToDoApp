import 'package:flutter/material.dart';
import 'package:todoapp/Widgets/notes.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
      ),
      home: const Notes(),
    ),
  );
}
