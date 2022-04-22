import 'package:flutter/material.dart';
import 'package:gronow/screens/splash_screen.dart';
import 'package:gronow/styles/colors.dart';
import 'package:gronow/styles/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: AppColors.background),
      home: const SplashScreen(),
    );
  }
}
