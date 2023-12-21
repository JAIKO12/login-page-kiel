import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_pemesanan_makanan_kiel2/home_screen.dart';
import 'package:login_pemesanan_makanan_kiel2/model/user_model.dart';
import 'package:login_pemesanan_makanan_kiel2/pages/welcome_page.dart';

class Controller {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final namaTextController = TextEditingController();
  final nomorTextController = TextEditingController();
  Future<void> signIn(
      BuildContext context, String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Berhasil"),
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                )
              });
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future<void> signUp(
      BuildContext context, String email, String password) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()});
      // Perhatikan bahwa saya menambahkan await di sini untuk menunggu hasil dari postDetailsToFirestore

      Fluttertoast.showToast(msg: "Akun berhasil dibuat");
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => WelcomePage()),
      );
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future<void> postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    // Perhatikan bahwa saya mengecek apakah namaTextController.text tidak kosong sebelum menggunakannya
    String? username = namaTextController.text;
    String? nomor = nomorTextController.text;
    UserModel userModel = UserModel();
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.username = username;
    userModel.nomor = nomor;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());

    Fluttertoast.showToast(msg: "Akun berhasil dibuat");
  }
}
