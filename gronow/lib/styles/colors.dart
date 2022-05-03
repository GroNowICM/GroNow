import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  //One instance, needs factory
  // ignore: unused_field
  static late AppColors _instance;
  factory AppColors() => _instance = AppColors._();

  AppColors._();

  static const primaryColor = Color(0xff53B175);
  static const darkGrey = Color(0xff7C7C7C);
  static const background = Color.fromARGB(255, 147, 196, 161);
}
