
import 'package:flutter/material.dart';

const appColors = ThemeModel(
  black: Colors.black,
whiteFBFBFB: Color(0xFFFBFBFB),
blue0166F41A: Color(0xFF0166F4),
blue355587: Color(0xFF355587),
 
);


class ThemeModel {
  const ThemeModel(
      {required this.whiteFBFBFB,
      required this.black,
      required this.blue0166F41A,
      required this.blue355587
      });

  final Color black;
  
   final Color whiteFBFBFB;
   final Color blue0166F41A;
   final Color blue355587;
  
}
