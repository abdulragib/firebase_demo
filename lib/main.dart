import "package:flutter/material.dart";
import "login.dart";
import "signup.dart";
import "home.dart";
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: login(),
      theme: ThemeData.dark(),
      routes: {
        '/signup': (_) => signup(),
        '/home': (_) => home(),
      },
    ),
  );
}
