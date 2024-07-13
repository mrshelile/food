// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCFU5H7P6U1JYFVbxj6j9FClKFC5lv38hw',
    appId: '1:95905321067:web:9ee8b6eb63bdd0acabe12e',
    messagingSenderId: '95905321067',
    projectId: 'foods-a6a4f',
    authDomain: 'foods-a6a4f.firebaseapp.com',
    storageBucket: 'foods-a6a4f.appspot.com',
    measurementId: 'G-PBC9DWK04Y',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAz1jbI_-VztGivATc6k3Abr222homQKkM',
    appId: '1:95905321067:android:e01a9f8ff3f1ee0babe12e',
    messagingSenderId: '95905321067',
    projectId: 'foods-a6a4f',
    storageBucket: 'foods-a6a4f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDmfruEJqR5DXLRMZe8H2XbLULdupydRjA',
    appId: '1:95905321067:ios:1405a7a01f258775abe12e',
    messagingSenderId: '95905321067',
    projectId: 'foods-a6a4f',
    storageBucket: 'foods-a6a4f.appspot.com',
    iosBundleId: 'com.example.foods',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDmfruEJqR5DXLRMZe8H2XbLULdupydRjA',
    appId: '1:95905321067:ios:1405a7a01f258775abe12e',
    messagingSenderId: '95905321067',
    projectId: 'foods-a6a4f',
    storageBucket: 'foods-a6a4f.appspot.com',
    iosBundleId: 'com.example.foods',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCFU5H7P6U1JYFVbxj6j9FClKFC5lv38hw',
    appId: '1:95905321067:web:5f608fa7ed367842abe12e',
    messagingSenderId: '95905321067',
    projectId: 'foods-a6a4f',
    authDomain: 'foods-a6a4f.firebaseapp.com',
    storageBucket: 'foods-a6a4f.appspot.com',
    measurementId: 'G-BNG37XK8GK',
  );
}
