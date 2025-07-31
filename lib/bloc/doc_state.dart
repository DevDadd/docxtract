import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:smartdocxtract/model/feature.dart';

class DocState extends Equatable {
  const DocState({
    this.features = const [
      Feature(
        title: "Upload Document",
        icondata: Icons.upload,
        colors: Colors.red,
      ),
      Feature(
        title: "Extract Text",
        icondata: Icons.text_fields,
        colors: Colors.blue,
      ),
      Feature(
        title: "OCR Extraction",
        icondata: Icons.edit_outlined,
        colors: Colors.green,
      ),
    ],
  });

  final List<Feature> features;

  @override
  List<Object> get props => [features];
}
