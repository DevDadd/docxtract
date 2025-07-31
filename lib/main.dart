import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartdocxtract/bloc/doc_bloc.dart';
import 'package:smartdocxtract/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DocBloc(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()),
    );
  }
}
