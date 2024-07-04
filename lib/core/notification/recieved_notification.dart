import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
class NotificationHelper {
  static final FlutterLocalNotificationsPlugin _plugin = FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    var initializationSettingsAndroid = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings = InitializationSettings(android: initializationSettingsAndroid,);
    await _plugin.initialize(initializationSettings);
    await _plugin.resolvePlatformSpecificImplementation< AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
  }

  static Future<void> showNotification(int id,String title, String body,) async {
    var notificationDetails = const NotificationDetails(
        android: AndroidNotificationDetails(
            'channel_id', 'channel_name',
            importance: Importance.max, priority: Priority.high),
      );
// Assuming you have a desired DateTime object (e.g., scheduledTime)
    // Optional: Use user's location

    await _plugin.show(id, title, body, notificationDetails);
  }
  static Future<void> showScheduledNotification(int id,String title, String body,DateTime scheduledTime,) async {
    var notificationDetails =  const NotificationDetails(
        android: AndroidNotificationDetails(
            'id_1', 'scheduled notification',
            importance: Importance.max, priority: Priority.high),
      );
// Assuming you have a desired DateTime object (e.g., scheduledTime)
    // Optional: Use user's location
    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation( currentTimeZone));
    log(tz.local.toString());
    log(scheduledTime.timeZoneName);
    log(tz.local.currentTimeZone.toString());
    log(tz.TZDateTime.now(tz.local).hour.toString());
  //  var scheduledDateTime = tz.TZDateTime.from(scheduledTime, tz.getLocation(scheduledTime.timeZoneName));
    // Use local time zone if no user location
    await _plugin.zonedSchedule(id, title, body,tz.TZDateTime(tz.local, scheduledTime.year,scheduledTime.month,scheduledTime.day,scheduledTime.hour,scheduledTime.minute) ,notificationDetails, uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.wallClockTime, androidScheduleMode: AndroidScheduleMode.alarmClock);
  }
}
