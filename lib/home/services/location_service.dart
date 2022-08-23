import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart'
    show openAppSettings;

class LocationService {
  Future<List<String>> getLocation() async {
    //* Check GPS Option Activeted
    bool servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      LocationPermission permission = await Geolocator.checkPermission();
      //* Check GPS Permission
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.deniedForever) {
          openAppSettings();
          return ["اجازه استفاده از موقعیت مکانی اجباری می باشد."];
        }
      }
      //* Get Current GPS Position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.lowest,
        forceAndroidLocationManager: true,
      );
      return [position.longitude.toString(), position.latitude.toString()];
    } else {
      return ["لطفا قابلیت موقعیت مکانی تلفن همراه خود را فعال کنید"];
    }
  }
}
