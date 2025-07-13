import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gowagr_assessment/core/constants/constants.dart';
import 'package:gowagr_assessment/features/shared/shared.dart';

class HeadiesCard extends StatelessWidget {
  const HeadiesCard({super.key});

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
                backgroundImage: AssetImage(headies),
                radius: 25,
              ),
              const SizedBox(width: 10),
                Expanded(
                child: GowagrTextWidget(text: 'Who Wins Headies Next Rated \nAward 2024?', color: appColors.blue032B69, fontWeight: FontWeight.w700, fontsize: 14,),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _VoteRow(name: "Odumodublvck", yes: "Yes", no: "No", yesAmount: '\u{20A6}55', noAmount: '\u{20A6}45',),
          const SizedBox(height: 10),
          _VoteRow(name: "Shallipopi", yes: "Yes", no: "No", yesAmount: '\u{20A6}45', noAmount: '\u{20A6}55',),
          const SizedBox(height: 12),
         Row(
            children: [
               Icon(Icons.bar_chart, size: 16, color: appColors.grey98A8C1),
              const XBox( 2),
              GowagrTextWidget(text: "\u{20A6}1.5M", color: appColors.grey98A8C1, fontWeight: FontWeight.w500, fontsize: 10,),
              const Spacer(),
              GowagrTextWidget(text: "Ends 14th oct.", color: appColors.grey98A8C1, fontWeight: FontWeight.w500, fontsize: 10,),
              Icon(CupertinoIcons.heart, size: 16, color: appColors.grey98A8C1),
            ],
          )
        ],
      ),
    );
  }
}

class _VoteRow extends StatelessWidget {
  final String name;
  final String yes;
  final dynamic yesAmount;
  final String no;
    final dynamic noAmount;
  const _VoteRow({required this.name, required this.yes, required this.no, required this.yesAmount, required this.noAmount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 2, child: GowagrTextWidget(text: name, color: appColors.grey7387A6, fontWeight: FontWeight.w600, fontsize: 12,),),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: appColors.blue0166F4.withValues(alpha: 0.5)),
              borderRadius: BorderRadius.circular(6),
              color: appColors.blue0166F4.withValues(alpha: 0.05),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
             GowagrTextWidget(text: yes, color: appColors.blue0166F4, fontWeight: FontWeight.w500, fontsize: 12,),
             XBox(5),
              GowagrTextWidget(text: yesAmount, color: appColors.blue0166F4, fontWeight: FontWeight.w600, fontsize: 12,)
              ],
            ),
          ),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: appColors.redFF4E4E.withValues(alpha: 0.5)),
              borderRadius: BorderRadius.circular(6),
              color: appColors.redFF4E4E.withValues(alpha: 0.05),
            ),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
             GowagrTextWidget(text: no, color: appColors.redFF4E4E, fontWeight: FontWeight.w500, fontsize: 12,),
             XBox(5),
              GowagrTextWidget(text: noAmount, color: appColors.redFF4E4E, fontWeight: FontWeight.w600, fontsize: 12,)
              ],
            ),
          ),
        ),
      ],
    );
  }
}