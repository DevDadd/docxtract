import 'package:flutter/material.dart';

class ExtractTextPage extends StatelessWidget {
  const ExtractTextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Extract Text"),
        ),
      ),
    );
  }
}