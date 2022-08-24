import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<bool> onRequestFilePermission() async {
    var status = await Permission.manageExternalStorage.status;

    if (status.isGranted) {
      return true;
    } else {
      var lastStatus = await Permission.manageExternalStorage.request();
      if (lastStatus.isGranted) {
        return true;
      } else {
        openAppSettings();
        return false;
      }
    }
  }
}
