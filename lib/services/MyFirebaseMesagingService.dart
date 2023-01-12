// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'dart:async';
//
//
// class LocalNotification {
//   static final FlutterLocalNotificationsPlugin _notiPlugin =FlutterLocalNotificationsPlugin();
//
//
//   static void initialize(){
//     final InitializationSettings initalSettings = InitializationSettings(
//       android: AndroidInitializationSettings(
//         '@mipmap/ic_launcher'
//       )
//     );
//     _notiPlugin.initialize(
//       initalSettings,onDidReceiveBackgroundNotificationResponse: (NotificationResponse details){
//         print('onDidReceiveBackgroundNotificationResponse Function');
//         print(details.payload);
//         print(details.payload !=null);
//         });
//
//   }
//   static void showNotification(RemoteMessage message){
//     final NotificationDetails notiDetails = NotificationDetails(
//       android:AndroidNotificationDetails(
//         'com.example.term_project',
//         'push_notification',
//         importance: Importance.max,
//         priority: Priority.high,
//         icon: '@mipmap/ic_launcher',
//
//       ),
//     );_notiPlugin.show(DateTime.now().microsecond, message.notification!.title
//         ,message.notification!.body , notiDetails,payload: message.data.toString(),);
//
//   }
// }
