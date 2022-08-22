import 'package:flutter/material.dart';
import 'package:quiz/home/screens/home.dart';
import 'package:quiz/home/constants/theme.dart';
import 'package:quiz/home/constants/theme_form.dart' show kThemeFieldLabelColor;

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz Application",
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const Directionality(
              textDirection: TextDirection.rtl,
              child: Home(),
            ),
      },
      theme: ThemeData(
        fontFamily: "Yekan",
        backgroundColor: kThemeBackgroundColor,
        scaffoldBackgroundColor: kThemePrimaryColor,
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: kThemeFieldLabelColor,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: kThemeFieldBorderColor,
              width: 1.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: kThemeFieldBorderColor,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: kThemeFieldActiveBorderColor,
              width: 1.5,
            ),
          ),
        ),
        dividerColor: kThemeDivederColor,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(
            color: kThemeEnableIconColor,
            shadows: [
              Shadow(blurRadius: 4.0),
            ],
            size: 30.0,
          ),
          unselectedIconTheme: IconThemeData(
            color: kThemeDisableIconColor,
            shadows: [
              Shadow(
                blurRadius: 4.0,
              ),
            ],
            size: 30.0,
          ),
        ),
      ),
    );
  }
}
