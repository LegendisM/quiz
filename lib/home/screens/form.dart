import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz/home/constants/theme.dart' show kThemeSecondaryColor;
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
        decoration: BoxDecoration(
          color: kThemeSecondaryColor,
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 3,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "فرم مدیریت کاربر",
              textAlign: TextAlign.center,
              style: kThemeFormTitleStyle,
            ),
            const Divider(
              height: 30,
            ),
            TextFormField(
              textAlign: TextAlign.right,
              decoration: const InputDecoration(
                label: Text("نام و نام خانوادگی"),
              ),
              style: kThemeFieldInputStyle,
            ),
            const SizedBox(
              height: 12.5,
            ),
            TextFormField(
              textAlign: TextAlign.left,
              textDirection: TextDirection.ltr,
              keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(
                label: Text("تاریخ تولد"),
                hintText: "مثال : 1400/1/1",
                hintStyle: kThemeFieldLabelColor,
              ),
              style: kThemeFieldInputStyle,
            ),
            const SizedBox(
              height: 12.5,
            ),
            TextFormField(
              textAlign: TextAlign.left,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                label: Text("عدد دلخواه (1 تا 10)"),
              ),
              style: kThemeFieldInputStyle,
            ),
            const SizedBox(
              height: 12.5,
            ),
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
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
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
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.orange.shade800),
              ),
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
