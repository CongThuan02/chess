import 'dart:async';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description: 'This channel is used for important notifications.', // description
  importance: Importance.max,
);

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
const DarwinInitializationSettings initializationSettingsDarwin =
    DarwinInitializationSettings(onDidReceiveLocalNotification: onDidReceiveLocalNotification);

const InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsDarwin, macOS: initializationSettingsDarwin);

Future onDidReceiveLocalNotification(int? id, String? title, String? body, String? payload) async {}

class FireMessage {
  @pragma('vm:entry-point')
  static Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    // handleData(message);
  }

  static void registerFirebase() async {
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
    FirebaseMessaging.onBackgroundMessage(FireMessage.firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen((message) {
      handleDataInApp(message);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      handleData(message);
    });
    checkOpenAppFromTerminate();
  }

  static Future selectNotification(String? payload) async {
    if (payload != null) {}
  }

  static Future<void> registerToken() async {
    try {
      if (Platform.isIOS) {
        await FirebaseMessaging.instance.requestPermission(provisional: true);
        // await FirebaseMessaging.instance.getAPNSToken().then((token) async {
        //   print("token firebase $token");
        //   authenticationRepository.updateTokenFirebase(token);
        // });
      } else {}
      await FirebaseMessaging.instance.getToken().then((token) async {
      });
    // ignore: empty_catches
    } catch (e) {
    }
  }

  static void removeToken(String? id) async {
    await FirebaseMessaging.instance.getToken().then((value) async {});
  }

  static void checkOpenAppFromTerminate() async {
    var initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      Future.delayed(const Duration(seconds: 4)).then((value) {
        handleData(initialMessage);
        return;
      });
    }
  }

  static void onDidReceiveNotificationResponse(NotificationResponse details) {
  }

  static void notificationTapBackground(NotificationResponse details) {
  }

  static void handleData(
    RemoteMessage message,
  ) {
  }

  static void handleDataInApp(RemoteMessage message) async {
  }
}

enum TypeNotification { startLiveStream, sendMessagePrivate, none }

extension StringToTypeNotification on String {
  TypeNotification toTypeNotification() {
    switch (this) {
      case "start_live_stream":
        return TypeNotification.startLiveStream;
      case "send_message_private":
        return TypeNotification.sendMessagePrivate;
      default:
        return TypeNotification.none;
    }
  }
}
