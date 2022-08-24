import 'package:flutter/material.dart';
import 'package:quiz/home/constants/theme_about.dart';
import 'package:quiz/home/constants/theme_form.dart';

class AboutCard extends StatelessWidget {
  const AboutCard({
    super.key,
    required this.name,
    required this.grade,
    required this.avatar,
  });
  final String name;
  final String grade;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kThemeAboutCardDecoration,
      child: ListTile(
        title: Text(
          name,
          style: kThemeFieldLabelColor,
        ),
        subtitle: Text(
          grade,
          style: kThemeFieldLabelColor,
        ),
        leading: Image.asset(
          "assets/images/$avatar.png",
        ),
      ),
    );
  }
}
