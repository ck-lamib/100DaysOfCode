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
    apiKey: 'AIzaSyAn6vFpJUV3785S6U-7UfySwI6BDSAJEJI',
    appId: '1:329364611898:web:2346208d40b2a5d3cce603',
    messagingSenderId: '329364611898',
    projectId: 'fitness-49e82',
    authDomain: 'fitness-49e82.firebaseapp.com',
    storageBucket: 'fitness-49e82.appspot.com',
    measurementId: 'G-S7EYYXQM82',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyApmOcm95Ebg2hP3hzu_aUBXKZTuc6-Il8',
    appId: '1:329364611898:android:36c7b59142d79404cce603',
    messagingSenderId: '329364611898',
    projectId: 'fitness-49e82',
    storageBucket: 'fitness-49e82.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBY0bW4SR4Z_KNMMT-teZLHgBRXljiZK98',
    appId: '1:329364611898:ios:c5bbbf6b2f567f21cce603',
    messagingSenderId: '329364611898',
    projectId: 'fitness-49e82',
    storageBucket: 'fitness-49e82.appspot.com',
    iosClientId: '329364611898-dg9kt9ff8rkh59f6364h4ibmllft5d3m.apps.googleusercontent.com',
    iosBundleId: 'com.example.fitness',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBY0bW4SR4Z_KNMMT-teZLHgBRXljiZK98',
    appId: '1:329364611898:ios:c5bbbf6b2f567f21cce603',
    messagingSenderId: '329364611898',
    projectId: 'fitness-49e82',
    storageBucket: 'fitness-49e82.appspot.com',
    iosClientId: '329364611898-dg9kt9ff8rkh59f6364h4ibmllft5d3m.apps.googleusercontent.com',
    iosBundleId: 'com.example.fitness',
  );
}
