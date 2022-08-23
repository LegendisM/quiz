import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<bool> onRequestFilePermission() async {
    var status = await Permission.storage.status;

    if (status.isGranted) {
      return true;
    } else {
      var lastStatus = await Permission.storage.request();
      if (lastStatus.isGranted) {
        return true;
      } else {
        openAppSettings();
        return false;
      }
    }
  }
}
