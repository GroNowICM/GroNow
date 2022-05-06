import 'package:flutter/material.dart';
import 'package:gronow/screens/splash_screen.dart';
import 'package:gronow/styles/colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
              .copyWith(primary: AppColors.secondaryColor),
          textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
              decorationColor: Colors.white)),
      home: const SplashScreen(),
    );
  }
}
