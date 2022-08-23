import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:quiz/home/constants/theme_form.dart';
import 'package:quiz/home/models/document_model.dart';
import 'package:quiz/home/services/document_service.dart';
import 'package:quiz/home/services/notification_service.dart';
import 'package:quiz/home/services/permission_service.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class FormScreen extends StatefulWidget {
  const FormScreen(
      {super.key,
      required this.documentService,
      required this.permissionService,
      required this.notificationService});

  final DocumentService documentService;
  final PermissionService permissionService;
  final NotificationService notificationService;

  @override
  State<FormScreen> createState() => FormState();
}

class FormState extends State<FormScreen> {
  late DocumentModel currentDocument;
  late TextEditingController dateFieldController;
  late TextEditingController limitedNumFieldController;
  late bool inSaveProgress = false;

  @override
  void initState() {
    super.initState();
    currentDocument = widget.documentService.currentDocumentModel;
    dateFieldController = TextEditingController();
    limitedNumFieldController = TextEditingController();
  }

  void onFilePick() async {
    if (await widget.permissionService.onRequestFilePermission()) {
      String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

      if (selectedDirectory != null) {
        currentDocument.filePath = selectedDirectory;
      }
    }
  }

  void onFileLoad() async {}

  void onFileSave() async {
    if (inSaveProgress) return;
    setState(() {
      inSaveProgress = true;
    });
    String result = await widget.documentService.create();
    widget.notificationService.showNotification(" توجه !", result);
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        inSaveProgress = false;
      });
    });
  }

  void onLimitedNumberChanged(String value) {
    if (value.isNotEmpty) {
      int result = int.parse(value);
      if (result > 10) {
        result = 10;
      } else if (result < 1) {
        result = 1;
      }
      currentDocument.limitedNumber = result;
      limitedNumFieldController.text = result.toString();
      limitedNumFieldController.selection = TextSelection.collapsed(
        offset: limitedNumFieldController.text.length,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Jalali tempPickedDate = Jalali.now();
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
              controller: dateFieldController,
              textAlign: TextAlign.left,
              textDirection: TextDirection.ltr,
              keyboardType: TextInputType.datetime,
              decoration: kTextFieldDateDecoration,
              style: kThemeFieldInputStyle,
              onTap: () async {
                var picked = await showPersianDatePicker(
                  context: context,
                  initialDate: tempPickedDate,
                  firstDate: Jalali(1300, 8),
                  lastDate: Jalali(1500, 9),
                );
                if (picked != null) {
                  var formattedDate = picked.formatCompactDate();
                  tempPickedDate = picked;
                  currentDocument.birthday = formattedDate;
                  dateFieldController.text = formattedDate;
                }
              },
              readOnly: true,
            ),
            const SizedBox(
              height: 12.5,
            ),
            TextFormField(
              controller: limitedNumFieldController,
              textAlign: TextAlign.left,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: kTextFieldNumberDecoration,
              style: kThemeFieldInputStyle,
              onChanged: onLimitedNumberChanged,
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
              style: (!inSaveProgress ? kButtonGreenStyle : kButtonYelloStyle),
              onPressed: () async => onFileSave(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text((!inSaveProgress
                      ? "ذخیره"
                      : "در حال اتصال برای دریافت موقعیت مکانی ...")),
                  const SizedBox(
                    width: 8,
                  ),
                  Icon(
                    (!inSaveProgress
                        ? Icons.save_as_outlined
                        : Icons.network_wifi),
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
