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
    apiKey: 'AIzaSyDQ1sGD6AhyFGBz-mQ6_RKlcAmbOpc4OTI',
    appId: '1:213743447642:web:fc006a05c9293ad4faf263',
    messagingSenderId: '213743447642',
    projectId: 'pro-deals-159d1',
    authDomain: 'pro-deals-159d1.firebaseapp.com',
    storageBucket: 'pro-deals-159d1.appspot.com',
    measurementId: 'G-NG3ZWQCVCM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBwqfiGW-hoLU4DDcNFovTZtq8rQ6qCIKM',
    appId: '1:213743447642:android:e963627f4faba21afaf263',
    messagingSenderId: '213743447642',
    projectId: 'pro-deals-159d1',
    storageBucket: 'pro-deals-159d1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCxmglUfXqDGC4YG0FT2fHfw6bg5kAImaM',
    appId: '1:213743447642:ios:53861bdbafea1e1efaf263',
    messagingSenderId: '213743447642',
    projectId: 'pro-deals-159d1',
    storageBucket: 'pro-deals-159d1.appspot.com',
    androidClientId:
        '213743447642-fns22hpnqm2t69ki52he3j5th1aqe3eh.apps.googleusercontent.com',
    iosClientId:
        '213743447642-r8egao35tk3u4qdu1atemk66qq7ibaig.apps.googleusercontent.com',
    iosBundleId: 'com.example.proDeals1',
  );
}
