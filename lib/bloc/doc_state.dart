// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
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
  final String searchQuery;
  final PlatformFile? file;
  final bool isUploaded;
  DocState({List<Feature>? features, this.searchQuery = '', this.file, this.isUploaded = false})
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
  List<Object?> get props => [features,searchQuery,file,isUploaded];




  DocState copyWith({
    List<Feature>? features,
    String? searchQuery,
    PlatformFile? file,
    bool? isUploaded,
    bool clearFile = false,
  }) {
    return DocState(
      features: features ?? this.features,
      searchQuery: searchQuery ?? this.searchQuery,
      file: clearFile ? null : (file ?? this.file),
      isUploaded: isUploaded ?? this.isUploaded,
    );
  }
}
