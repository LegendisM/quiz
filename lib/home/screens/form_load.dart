import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:quiz/home/constants/theme_form.dart';
import 'package:quiz/home/models/document_model.dart';
import 'package:quiz/home/services/document_service.dart';
import 'package:quiz/home/services/notification_service.dart';
import 'package:quiz/home/services/permission_service.dart';
import 'package:quiz/home/widgets/form_data.dart';

class FormLoadScreen extends StatefulWidget {
  const FormLoadScreen(
      {super.key,
      required this.documentService,
      required this.permissionService,
      required this.notificationService});

  final DocumentService documentService;
  final PermissionService permissionService;
  final NotificationService notificationService;

  @override
  State<FormLoadScreen> createState() => FormLoadState();
}

class FormLoadState extends State<FormLoadScreen> {
  late DocumentModel currentDocument;
  late bool doucmentReady = false;

  @override
  void initState() {
    super.initState();
    currentDocument = widget.documentService.secondaryDocumentModel;
  }

  void onFilePick() async {
    if (await widget.permissionService.onRequestFilePermission()) {
      String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

      if (selectedDirectory != null) {
        currentDocument.filePath = selectedDirectory;
        String result = await widget.documentService.load();
        widget.notificationService.showNotification(" اطلاع رسانی", result);
        setState(() {
          doucmentReady = true;
        });
      }
    }
  }

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
              "فرم مشاهده اطلاعات کاربر",
              textAlign: TextAlign.center,
              style: kThemeFormTitleStyle,
            ),
            const Divider(
              height: 30,
            ),
            doucmentReady
                ? FormData(
                    document: currentDocument,
                  )
                : const SizedBox.shrink(),
            const SizedBox(
              height: 6.5,
            ),
            // * Selection Other File by Path button * //
            ElevatedButton(
              style: kButtonOrangeStyle,
              onPressed: () async => onFilePick(),
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
