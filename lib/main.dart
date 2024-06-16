import 'package:firebase_core/firebase_core.dart';
import 'package:objective_otter/otter_app.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const OtterApp());
}
