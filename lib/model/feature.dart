import 'package:flutter/widgets.dart';

class Feature {
  final String title;
  final IconData icondata;
  final Color colors;
  final Widget Function(BuildContext context) ? toNavigate;
  const Feature({
    required this.title,
    required this.icondata,
    required this.colors,
    this.toNavigate,
  });
}
