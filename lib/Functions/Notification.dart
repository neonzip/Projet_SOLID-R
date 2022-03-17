import 'dart:typed_data';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';


void sendNotification({String? title, String? body}) async {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  //Set the settings for differents platforms
  // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/ic_launcher');
  const IOSInitializationSettings initializationSettingsIOS =
  IOSInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );
  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );

  ///
  final Int64List vibrationPattern = Int64List(4);
  vibrationPattern[0] = 0;
  vibrationPattern[1] = 0;
  vibrationPattern[2] = 0;
  vibrationPattern[3] = 0;

  AndroidNotificationChannel channel = AndroidNotificationChannel(
    "Activity channel",
    "Activity",
    description: "this channel is use for important notification",
    playSound: false,
    enableVibration: false,
    vibrationPattern: vibrationPattern,
    importance: Importance.max,
  );

  var scheduledTime = DateTime.now().add(const Duration(seconds: 1));
  flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      NotificationDetails(
          android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description
          )
      )
  );

}