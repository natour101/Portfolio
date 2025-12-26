import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return const FirebaseOptions(
        apiKey: String.fromEnvironment('FIREBASE_API_KEY', defaultValue: ''),
        appId: String.fromEnvironment('FIREBASE_APP_ID', defaultValue: ''),
        messagingSenderId:
            String.fromEnvironment('FIREBASE_MESSAGING_SENDER_ID', defaultValue: ''),
        projectId: String.fromEnvironment('FIREBASE_PROJECT_ID', defaultValue: ''),
        authDomain: String.fromEnvironment('FIREBASE_AUTH_DOMAIN', defaultValue: ''),
        storageBucket: String.fromEnvironment('FIREBASE_STORAGE_BUCKET', defaultValue: ''),
        measurementId: String.fromEnvironment('FIREBASE_MEASUREMENT_ID', defaultValue: ''),
      );
    }

    return const FirebaseOptions(
      apiKey: '',
      appId: '',
      messagingSenderId: '',
      projectId: '',
    );
  }
}
