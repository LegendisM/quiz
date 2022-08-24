import 'package:permission_handler/permission_handler.dart';
import 'package:quiz/home/services/notification_service.dart';

class PermissionService {
  NotificationService notificationService = NotificationService();

  Future<bool> onRequestFilePermission() async {
    var status = await Permission.manageExternalStorage.status;
    var statusStorage = await Permission.storage.status;

    if (status.isGranted &&
        statusStorage.isDenied == false &&
        statusStorage.isPermanentlyDenied == false) {
      return true;
    } else {
      var lastStatus = await Permission.manageExternalStorage.request();
      var lastStatusStorage = await Permission.storage.request();
      if (lastStatus.isGranted &&
          lastStatusStorage.isDenied == false &&
          lastStatusStorage.isPermanentlyDenied == false) {
        return true;
      }
      openAppSettingsOption();
      return false;
    }
  }

  void openAppSettingsOption() {
    openAppSettings();
    notificationService.showNotification(
      "توجه !",
      "لطفا دسترسی به فضا ذخیره سازی را مجاز کنید.",
    );
  }
}
