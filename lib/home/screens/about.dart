import 'package:flutter/material.dart';
import 'package:quiz/home/constants/theme_form.dart';
import 'package:quiz/home/widgets/about_card.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => AboutState();
}

class AboutState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(18),
        padding: const EdgeInsets.all(20),
        decoration: kThemeOfMainContainerDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            // * Head Of Form * //
            Text(
              "درباره ما . . .",
              textAlign: TextAlign.center,
              style: kThemeFormTitleStyle,
            ),
            Divider(
              height: 30,
            ),
            AboutCard(
              name: "حمیدرضا محمدی",
              grade: "برنامه نویس و توسعه دهنده",
              phone: "09016493605",
              code: "1080748644",
              location: "اصفهان - نجف آباد",
              avatar: "hamidreza",
            ),
            SizedBox(
              height: 25,
            ),
            AboutCard(
              name: "علی محمدی",
              grade: "توسعه تحقیقاتی",
              phone: "09015080448",
              code: "1080741267",
              location: "اصفهان - نجف آباد",
              avatar: "ali",
            ),
          ],
        ),
      ),
    );
  }
}
