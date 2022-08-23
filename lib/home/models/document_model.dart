import 'package:quiz/home/config/config.dart' as config show masters;
import 'package:quiz/home/utils/multiplication.dart';
// import 'package:quiz/home/utils/date_converter.dart';

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

  int calculateAge() {
    //! soon
    return 1;
  }

  Map<String, String> calculateTimes() {
    //! soon
    return {
      'solar': "solarNowDateTime",
      'ad': "adNowDateTime",
    };
  }

  Map getExport() {
    return {
      'fullname': fullname,
      'age': calculateAge(),
      'time': calculateTimes(),
      'location': {
        'longitude': longitude,
        'latitude': latitude,
      },
      'masters': config.masters,
      //! soon
      'multiplication': calculateMultiplication(limitedNumber!),
    };
  }
}
