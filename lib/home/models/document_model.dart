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
  late String direction;

  bool validator() {
    if (fullname == null ||
        birthday == null ||
        filePath == null ||
        limitedNumber == null) {
      return false;
    }
    return true;
  }

  getExport() {
    return {
      'fullname': fullname,
      'age': calculateAge(birthday!).toString(),
      'time': calculateNowTimes(),
      'location': {
        'longitude': longitude.toString(),
        'latitude': latitude.toString(),
        'direction': direction.toString(),
      },
      'masters': config.masters,
      'multiplication': calculateMultiplication(limitedNumber!)
    };
  }
}
