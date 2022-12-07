// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBmsDEgGvx7-k73Bw-yRbiEdGeHDmqwaSU',
    appId: '1:390331963451:web:c302c759d72c624e4b641e',
    messagingSenderId: '390331963451',
    projectId: 'notifications-demo-d9e6c',
    authDomain: 'notifications-demo-d9e6c.firebaseapp.com',
    storageBucket: 'notifications-demo-d9e6c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDDbPbCUj4QY2WboaW6KLPr0YBJ4Up8aSg',
    appId: '1:390331963451:android:f9d08e374489e7dc4b641e',
    messagingSenderId: '390331963451',
    projectId: 'notifications-demo-d9e6c',
    storageBucket: 'notifications-demo-d9e6c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAwaHWxjokZh8aIlp3yn1xm9tMLaC3GsdE',
    appId: '1:390331963451:ios:41159d6ff583d8774b641e',
    messagingSenderId: '390331963451',
    projectId: 'notifications-demo-d9e6c',
    storageBucket: 'notifications-demo-d9e6c.appspot.com',
    iosClientId: '390331963451-2b3hm52rj1m48sdmlojlem21pq7fh9pn.apps.googleusercontent.com',
    iosBundleId: 'com.example.notificationsDemoFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAwaHWxjokZh8aIlp3yn1xm9tMLaC3GsdE',
    appId: '1:390331963451:ios:41159d6ff583d8774b641e',
    messagingSenderId: '390331963451',
    projectId: 'notifications-demo-d9e6c',
    storageBucket: 'notifications-demo-d9e6c.appspot.com',
    iosClientId: '390331963451-2b3hm52rj1m48sdmlojlem21pq7fh9pn.apps.googleusercontent.com',
    iosBundleId: 'com.example.notificationsDemoFlutter',
  );
}