import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:todoapp/Widgets/notes.dart';
import 'package:todoapp/Widgets/theme.dart';

void main(List<String> args) {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    MaterialApp(
      theme: myTheme,
      home: const Notes(),
      debugShowCheckedModeBanner: false,
    ),
  );
  FlutterNativeSplash.remove();
}
