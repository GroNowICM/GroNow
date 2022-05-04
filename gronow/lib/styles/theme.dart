import 'package:flutter/material.dart';
import 'package:gronow/styles/colors.dart';

String gilroyFontFamily = "Gilroy";

ThemeData themeData = ThemeData(
  colorScheme:
      themeData.colorScheme.copyWith(secondary: AppColors.primaryColor),
  fontFamily: gilroyFontFamily,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
