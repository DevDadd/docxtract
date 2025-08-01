import 'package:flutter/material.dart';

class LayoutExtractionPage extends StatelessWidget {
  const LayoutExtractionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Table Extraction"),
        ),
      ),
    );
  }
}