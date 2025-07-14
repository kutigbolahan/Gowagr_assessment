import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gowagr_assessment/core/constants/constants.dart';
import 'package:gowagr_assessment/features/Dashboard/domain/providers/provider/dashboard_providers.dart';
import 'package:gowagr_assessment/features/shared/refresh_function.dart';

class GowagrFilterChip extends ConsumerStatefulWidget {
  final String name;
  final String selectedName;
  final Widget label;
  final Widget icon;
  final VoidCallback onTap;

  const GowagrFilterChip({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
    required this.name,
    required this.selectedName,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GowagrFilterChipState();
}

class _GowagrFilterChipState extends ConsumerState<GowagrFilterChip> {
  void _handleTap() {
    setState(() {
       widget.name == 'Trending'?  genericFunctions.reFreshAllEndpoints(ref, context):
      ref
          .watch(gowagrProvider.notifier)
          .gowagr(
            ref: ref,
            context: context,
            keyword: '',
            trending: false,
            size: 20,
            page: 1,
            category: 
            widget.name,
          );
    });
  }

  bool get isSelected => widget.name == widget.selectedName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
        _handleTap();
      },
      child: Container(
        height: 40,

        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? appColors.blue0166F4 : appColors.greyECEFF2,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [widget.label, const SizedBox(width: 6), widget.icon],
        ),
      ),
    );
  }
}
