// import 'package:firebase_messaging/firebase_messaging.dart';
//
// class Notification_Sevices {
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//
//   void requestNotificationPermission() async {
//     NotificationSettings settings = await messaging.requestPermission(
//         alert: true,
//         announcement: true,
//         badge: true,
//         carPlay: true,
//         criticalAlert: true,
//         provisional: true,
//         sound: true);
//
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//     } else if (settings.authorizationStatus ==
//         AuthorizationStatus.provisional) {
//     } else {}
//   }
//
//   void firebaseInit() {
//     FirebaseMessaging.onMessage.listen((event) {
//       //print(messaging.notification!.title.toString());
//     });
//   }
//
//   Future<String> getDeviceToken() async {
//     String? token = await messaging.getToken();
//     return token!;
//   }
//
//   void isokenRefresh() async {
//     messaging.onTokenRefresh.listen((event) {
//       event.toString();
//     });
//   }
// }
