import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:smartdocxtract/model/feature.dart';
import 'package:smartdocxtract/pages/extract_text_page.dart';
import 'package:smartdocxtract/pages/layout_extraction_page.dart';
import 'package:smartdocxtract/pages/layout_parser_page.dart';
import 'package:smartdocxtract/pages/ocr_extraction_page.dart';
import 'package:smartdocxtract/pages/translate_page.dart';
import 'package:smartdocxtract/pages/uploaddoc_page.dart';

class DocState extends Equatable {
  final List<Feature> features;

  DocState({List<Feature>? features})
      : features = features ?? _defaultFeatures;

  static final List<Feature> _defaultFeatures = [
    Feature(
      title: "Upload\nDocument",
      icondata: Icons.upload,
      colors: Colors.red,
      toNavigate: (context) =>  UploaddocPage(),
    ),
    Feature(
      title: "Extract\nText",
      icondata: Icons.text_fields,
      colors: Colors.blue,
      toNavigate: (context) => ExtractTextPage(),
    ),
    Feature(
      title: "OCR\nExtraction",
      icondata: Icons.edit_outlined,
      colors: Colors.green,
      toNavigate: (context) => OcrExtractionPage(),
    ),
    Feature(title: "Layout\nParser", icondata: Icons.layers_outlined, colors: Colors.blueAccent,toNavigate: (context) => LayoutParserPage(),),
    Feature(title: "Translate\nLanguages", icondata: Icons.language, colors: const Color.fromARGB(255, 189, 48, 213),toNavigate: (context) => TranslatePage(),),
    Feature(title: "Table\nExtraction", icondata: Icons.table_chart, colors: const Color.fromARGB(255, 245, 226, 57),toNavigate: (context) => LayoutExtractionPage(),)
  ];

  @override
  List<Object> get props => [features];
}
