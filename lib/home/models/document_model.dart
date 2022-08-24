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
  late int age = 0;

  late String longitude;
  late String latitude;
  late String direction;

  late String shamsiTime;
  late String miladiTime;

  bool validator() {
    if (fullname == null ||
        birthday == null ||
        filePath == null ||
        limitedNumber == null) {
      return false;
    }
    return true;
  }

  fromJson(content) {
    fullname = content["fullname"];
    age = int.parse(content["age"]);
    shamsiTime = content["time"]["shamsi"];
    miladiTime = content["time"]["miladi"];
    longitude = content["location"]["longitude"];
    latitude = content["location"]["latitude"];
    direction = content["location"]["direction"];
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
