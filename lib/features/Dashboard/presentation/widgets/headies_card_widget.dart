import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gowagr_assessment/core/constants/constants.dart';
import 'package:gowagr_assessment/features/Dashboard/domain/providers/provider/dashboard_providers.dart';
import 'package:gowagr_assessment/features/shared/shared.dart';

class HeadiesCard extends ConsumerStatefulWidget {
  const HeadiesCard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HeadiesCardState();
}

class _HeadiesCardState extends ConsumerState<HeadiesCard> {

  @override
  Widget build(BuildContext context) {
    return  Consumer(
      builder: (context, ref, child) {
        final gowagrProviderList = ref.watch(gowagrProvider);

        if (gowagrProviderList.isLoading) {
          return const OverviewSkeleton();
        } else if (gowagrProviderList.data?.events?.isEmpty == true) {
          return Center(
            child: GowagrTextWidget(
              text: 'No Wagers Available',
              color: appColors.grey7387A6,
              fontWeight: FontWeight.w500,
              fontsize: 12,
            ),
          );
        } else if (gowagrProviderList.data?.events == null) {
          return Center(
            child: GowagrTextWidget(
              text: 'No Wagers Available',
              color: appColors.grey7387A6,
              fontWeight: FontWeight.w500,
              fontsize: 12,
            ),
          );
        } else {
          return ListView.builder(
         
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: gowagrProviderList.data?.events?.length,
            itemBuilder: (BuildContext context, int index) {
              final wagerlist = gowagrProviderList.data?.events?[index];

              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child:
                
                 Container(
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
                            radius: 25, // Image radius
                            backgroundImage: NetworkImage(
                              wagerlist?.imageUrl ?? kDummyImage,
                            ),
                          ),

                          const XBox(10),
                          Expanded(
                            child: GowagrTextWidget(
                              text: wagerlist?.title ?? '',
                              color: appColors.blue032B69,
                              fontWeight: FontWeight.w700,
                              fontsize: 14,
                            ),
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
    )
              );
            },
          );
        }
      },
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