import 'package:firebase_core/firebase_core.dart';
import 'package:objective_otter/otter_app.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const OtterApp());
}
