import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gowagr_assessment/core/constants/constants.dart';
import 'package:gowagr_assessment/features/Dashboard/domain/providers/provider/dashboard_providers.dart';


class GowagrTextField extends ConsumerStatefulWidget {
  const GowagrTextField({super.key, required this.category});
  final String category;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GowagrTextFieldState();
}

class _GowagrTextFieldState extends ConsumerState<GowagrTextField> {

  @override
  Widget build(BuildContext context) {
      return TextField(
     
      onChanged: (val){
         ref.watch(gowagrProvider.notifier).gowagr(ref: ref, context: context,keyword: val,trending: true,size: 30,page: 1, category: widget.category);
      },
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

