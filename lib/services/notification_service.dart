import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;
class NotificationService{
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> initializeNotification()async{
    const AndroidInitializationSettings initializationSettingsAndorid = AndroidInitializationSettings('@mipmap/ic_launcher');
    const IOSInitializationSettings initializationSettingsIOS= IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false
    );
    const InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndorid,
        iOS: initializationSettingsIOS
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }
  Future<void> showNotification(int id,String title,String body)async{
    var dateTime = DateTime.now().add(Duration(seconds: 3));
    tz.initializeTimeZones();
    await flutterLocalNotificationsPlugin.zonedSchedule(id, title, body,

        tz.TZDateTime.from(dateTime, tz.local),NotificationDetails(
          android: AndroidNotificationDetails(
            id.toString(),
            'Go to bed',
            importance: Importance.max,
            priority: Priority.max,
            icon:'@mipmap/ic_launcher'
          ),
          iOS: IOSNotificationDetails(
            sound: 'default.wav',
            presentSound: true,
             presentBadge: true,
            presentAlert: true,
          )
        ),
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
        matchDateTimeComponents: DateTimeComponents.time
    );
  }



}