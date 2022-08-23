import 'package:quiz/home/config/config.dart' as config show masters;
import 'package:quiz/home/utils/multiplication.dart';
import 'package:quiz/home/utils/date_util.dart';

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

  late String longitude;
  late String latitude;

  bool validator() {
    if (fullname == null ||
        birthday == null ||
        filePath == null ||
        limitedNumber == null) {
      return false;
    }
    return true;
  }

  Map<String, dynamic> getExport() {
    return {
      'fullname': fullname,
      'age': calculateAge(birthday!),
      'time': calculateNowTimes(),
      'location': {
        'longitude': longitude,
        'latitude': latitude,
      },
      'masters': config.masters,
      'multiplication': calculateMultiplication(limitedNumber!),
    };
  }
}
