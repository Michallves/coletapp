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
    apiKey: 'AIzaSyCyq5FIgzOey1K5GbMKpQbJku7eAXlbmR4',
    appId: '1:571712219416:web:acdb65b70552ac1292566d',
    messagingSenderId: '571712219416',
    projectId: 'appbank-darm',
    authDomain: 'appbank-darm.firebaseapp.com',
    databaseURL: 'https://appbank-darm-default-rtdb.firebaseio.com',
    storageBucket: 'appbank-darm.appspot.com',
    measurementId: 'G-D5F7J809TV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBn7gSYZpCZTSLhXclLJXRDVBt-JpJq234',
    appId: '1:571712219416:android:5f6c9c18ea991e2892566d',
    messagingSenderId: '571712219416',
    projectId: 'appbank-darm',
    databaseURL: 'https://appbank-darm-default-rtdb.firebaseio.com',
    storageBucket: 'appbank-darm.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDn1HM19XEihQ6kvDbGuYorVKXtM28Umcc',
    appId: '1:571712219416:ios:1f54e829faa9fdd792566d',
    messagingSenderId: '571712219416',
    projectId: 'appbank-darm',
    databaseURL: 'https://appbank-darm-default-rtdb.firebaseio.com',
    storageBucket: 'appbank-darm.appspot.com',
    iosClientId: '571712219416-f3ofmspn9g57kotlh9re462og418p56u.apps.googleusercontent.com',
    iosBundleId: 'com.example.coletapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDn1HM19XEihQ6kvDbGuYorVKXtM28Umcc',
    appId: '1:571712219416:ios:1f54e829faa9fdd792566d',
    messagingSenderId: '571712219416',
    projectId: 'appbank-darm',
    databaseURL: 'https://appbank-darm-default-rtdb.firebaseio.com',
    storageBucket: 'appbank-darm.appspot.com',
    iosClientId: '571712219416-f3ofmspn9g57kotlh9re462og418p56u.apps.googleusercontent.com',
    iosBundleId: 'com.example.coletapp',
  );
}