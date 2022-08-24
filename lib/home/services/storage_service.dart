import 'dart:io';

class StorageService {
  String fileName = "test.txt";
  Future<File> saveFile(String path, Map<String, dynamic> content) async {
    File file = File("$path/$fileName");
    return file.writeAsString(content.toString(), flush: true);
  }
}
