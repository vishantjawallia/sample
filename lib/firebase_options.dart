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
    apiKey: 'AIzaSyAypVUM_ERjVKg_e0w4oE524uX3I0_RxzE',
    appId: '1:546540713878:web:db21daef22ec378669cfb7',
    messagingSenderId: '546540713878',
    projectId: 'sample-9cfa9',
    authDomain: 'sample-9cfa9.firebaseapp.com',
    storageBucket: 'sample-9cfa9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB0sdbPYbQNkjQ-GgmCdO5WOTogAjnkW58',
    appId: '1:546540713878:android:74023e7b18b7106869cfb7',
    messagingSenderId: '546540713878',
    projectId: 'sample-9cfa9',
    storageBucket: 'sample-9cfa9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDxgVzUyR7zHb2GkNS8aGU-on2806AHJTI',
    appId: '1:546540713878:ios:e9df3b074135938569cfb7',
    messagingSenderId: '546540713878',
    projectId: 'sample-9cfa9',
    storageBucket: 'sample-9cfa9.appspot.com',
    androidClientId: '546540713878-3afu70r2c6m835vpcejoc2k37hqk74sd.apps.googleusercontent.com',
    iosClientId: '546540713878-6659h657lllvom30fp2pqv8b79tdo3pl.apps.googleusercontent.com',
    iosBundleId: 'com.example.sample',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDxgVzUyR7zHb2GkNS8aGU-on2806AHJTI',
    appId: '1:546540713878:ios:e9df3b074135938569cfb7',
    messagingSenderId: '546540713878',
    projectId: 'sample-9cfa9',
    storageBucket: 'sample-9cfa9.appspot.com',
    androidClientId: '546540713878-3afu70r2c6m835vpcejoc2k37hqk74sd.apps.googleusercontent.com',
    iosClientId: '546540713878-6659h657lllvom30fp2pqv8b79tdo3pl.apps.googleusercontent.com',
    iosBundleId: 'com.example.sample',
  );
}