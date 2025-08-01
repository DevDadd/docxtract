import 'package:flutter/material.dart';

class LayoutParserPage extends StatelessWidget {
  const LayoutParserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Layout Parser"),
        ),
      ),
    );
  }
}