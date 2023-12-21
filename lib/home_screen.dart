// import 'dart:ffi';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Flutter Pertamaku",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("belajar Fluter"),
        ),
        body: const Center(
          child: Text("Hello World"),
        ),
      ),
    );
  }
}
