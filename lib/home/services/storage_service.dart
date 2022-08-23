import 'dart:io';

class StorageService {
  Future<File> saveFile(String path, Map<String, dynamic> content) async {
    File file = File(path + "/test.txt");
    //! TA INJA => Error
    //! Unhandled Exception: FileSystemException: Cannot open file, path = '/storage/emulated/0/Test' (OS Error: Is a directory, errno = 21)
    return file.writeAsString(content.toString(), flush: true);
  }
}
