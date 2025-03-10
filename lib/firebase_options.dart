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
    apiKey: 'AIzaSyA_QRyjtW3GiFD5wKPgiT9oUzchrMDVZSU',
    appId: '1:108917344583:web:7e896c650c02057567e462',
    messagingSenderId: '108917344583',
    projectId: 'faturei-app-9e171',
    authDomain: 'faturei-app-9e171.firebaseapp.com',
    storageBucket: 'faturei-app-9e171.firebasestorage.app',
    measurementId: 'G-H47MVKTEEL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBEEO_tejc218zo50GatD2P6FgTmYruyIs',
    appId: '1:108917344583:android:97843eb4358586f167e462',
    messagingSenderId: '108917344583',
    projectId: 'faturei-app-9e171',
    storageBucket: 'faturei-app-9e171.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCX_aiaO2jk1u_5Hn5lV6S-dF_73C9Htvw',
    appId: '1:108917344583:ios:382a55c056953a0967e462',
    messagingSenderId: '108917344583',
    projectId: 'faturei-app-9e171',
    storageBucket: 'faturei-app-9e171.firebasestorage.app',
    iosBundleId: 'com.example.FinaFlow',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCX_aiaO2jk1u_5Hn5lV6S-dF_73C9Htvw',
    appId: '1:108917344583:ios:382a55c056953a0967e462',
    messagingSenderId: '108917344583',
    projectId: 'faturei-app-9e171',
    storageBucket: 'faturei-app-9e171.firebasestorage.app',
    iosBundleId: 'com.example.FinaFlow',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA_QRyjtW3GiFD5wKPgiT9oUzchrMDVZSU',
    appId: '1:108917344583:web:6f7ce11d741e736067e462',
    messagingSenderId: '108917344583',
    projectId: 'faturei-app-9e171',
    authDomain: 'faturei-app-9e171.firebaseapp.com',
    storageBucket: 'faturei-app-9e171.firebasestorage.app',
    measurementId: 'G-V254YZVK4G',
  );
}
