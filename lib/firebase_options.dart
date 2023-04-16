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
    apiKey: 'AIzaSyDOpV-P4024u6rhQprbJqeBFi3z_JPSCN0',
    appId: '1:828079920761:web:995575a3bddde2d016e6a8',
    messagingSenderId: '828079920761',
    projectId: 'chess-5e3b4',
    authDomain: 'chess-5e3b4.firebaseapp.com',
    storageBucket: 'chess-5e3b4.appspot.com',
    measurementId: 'G-CXSGSKYYRT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDu6bdLk6z-cx5MCrITyev3x7_DRTOXpsM',
    appId: '1:828079920761:android:e729abaf91a1f58316e6a8',
    messagingSenderId: '828079920761',
    projectId: 'chess-5e3b4',
    storageBucket: 'chess-5e3b4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDzSkN06w_7Z4hSLRP6xzKjdMnbSWitgIk',
    appId: '1:828079920761:ios:b4d03000a6d76b1d16e6a8',
    messagingSenderId: '828079920761',
    projectId: 'chess-5e3b4',
    storageBucket: 'chess-5e3b4.appspot.com',
    iosClientId:
        '828079920761-a3t8r3mq6ofq7eupa5qij08vokbiaifr.apps.googleusercontent.com',
    iosBundleId: 'com.example.mychess',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDzSkN06w_7Z4hSLRP6xzKjdMnbSWitgIk',
    appId: '1:828079920761:ios:b4d03000a6d76b1d16e6a8',
    messagingSenderId: '828079920761',
    projectId: 'chess-5e3b4',
    storageBucket: 'chess-5e3b4.appspot.com',
    iosClientId:
        '828079920761-a3t8r3mq6ofq7eupa5qij08vokbiaifr.apps.googleusercontent.com',
    iosBundleId: 'com.example.mychess',
  );
}
