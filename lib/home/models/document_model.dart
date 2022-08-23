import 'package:quiz/home/config/config.dart' as config show masters;

class DocumentModel {
  DocumentModel({
    this.fullname,
    this.birthday,
    this.limitedNumber,
    this.filePath,
  });

  late String? fullname = "";
  late String? birthday = "";
  late String? filePath = "";
  late int? limitedNumber = 1;

  late Object masters = config.masters;
  late int age;

  DateTime solarNowDateTime = DateTime.now();
  DateTime adNowDateTime = DateTime.now();

  String getDocumentAsString() {
    return "test\nhhello";
  }
}
