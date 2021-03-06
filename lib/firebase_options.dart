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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZ_I3UA9B6WThHSwFkKmMC1zXea_s6-Fs',
    appId: '1:679118675463:android:aa35866e5fa4f878ae94a2',
    messagingSenderId: '679118675463',
    projectId: 'slackapp-17d8b',
    storageBucket: 'slackapp-17d8b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCgExcuoZOKQ_yoYDPs9ZLjGSBHZ5WGVck',
    appId: '1:679118675463:ios:7459886036ecaa74ae94a2',
    messagingSenderId: '679118675463',
    projectId: 'slackapp-17d8b',
    storageBucket: 'slackapp-17d8b.appspot.com',
    androidClientId: '679118675463-rauvdbkeq17pl3m1s7gnqrb4jamouio1.apps.googleusercontent.com',
    iosClientId: '679118675463-16qma5gcck36amqhcofhbmu0iccbnmpr.apps.googleusercontent.com',
    iosBundleId: 'com.mattpake.slackapp',
  );
}
