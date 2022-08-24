import 'dart:io';
import 'package:quiz/home/utils/json_converter.dart';

class StorageService {
  String fileName = "data.txt";

  Future<File> saveFile(String path, content) async {
    File file = File("$path/$fileName");
    return file.writeAsString(getPrettyJSONString(content), flush: true);
  }

  Future<Map> loadFile(String path) async {
    File file = File("$path/$fileName");
    return convertStringToMap(await file.readAsString());
  }
}
