import 'package:flutter/material.dart';
import 'package:gowagr_assessment/core/constants/constants.dart';
import 'package:gowagr_assessment/features/shared/shared.dart';

class MarketCard extends StatelessWidget {
 

  const MarketCard({
    super.key,
   
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: appColors.whiteFFFFFF,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(rema),
                radius: 25,
              ),
              const XBox( 10),
              Expanded(
                child: GowagrTextWidget(text: 'HEIS Delux before Q2, 2025', color: appColors.blue032B69, fontWeight: FontWeight.w700, fontsize: 14,),
              ),
            ],
          ),
          const YBox( 24),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 45,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color:  appColors.blue0166F4.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: appColors.blue0166F4.withValues(alpha: 0.5), ),
                  ),
                  
                  child: Center(
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       GowagrTextWidget(text: "Buy Yes - ", color: appColors.blue0166F4, fontWeight: FontWeight.w500, fontsize: 12,), GowagrTextWidget(text: "\u{20A6}80", color: appColors.blue0166F4, fontWeight: FontWeight.w700, fontsize: 12,)
                    ],
                  )
                  
                  ),
                ),
              ),
              const XBox( 17),
             Expanded(
                child: Container(
                  height: 45,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color:  appColors.redFF4E4E.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: appColors.redFF4E4E.withValues(alpha: 0.5), ),
                  ),
                  
                  child: Center(child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       GowagrTextWidget(text: "Buy No - ", color: appColors.redFF4E4E, fontWeight: FontWeight.w500, fontsize: 12,), GowagrTextWidget(text: "\u{20A6}20", color: appColors.redFF4E4E, fontWeight: FontWeight.w700, fontsize: 12,)
                    ],
                  )
                  
                  ),
                ),
              ),
            ],
          ),
             const YBox( 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left:50.0),
                child: Row(
                  
                  children: [
                GowagrTextWidget(text: "\u{20A6}10k", color: appColors.grey98A8C1, fontWeight: FontWeight.w600, fontsize: 11,),
                const XBox( 5),
                Icon(Icons.arrow_forward, color: appColors.grey98A8C1, size: 12,),
                const XBox( 5),
                             GowagrTextWidget(text: "\u{20A6}22k", color: appColors.green17BD5E, fontWeight: FontWeight.w600, fontsize: 11,)
                  ],
                ),
              ),
              Padding(
               padding: const EdgeInsets.only(right:50.0),
                child: Row(
                  
                  children: [
                GowagrTextWidget(text: "\u{20A6}10k", color: appColors.grey98A8C1, fontWeight: FontWeight.w600, fontsize: 11,),
                 const XBox( 5),
                Icon(Icons.arrow_forward, color: appColors.grey98A8C1, size: 12,),
                 const XBox( 5),
                             GowagrTextWidget(text: "\u{20A6}15k", color: appColors.green17BD5E, fontWeight: FontWeight.w600, fontsize: 11,)
                  ],
                ),
              )
            
            ],
          ),
              const YBox( 24),
          Row(
            children: [
               Icon(Icons.bar_chart, size: 16, color: appColors.grey98A8C1),
              const XBox( 2),
              GowagrTextWidget(text: "129 Trades", color: appColors.grey98A8C1, fontWeight: FontWeight.w500, fontsize: 10,),
              const Spacer(),
              GowagrTextWidget(text: "Ends 14th oct.", color: appColors.grey98A8C1, fontWeight: FontWeight.w500, fontsize: 10,),
              Icon(Icons.bookmark_outline, size: 16, color: appColors.grey98A8C1),
            ],
          )
        ],
      ),
    );
  }
}