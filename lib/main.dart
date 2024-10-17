// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:richpich/firebase_options.dart';
import 'package:richpich/register/main_register.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    const RichPich(),
  );
}

class RichPich extends StatelessWidget {
  const RichPich({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainRegister(),
      ),
    );
  }
}

class RichPichApp extends StatelessWidget {
  const RichPichApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
