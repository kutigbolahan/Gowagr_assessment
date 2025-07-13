import 'package:flutter/material.dart';
import 'package:gowagr_assessment/core/constants/constants.dart';

class GowagrFilterChip extends StatelessWidget {
  final Widget label;
  final Widget icon;
  final bool selected;
  const GowagrFilterChip({super.key, required this.label, required this.icon, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? appColors.blue0166F4 : appColors.greyECEFF2,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          label,
            const SizedBox(width: 6),
          icon
          // Icon(icon, size: 16, color: selected ? Colors.white : Colors.black),
          // const SizedBox(width: 6),
          // Text(label, style: TextStyle(color: selected ? Colors.white : Colors.black)),
        ],
      ),
    );
  }
}