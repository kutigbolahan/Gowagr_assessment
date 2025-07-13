import 'package:flutter/material.dart';
import 'package:middleman/core/constants/constants.dart';
import 'package:middleman/features/shared/shared.dart';

class TransactionsOverviewSkeleton extends StatelessWidget {
  const TransactionsOverviewSkeleton({super.key});

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
              width: Dims.dxPercent(.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
                color: appColors.black,
              ),
            ),
          ),
          subtitle: ShimmerWidget(
            child: Container(
              height: 20,
              width: Dims.dxPercent(3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
                color: appColors.red,
              ),
            ),
          ),
          trailing: Column(
            children: [
              ShimmerWidget(
                child: Container(
                  height: 20,
                  width: Dims.dxPercent(.13),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1),
                    color: appColors.red,
                  ),
                ),
              ),
              ShimmerWidget(
                child: Container(
                  height: 20,
                  width: Dims.dxPercent(.1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1),
                    color: appColors.red,
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
