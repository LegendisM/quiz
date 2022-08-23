import 'package:quiz/home/utils/date_converter.dart';

int calculateAge(String targetDate) {
  //* Convert Solar To Ad
  List<int> formattedDate = (targetDate.split("/").map(
        (e) => int.parse(e),
      )).toList();
  List<dynamic> convertedDate = jalaliToGregorian(
    formattedDate[0],
    formattedDate[1],
    formattedDate[2],
  );
  DateTime targetDateResult = DateTime(
    convertedDate[0],
    convertedDate[1],
    convertedDate[2],
  );
  //* Calculate Age By Ad Date
  int result = DateTime.now().year - targetDateResult.year;
  return result;
}

Map<String, String> calculateNowTimes() {
  DateTime mainDateTime = DateTime.now();
  String time = mainDateTime.toString().split(" ")[1].split(".")[0];
  String solarDateTime =
      gregorianToJalali(mainDateTime.year, mainDateTime.month, mainDateTime.day)
          .toString()
          .replaceAll(", ", "/")
          .replaceAll("[", '')
          .replaceAll("]", '');
  return {
    'solar': "$solarDateTime $time",
    'ad': mainDateTime.toString(),
  };
}
