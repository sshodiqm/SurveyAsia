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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAdYY5iEtWwWdQ-7BeGiDw2pjroNHKmBqw',
    appId: '1:191110943671:android:f2fdad25a84534ee764e32',
    messagingSenderId: '191110943671',
    projectId: 'surveyasia-f63a2',
    storageBucket: 'surveyasia-f63a2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAZ-gYwZYjwI_kWz0737NZ3Jpl7BUkQo8Q',
    appId: '1:191110943671:ios:ab02dfaf885f142f764e32',
    messagingSenderId: '191110943671',
    projectId: 'surveyasia-f63a2',
    storageBucket: 'surveyasia-f63a2.appspot.com',
    androidClientId: '191110943671-4an87n6s2te1fcsq32eoqboeta3qo0pf.apps.googleusercontent.com',
    iosClientId: '191110943671-p861nttjhf737bai3j9aehd3d8qpac7l.apps.googleusercontent.com',
    iosBundleId: 'com.example.surveiAsia',
  );
}
