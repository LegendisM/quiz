import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz/home/constants/theme_form.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => FormState();
}

class FormState extends State<FormScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(18),
        padding: const EdgeInsets.all(20),
        decoration: kThemeOfMainContainerDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // * Head Of Form * //
            const Text(
              "فرم مدیریت کاربر",
              textAlign: TextAlign.center,
              style: kThemeFormTitleStyle,
            ),
            const Divider(
              height: 30,
            ),
            // * Input Fields * //
            TextFormField(
              textAlign: TextAlign.right,
              decoration: kTextFieldNameDecoration,
              style: kThemeFieldInputStyle,
            ),
            const SizedBox(
              height: 12.5,
            ),
            TextFormField(
              textAlign: TextAlign.left,
              textDirection: TextDirection.ltr,
              keyboardType: TextInputType.datetime,
              decoration: kTextFieldDateDecoration,
              style: kThemeFieldInputStyle,
            ),
            const SizedBox(
              height: 12.5,
            ),
            TextFormField(
              textAlign: TextAlign.left,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: kTextFieldNumberDecoration,
              style: kThemeFieldInputStyle,
            ),
            const SizedBox(
              height: 12.5,
            ),
            // * Selection Path button * //
            ElevatedButton(
              onPressed: () async {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("انتخاب مسیر فایل"),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(Icons.folder_copy_outlined),
                ],
              ),
            ),
            const SizedBox(
              height: 2.5,
            ),
            // * Save File button * //
            ElevatedButton(
              style: kButtonGreenStyle,
              onPressed: () async {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("ذخیره"),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.save_as_outlined,
                  )
                ],
              ),
            ),
            const Divider(
              height: 30,
            ),
            // * Selection Other File by Path button * //
            ElevatedButton(
              style: kButtonOrangeStyle,
              onPressed: () async {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("باز کردن فایل از قبل ایجاد شده"),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(Icons.open_in_browser_outlined),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
