// import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:socialfy/app/injection_container.dart';
// import 'package:socialfy/core/notifications/notifications_handler.dart';
//
// class Notifications extends NotificationsHandler{
//
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//   Notifications({required this.flutterLocalNotificationsPlugin});
//
//   @override
//   Future<void> initialize()async {
//
//
//     var androidInitialize = const AndroidInitializationSettings('socialfy_ic');
//     var iosInitialize= const DarwinInitializationSettings(
//       defaultPresentAlert: true,
//       defaultPresentBadge: true,
//       defaultPresentSound: true,
//       requestAlertPermission: true,
//      requestBadgePermission: true,
//      requestCriticalPermission: true,
//      requestSoundPermission: true,
//     );
//      var initializationSettings= InitializationSettings(android: androidInitialize,iOS: iosInitialize);
//      flutterLocalNotificationsPlugin.initialize(initializationSettings);
//     //  await sl<FirebaseMessaging>().setForegroundNotificationPresentationOptions(
//     //    alert: true,
//     //    badge: true,
//     //     sound: true
//     //  );
//     //
//     // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     //   if(kDebugMode){
//     //     print('Got a message whilst in the foreground!');
//     //     print('Message data: ${message.data}');
//     //   }
//     //   if (message.notification != null) {
//     //     if(kDebugMode) {
//     //       print('Message also contained a notification: ${message.notification}');
//     //     }
//     //   }
//     // });
//     // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//     //   if(kDebugMode){
//     //     print('Got a message whilst in the foreground!');
//     //     print('Message data: ${message.data}');
//     //   }
//     //   if (message.notification != null) {
//     //     if(kDebugMode) {
//     //       print('Message also contained a notification: ${message.notification}');
//     //     }
//     //   }
//     // });
//   }
//
//
//
//   Future<NotificationDetails> _notificationDetails() async {
//     const AndroidNotificationDetails androidNotificationDetails =
//     AndroidNotificationDetails('channel_id', 'channel_name',
//         channelDescription: 'description',
//         importance: Importance.max,
//         priority: Priority.max,
//         playSound: true);
//     const DarwinNotificationDetails iosNotificationDetails =
//     DarwinNotificationDetails();
//     return const NotificationDetails(
//       android: androidNotificationDetails,
//       iOS: iosNotificationDetails,
//     );
//   }
//   Future<void> showNotification({
//     required int id,
//     required String title,
//     required String body,
//   }) async {
//     final details = await _notificationDetails();
//     await flutterLocalNotificationsPlugin.show(id, title, body, details);
//   }
//   Future<void> showNotificationWithPayload(
//       {required int id,
//         required String title,
//         required String body,
//         required String payload}) async {
//     final details = await _notificationDetails();
//     await flutterLocalNotificationsPlugin.show(id, title, body, details,
//         payload: payload);
//   }
//   void onDidReceiveLocalNotification(
//       int id, String? title, String? body, String? payload) {
//     if(kDebugMode){
//       print('id $id');
//     }
//   }
// }