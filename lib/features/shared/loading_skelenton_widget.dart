import 'package:flutter/material.dart';
import 'package:gowagr_assessment/core/constants/colors.dart';

import 'package:gowagr_assessment/features/shared/shimmer_widget.dart';

class OverviewSkeleton extends StatelessWidget {
  const OverviewSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: ShimmerWidget(
            child: Container(
              height: 20,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
                color: appColors.black,
              ),
            ),
          ),
          subtitle: ShimmerWidget(
            child: Container(
              height: 20,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
                color: appColors.redFF4E4E,
              ),
            ),
          ),
          trailing: Column(
            children: [
              ShimmerWidget(
                child: Container(
                  height: 20,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1),
                    color: appColors.redFF4E4E,
                  ),
                ),
              ),
              ShimmerWidget(
                child: Container(
                  height: 20,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1),
                    color: appColors.redFF4E4E,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
