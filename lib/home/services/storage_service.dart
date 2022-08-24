import 'dart:io';
import 'package:quiz/home/utils/json_converter.dart';

class StorageService {
  String fileName = "test.txt";

  Future<File> saveFile(String path, content) async {
    File file = File("$path/$fileName");
    return file.writeAsString(getPrettyJSONString(content), flush: true);
  }
}
