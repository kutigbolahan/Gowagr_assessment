import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gowagr_assessment/core/constants/constants.dart';


class GowagrTextWidget extends StatelessWidget {
  const GowagrTextWidget(
      {super.key,
      required this.text,
      this.fontWeight,
      this.fontsize,
      this.letterspacing,
      this.color,
      this.textAlign,
      this.overflow,
      this.maxlines,
      this.textDecoration,
      this.textScaleFactor,
      this.fontFamily});

  final String text;
  final FontWeight? fontWeight;
  final double? fontsize;
  final double? letterspacing;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxlines;
  final TextDecoration? textDecoration;
  final TextScaler? textScaleFactor;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxlines,
      softWrap: true,
      overflow: overflow,
      textAlign: textAlign,
      textScaler: textScaleFactor,
      style: GoogleFonts.archivo(
        color: color,
        fontSize: fontsize,
        fontWeight: fontWeight ?? FontWeight.w400,
        letterSpacing: letterspacing,
      ),
    );
  }
}

class CurrencyGowagrTextWidget extends StatelessWidget {
  const CurrencyGowagrTextWidget(
      {super.key,
      required this.text,
      this.fontWeight,
      this.fontsize,
      this.letterspacing,
      this.color,
      this.textAlign,
      this.overflow,
      this.maxlines,
      this.textDecoration,
      this.style,
      this.textScaleFactor});

  final String text;
  final FontWeight? fontWeight;
  final double? fontsize;
  final double? letterspacing;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxlines;
  final TextDecoration? textDecoration;
  final TextStyle? style;
  final TextScaler? textScaleFactor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxlines,
      softWrap: true,
      overflow: overflow,
      textAlign: textAlign,
      textScaler: textScaleFactor,
      style: GoogleFonts.inter(
        color: color,
        fontSize: fontsize,
        fontWeight: fontWeight ?? FontWeight.w400,
        letterSpacing: letterspacing,
      ),
    );
  }
}
