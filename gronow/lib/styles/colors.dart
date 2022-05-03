import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  //One instance, needs factory
  // ignore: unused_field
  static late AppColors _instance;
  factory AppColors() => _instance = AppColors._();

  AppColors._();

  static const primaryColor = Color(0xff53B175);
  static const secondaryColor = Color.fromARGB(255, 118, 247, 165);
  static const darkGrey = Color(0xff7C7C7C);
  static const lightGrey = Color.fromARGB(255, 240, 240, 240);
  static const background = Color.fromARGB(255, 147, 196, 161);
}
