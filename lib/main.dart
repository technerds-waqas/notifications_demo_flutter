import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';
// FlutterFire's Firebase Cloud Messaging plugin
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:rxdart/rxdart.dart';
import 'homePage.dart';

// TODO: Add stream controller
// used to pass messages from event handler to the UI
final messageStreamController = BehaviorSubject<RemoteMessage>();

// TODO: Define the background message handler

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  if (kDebugMode) {
    log("Handling a background message: ${message.messageId}");
    log('Message data: ${message.data}');
    log('Message notification: ${message.notification?.title}');
    log('Message notification: ${message.notification?.body}');
  }
}

// Local notifcation plugin object
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

// Android notification channel from local notification plugin

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description: 'This channel is used for important notifications.',
    // description
    importance: Importance.max,
    playSound: true);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // TODO: Request permission
  final messaging = FirebaseMessaging.instance;

  final settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (kDebugMode) {
    log('Permission granted: ${settings.authorizationStatus}');
  }
  // TODO: Register with FCM

  // It requests a registration token for sending messages to users from your App server or other trusted server environment.
  String? token = await messaging.getToken();

  if (kDebugMode) {
    log('Registration Token=$token');
  }

  // from local notification plugin
  await messaging.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);

  // TODO: Set up foreground message handler

  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   if (kDebugMode) {
  //     print('Handling a foreground message: ${message.messageId}');
  //     print('Message data: ${message.data}');
  //     print('Message notification: ${message.notification?.title}');
  //     print('Message notification: ${message.notification?.body}');
  //   }

  //   messageStreamController.sink.add(message);
  // });

  //replaced by another code for handling foreground notification display
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    log('Got a message whilst in the foreground!');
    log('Message data: ${message.data}');
    messageStreamController.sink.add(message);
    // if (message.notification != null) {
    //   print('Message also contained a notification: ${message.notification}');
    // }
    // If `onMessage` is triggered with a notification, construct our own
    // local notification to show to users using the created channel.
    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            playSound: true,
            color: Colors.blue,
            icon: '@mipmap/launcher_icon',

            // other properties...
          ),
        ),
      );
    }
  });

  // from local notification plugin
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  // TODO: Set up background message handler
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: const HomePage(),
    );
  }
}
