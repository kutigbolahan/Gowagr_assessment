import 'package:flutter/material.dart';

const appColors = ThemeModel(
  black: Colors.black,
  whiteFBFBFB: Color(0xFFFBFBFB),
  whiteFFFFFF: Color(0xFFFFFFFF),
  blue0166F4: Color(0xFF0166F4),
  blue355587: Color(0xFF355587),
  greyDAE0EA: Color(0xFFDAE0EA),
  blue032B69: Color(0xFF032B69),
  greyC9D1DE: Color(0xFFC9D1DE),
  greyECEFF2: Color(0xFFECEFF2),
  redFF4E4E: Color(0xFFFF4E4E),
  grey98A8C1: Color(0xFF98A8C1),
  green17BD5E: Color(0xFF17BD5E),
  grey7387A6: Color(0xFF7387A6),
);

class ThemeModel {
  const ThemeModel({
    required this.whiteFBFBFB,
    required this.whiteFFFFFF,
    required this.black,
    required this.blue0166F4,
    required this.blue355587,
    required this.greyDAE0EA,
    required this.blue032B69,
    required this.greyC9D1DE,
    required this.greyECEFF2,
    required this.redFF4E4E,
    required this.grey98A8C1,
    required this.green17BD5E,
    required this.grey7387A6,
  });

  final Color black;

  final Color whiteFBFBFB;
  final Color whiteFFFFFF;
  final Color blue0166F4;
  final Color blue355587;
  final Color greyDAE0EA;
  final Color blue032B69;
  final Color greyC9D1DE;
  final Color greyECEFF2;
  final Color redFF4E4E;
  final Color grey98A8C1;
  final Color green17BD5E;
  final Color grey7387A6;
}
