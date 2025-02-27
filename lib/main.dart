import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'features/authentication/model/fcm_message_service.dart';
import 'firebase_options.dart';

/*Platform  Firebase App Id
android   1:654143007679:android:a4888f2f00a28d8d478f0a
ios       1:654143007679:ios:2a2cf4d09344f75c478f0a*/


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  debugProfileBuildsEnabled = true;
  await FcmMessageService().initialize();
  FcmMessageService().onTokenRefresh();
  print("=======================${await FcmMessageService().getFcmToken()}=================");
  runApp(const ShopNest());
}



