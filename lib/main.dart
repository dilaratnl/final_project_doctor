import 'package:demo_firebase_setup/view/doctor_home.dart';
import 'package:demo_firebase_setup/view/doctor_info_one.dart';
import 'package:demo_firebase_setup/view/doctor_info_onee.dart';
import 'package:demo_firebase_setup/view/doctor_login.dart';
import 'package:demo_firebase_setup/widget/tabbarlearn_bottomnavigation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
 Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),debugShowCheckedModeBanner: false,
      home: const DoctorLogin(),
    );
  }
}

