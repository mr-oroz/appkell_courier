import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//Recieve message when app is in bg.
Future<void> _backgroundMessageHandler(RemoteMessage message) async {
  RemoteNotification? notification = message.notification;
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  print(
    'newBackgroundNotification(${notification?.title}, ${notification?.body})',
  );

  _flutterLocalNotificationsPlugin.show(
    notification.hashCode,
    notification?.title,
    notification?.body,
    const NotificationDetails(
      android: AndroidNotificationDetails(
        'channelId',
        'Уведомления',
      ),
    ),
  );
}

class PushNotificationsManager {
  PushNotificationsManager._();

  factory PushNotificationsManager() => _instance;

  static final PushNotificationsManager _instance =
      PushNotificationsManager._();

  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;

  static Function(Map<String, dynamic>)? onOrderAcceptedMessage;

  bool _initialized = false;
  String? _token;

  Future<String?> init() async {
    if (!_initialized) {
      // Set the background messaging handler early on, as a named top-level function
      await FlutterLocalNotificationsPlugin().cancelAll();
      FirebaseMessaging.onBackgroundMessage(_backgroundMessageHandler);

      await _firebaseMessaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

      if (!kIsWeb) {
        const android = AndroidInitializationSettings('drawable/app_logo');
        final iOS = DarwinInitializationSettings(
          onDidReceiveLocalNotification: (_, __, _____, ___) {
            print('on did receive local notification $_ $__ $___ $_____');
          },
        );
        final platform = InitializationSettings(android: android, iOS: iOS);

        await _flutterLocalNotificationsPlugin.initialize(platform);

        await _firebaseMessaging.requestPermission(
          sound: true,
          alert: true,
          badge: true,
          provisional: false,
        );
      }

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        RemoteNotification? notification = message.notification;
        if (notification != null && !kIsWeb) {
          _flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            const NotificationDetails(
              android: AndroidNotificationDetails(
                'channelId',
                'Уведомления',
              ),
              iOS: DarwinNotificationDetails(
                presentAlert: true,
                presentBadge: true,
                presentSound: true,
              ),
            ),
          );
          FirebaseMessaging.instance
              .setForegroundNotificationPresentationOptions(
            alert: true,
            badge: true,
            sound: true,
          );
        }
      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        print('onNotificationOpen');
      });

      _token = await _firebaseMessaging.getToken();
      // _firebaseMessaging.onTokenRefresh.listen((newToken) {
      //   _token = newToken;
      // });

      _initialized = true;
    }

    return _token;
  }

  String? getToken() {
    return _token;
  }

  Future<bool> didNotificationLaunchApp() async {
    final notificationLaunchDetails = await FlutterLocalNotificationsPlugin()
        .getNotificationAppLaunchDetails();

    return notificationLaunchDetails?.didNotificationLaunchApp ?? false;
  }

  Future<void> disableNotifications() {
    return FirebaseMessaging.instance.deleteToken();
  }

  Future<void> enableNotifications() async {
    _token = await _firebaseMessaging.getToken();
  }

  Future<void> sendPushMessage() async {
    if (_token == null) {
      print('Unable to send FCM message, no token exists.');
      return;
    }

    try {
      final response = await Dio().post(
        'https://fcm.googleapis.com/fcm/send',
        data: constructFCMPayload(_token),
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'key=AAAA-gtdLKY:APA91bFki5mUREYD83yPlOptMpNIF_c5qthh'
                'LEhsPGJ0P5EpUqR4GjpcFfKW8_bbNjFq68mV5hu2bCugVvnKMlzGXyW6_lhg_hXMpAu5'
                'fN97j49_GcbNJ26Z4LS3_8E5HB9anT6BbLMm'
          },
        ),
      );
      print('send Test message $response');
    } on DioException catch (e) {
      print(e);
    }
  }

  /// The API endpoint here accepts a raw FCM payload for demonstration purposes.
  String constructFCMPayload(String? token) {
    return jsonEncode({
      'registration_ids': [token],
      // 'to': '/topics/allDevices',
      'notification': {
        'title': 'Test',
        'body': 'This is test notification',
      },
    });
  }
}
