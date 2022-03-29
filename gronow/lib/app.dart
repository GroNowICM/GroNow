import 'package:flutter/material.dart';
import 'package:gronow/screens/splash_screen.dart';
import 'package:gronow/styles/theme.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      home: SplashScreen(),
    );
  }
}
