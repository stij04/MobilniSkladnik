// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_svg/flutter_svg.dart';

class SvgImage extends StatefulWidget {
  const SvgImage({
    super.key,
    this.width,
    this.height,
    required this.imagePath,
  });

  final double? width;
  final double? height;
  final String imagePath;

  @override
  State<SvgImage> createState() => _SvgImageState();
}

class _SvgImageState extends State<SvgImage> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      widget.imagePath,
    );
  }
}
