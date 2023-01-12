import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:grock/grock.dart';

class FireBaseNotificationService {
  late final FirebaseMessaging messaging;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  void settingNotification() async {
    await messaging.requestPermission(
      alert: true,
      sound: true,
      badge: true,
    );
  }

  void connectNotification() async {
    await Firebase.initializeApp();
    messaging = FirebaseMessaging.instance;
    messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
      badge: true,
    );

    settingNotification();
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      Grock.snackBar(
          title: "${event.notification!.title}",
          description: "${event.notification!.body}",
          opacity: 0.05,
          position: SnackbarPosition.top,
          leading: event.notification!.android!.imageUrl == null
              ? null
              : Image.network("${event.notification!.android!.imageUrl}",width: 40,height: 40,));
    });
  }
  Future<void> backgroundMessage(RemoteMessage message)async {
    await Firebase.initializeApp();
  }
}
