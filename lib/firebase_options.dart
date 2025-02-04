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
    apiKey: 'AIzaSyAVNZXLO4h86M28J8TRprWrMjcFOfh6IhE',
    appId: '1:1075110678746:web:8784f882903c5a5f6855e3',
    messagingSenderId: '1075110678746',
    projectId: 'vinylo-9ab7a',
    authDomain: 'vinylo-9ab7a.firebaseapp.com',
    storageBucket: 'vinylo-9ab7a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDYItK0qIUmrRacWLyOh70pOjVy0L2_7TA',
    appId: '1:1075110678746:android:0416a0c3bd2349276855e3',
    messagingSenderId: '1075110678746',
    projectId: 'vinylo-9ab7a',
    storageBucket: 'vinylo-9ab7a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDjxUw4DvatEHwE2agg4Xq5CeToOk-jDMs',
    appId: '1:1075110678746:ios:826af8b22637fc906855e3',
    messagingSenderId: '1075110678746',
    projectId: 'vinylo-9ab7a',
    storageBucket: 'vinylo-9ab7a.appspot.com',
    iosBundleId: 'com.example.vinylo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDjxUw4DvatEHwE2agg4Xq5CeToOk-jDMs',
    appId: '1:1075110678746:ios:826af8b22637fc906855e3',
    messagingSenderId: '1075110678746',
    projectId: 'vinylo-9ab7a',
    storageBucket: 'vinylo-9ab7a.appspot.com',
    iosBundleId: 'com.example.vinylo',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAVNZXLO4h86M28J8TRprWrMjcFOfh6IhE',
    appId: '1:1075110678746:web:1a34b1b82d6c6f036855e3',
    messagingSenderId: '1075110678746',
    projectId: 'vinylo-9ab7a',
    authDomain: 'vinylo-9ab7a.firebaseapp.com',
    storageBucket: 'vinylo-9ab7a.appspot.com',
  );
}
