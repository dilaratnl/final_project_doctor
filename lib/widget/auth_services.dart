import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_firebase_setup/widget/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthService {
  MyUser? user;

  bool isHaveProfile = false;

  static AuthService? _instance;

  factory AuthService() {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = AuthService._();
      return _instance!;
    }
  }

  AuthService._();

  // ignore: prefer_final_fields
  FirebaseAuth _auth = FirebaseAuth.instance;

  CollectionReference<Map<String, dynamic>> get userCollection =>
      FirebaseFirestore.instance.collection("Users");

  Future<User?> signUp(String sifre, String email, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: sifre);
      if (userCredential.user != null) {
        return userCredential.user;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("email zaten kulanımda")));
      } else if (e.code == "weak-password") {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Sifre Kisa")));
      } else if (e.code == "invalid-email") {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Gecersiz Mail")));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
         const SnackBar(
            content: Text("Bilinmeyen Hata"),
          ),
        );
      }
    }
    return null;
  }

  Future<User?> signIn(String sifre, String email, BuildContext context) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(email: email, password: sifre);
      if (userCredential.user != null) {
        return userCredential.user;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Kayitli Kullanici Yok")));
      } else if (e.code == "wrong-password") {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("HataliSifer")));
      } else if (e.code == "invalid-email") {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("GecersizMail")));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
         const SnackBar(
            content: Text("BilinmeyenHata"),
          ),
        );
      }
    }
    return null;
  }
}
