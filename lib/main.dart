import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_sample/firebase_options.dart';
import 'package:video_sample/view/pages/home.dart';
import 'package:video_sample/view/pages/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "login": (context) => const MyLogin(),
        "home": (context) => const MyHome(),
      },
      initialRoute: "login",
    ),
  ));
}
