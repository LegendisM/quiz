import 'package:flutter/cupertino.dart';
import 'package:sensors_plus/sensors_plus.dart';

class GyroscopeService {
  String direction = "forward";

  GyroscopeService() {
    gyroscopeEvents.listen((GyroscopeEvent event) {
      double x = event.x;
      double y = event.y;

      if (x > 0) {
        direction = "back";
      } else if (x < 0) {
        direction = "forward";
      } else if (y > 0) {
        direction = "left";
      } else if (y < 0) {
        direction = "right";
      }
    });
  }
}
