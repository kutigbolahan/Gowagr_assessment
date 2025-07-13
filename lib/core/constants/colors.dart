// app colors
import 'package:flutter/material.dart';

const appColors = ThemeModel(
  black: Colors.black,
  white: Colors.white,
 
);

// theme model
class ThemeModel {
  const ThemeModel(
      {required this.white,
      required this.black,
      });

  final Color black;
  final Color white;
  
}
