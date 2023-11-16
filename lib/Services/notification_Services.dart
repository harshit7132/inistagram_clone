import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   void initLocalNotiication(BuildContext context, RemoteMessage message) async {
//     var androidinitilize = AndroidInitializationSettings('@mipmap/ic_launcher');
//
//     var initilization = InitializationSettings(android: androidinitilize);
//
//     await flutterLocalNotificationsPlugin.initialize(
//       initilization,
//       onDidReceiveBackgroundNotificationResponse: (payload) {
//         handleMessage(context, message);
//       },
//     );
//   }
//
//   void firebaseInit(BuildContext context, RemoteMessage message) {
//     FirebaseMessaging.onMessage.listen((event) {
//       print(event.notification!.title.toString());
//       print(event.notification!.body.toString());
//       initLocalNotiication(context, message);
//       showNotification(event);
//     });
//   }
//
//   Future<void> showNotification(RemoteMessage message) async {
//     AndroidNotificationChannel channel = AndroidNotificationChannel(
//         Random.secure().nextInt(10000).toString(),
//         'Hign Importante Notification');
//     AndroidNotificationDetails androidNotificationDetails =
//         AndroidNotificationDetails(
//             channel.id.toString(), channel.name.toString(),
//             channelDescription: 'your channel description',
//             importance: Importance.high,
//             priority: Priority.high,
//             ticker: 'ticker');
//
//     DarwinNotificationDetails darwinNotificationDetails =
//         DarwinNotificationDetails(
//       presentAlert: true,
//       presentBadge: true,
//       presentSound: true,
//     );
//
//     NotificationDetails notificationDetails =
//         NotificationDetails(android: androidNotificationDetails);
//
//     Future.delayed(
//       Duration.zero,
//       () {
//         flutterLocalNotificationsPlugin.show(
//             0,
//             message.notification!.title.toString(),
//             message.notification!.body.toString(),
//             notificationDetails);
//       },
//     );
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
//
//   void handleMessage(BuildContext context, RemoteMessage message) {}
// }

// class InApp_notification {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   final AndroidInitializationSettings androidInitializationSettings =
//       AndroidInitializationSettings('two');
//
//   void initNotify() async {
//     InitializationSettings initializationSettings =
//         InitializationSettings(android: androidInitializationSettings);
//     flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }
//
//   void sendNotify() async {
//     AndroidNotificationDetails androidNotificationDetails =
//         AndroidNotificationDetails('channelId', 'channelName',
//             importance: Importance.max, priority: Priority.max);
//     NotificationDetails notificationDetails =
//         NotificationDetails(android: androidNotificationDetails);
//
//     await flutterLocalNotificationsPlugin.show(
//         1, 'this is title', 'this is body', notificationDetails);
//   }
// }

//first method
class Notification_Services {
  var mNotificationManager = FlutterLocalNotificationsPlugin();

  var androidNotificationDetails = const AndroidNotificationDetails(
      'test', 'channelName',
      autoCancel: true,
      importance: Importance.max,
      priority: Priority.max,
      ongoing: true,
      largeIcon: DrawableResourceAndroidBitmap('app_icon'));

  void initilize(onNotificationTap) {
    var androidInitSetting = AndroidInitializationSettings('app_icon');

    var initSetting = InitializationSettings(android: androidInitSetting);

    mNotificationManager.initialize(initSetting,
        onDidReceiveNotificationResponse: onNotificationTap);
    mNotificationManager
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestNotificationsPermission();
  }

  sendNotification(
      {int id = 100, required String title, required String body}) {
    var notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    mNotificationManager.show(id, title, body, notificationDetails);
  }
}

//second method
Future<void> handleBackgroundMessage(RemoteMessage? message) async {
  print('title:${message?.notification!.title}');
  print('title:${message?.notification!.body}');
  print('title:${message?.data}');
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    print(fcmToken);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}
