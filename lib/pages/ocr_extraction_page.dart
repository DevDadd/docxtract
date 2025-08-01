import 'package:flutter/material.dart';

class OcrExtractionPage extends StatelessWidget {
  const OcrExtractionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("OCR Extraction"),
        ),
      ),
    );
  }
}