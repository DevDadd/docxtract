import 'package:flutter/material.dart';

class UploaddocPage extends StatelessWidget {
  const UploaddocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Upload Document"),
        ),
      ),
    );
  }
}