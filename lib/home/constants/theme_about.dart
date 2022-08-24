import 'package:flutter/material.dart';

const Color kThemeAboutBackgroundColor = Color.fromARGB(255, 55, 56, 86);
const Color kThemeAboutBackgroundSecondary = Color.fromARGB(255, 121, 120, 160);
const Color kThemeAboutBackgroundColorv2 = Color.fromARGB(225, 45, 46, 73);
const Color kThemeAboutBackgroundSecondv2 = Color.fromARGB(45, 121, 120, 160);

BoxDecoration kThemeAboutCardDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(6),
  gradient: const LinearGradient(
    colors: [
      kThemeAboutBackgroundColor,
      kThemeAboutBackgroundSecondary,
    ],
  ),
  boxShadow: const [
    BoxShadow(
      blurRadius: 6,
      color: Colors.black12,
    ),
  ],
);

BoxDecoration kThemeAboutCardDecorationv2 = const BoxDecoration(
  borderRadius: BorderRadius.vertical(
    top: Radius.circular(
      28,
    ),
    bottom: Radius.circular(
      6,
    ),
  ),
  gradient: LinearGradient(
    colors: [
      kThemeAboutBackgroundColorv2,
      kThemeAboutBackgroundSecondv2,
    ],
  ),
);
