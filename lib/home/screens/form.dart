import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:quiz/home/constants/theme_form.dart';
import 'package:quiz/home/services/document_service.dart';
import 'package:quiz/home/services/permission_service.dart';
import 'package:quiz/home/models/document_model.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({
    super.key,
    required this.documentService,
    required this.permissionService,
  });

  final DocumentService documentService;
  final PermissionService permissionService;

  @override
  State<FormScreen> createState() => FormState();
}

class FormState extends State<FormScreen> {
  late DocumentModel currentDocument;

  @override
  void initState() {
    super.initState();
    currentDocument = widget.documentService.currentDocumentModel;
  }

  void onFilePick() async {
    if (await widget.permissionService.onRequestFilePermission()) {
      String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

      if (selectedDirectory != null) {
        currentDocument.filePath = selectedDirectory;
      }
    }
  }

  void onFileSave() async {
    debugPrint(currentDocument.fullname);
    debugPrint(currentDocument.birthday);
    debugPrint(currentDocument.filePath);
    debugPrint(currentDocument.limitedNumber.toString());
  }

  void onFileLoad() async {}

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
              "فرم ثبت اطلاعات کاربر",
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
              onChanged: (value) => currentDocument.fullname = value,
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
              onChanged: (value) => currentDocument.birthday = value,
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
              onChanged: (value) {
                if (value.isNotEmpty) {
                  currentDocument.limitedNumber = int.parse(value);
                }
              },
            ),
            const SizedBox(
              height: 12.5,
            ),
            // * Selection Path button * //
            ElevatedButton(
              onPressed: () async => onFilePick(),
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
              onPressed: () async => onFileSave(),
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
              onPressed: () async => onFileLoad(),
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
