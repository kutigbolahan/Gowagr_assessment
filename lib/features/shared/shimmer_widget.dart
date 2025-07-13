import 'package:flutter/material.dart';
import 'package:gowagr_assessment/core/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: appColors.whiteFBFBFB.withValues(alpha: .4),
      highlightColor: appColors.grey7387A6.withValues(alpha: .2),
      child: child,
    );
  }
}