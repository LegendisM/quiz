import 'package:flutter/material.dart';
import 'package:quiz/home/constants/theme.dart';

BoxDecoration kThemeAboutCardDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(6),
  gradient: const LinearGradient(
    colors: [
      kThemeBackgroundColor,
      kThemeBackgroundSecondaryColor,
      kThemeBackgroundColor,
    ],
  ),
  boxShadow: const [
    BoxShadow(
      blurRadius: 6,
      color: Colors.black12,
    ),
  ],
);
