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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBp3IOn1DIWHiaHsnRyMv2SBxWnmRqBvWo',
    appId: '1:20599898782:web:87203a19c8f9e05d11318f',
    messagingSenderId: '20599898782',
    projectId: 'vinylo-65983',
    authDomain: 'vinylo-65983.firebaseapp.com',
    storageBucket: 'vinylo-65983.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDidRpU81HLRG0gFfdL5x8c22ze7QNKJ10',
    appId: '1:20599898782:android:765ccb8b5aee982911318f',
    messagingSenderId: '20599898782',
    projectId: 'vinylo-65983',
    storageBucket: 'vinylo-65983.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBWAsJFvQ0JjCGBSXtklDy2hDlaAPM-3Y4',
    appId: '1:20599898782:ios:7295e0df889fff3b11318f',
    messagingSenderId: '20599898782',
    projectId: 'vinylo-65983',
    storageBucket: 'vinylo-65983.appspot.com',
    iosBundleId: 'com.example.vinylo',
  );
}
