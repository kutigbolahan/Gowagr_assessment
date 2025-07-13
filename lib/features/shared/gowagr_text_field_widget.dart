import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gowagr_assessment/core/constants/constants.dart';

class GowagrTextField extends StatelessWidget {
  const GowagrTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon:  Icon(CupertinoIcons.search, color: appColors.greyC9D1DE),
        hintText: 'Search for a market',
        hintStyle: GoogleFonts.archivo(
          color: appColors.greyC9D1DE, fontSize: 12,fontWeight: FontWeight.w500
        ) ,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:  BorderSide(color:appColors.blue032B69.withValues(alpha: 0.2)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
         borderSide:  BorderSide(color:appColors.blue032B69.withValues(alpha: 0.2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
         borderSide:  BorderSide(color:appColors.blue032B69.withValues(alpha: 0.2),),
        ),
      ),
    );
  }
}