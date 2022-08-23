import 'dart:typed_data' show Int64List;
import 'package:quiz/home/constants/theme.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late final InitializationSettings initializationSettings;
  late final AndroidNotificationDetails androidPlatformChannelSpecifics;
  late final NotificationDetails platformChannelSpecifics;

  NotificationService() {
    initNotification();
  }

  void initNotification() async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    initializationSettings = const InitializationSettings(
      android: AndroidInitializationSettings('app_icon'),
      iOS: IOSInitializationSettings(),
      macOS: MacOSInitializationSettings(),
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    Int64List vibrationPattern = Int64List(4);
    vibrationPattern[0] = 0;
    vibrationPattern[1] = 1000;
    vibrationPattern[2] = 5000;
    vibrationPattern[3] = 2000;
    androidPlatformChannelSpecifics = AndroidNotificationDetails(
      '0',
      'main',
      channelDescription: 'main channel',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      // enableVibration: true,
      vibrationPattern: vibrationPattern,
      colorized: true,
      color: kThemeEnableIconColor,
      timeoutAfter: 5000,
    );
    platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
  }

  showNotification(String title, String content) async {
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      content,
      platformChannelSpecifics,
      payload: '',
    );
  }
}
