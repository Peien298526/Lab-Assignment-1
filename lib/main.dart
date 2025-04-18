import 'package:flutter/material.dart';
import 'package:lab_assignment_1/splashscreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Random User App",
      theme: ThemeData(),
      home: const SplashScreen(),
    );
  }
}
