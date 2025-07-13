import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gowagr_assessment/core/constants/constants.dart';
import 'package:gowagr_assessment/features/Dashboard/presentation/widgets/filter_chips_widget.dart';
import 'package:gowagr_assessment/features/shared/shared.dart';



class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.whiteFBFBFB,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(hPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,height: 50,
                padding: EdgeInsets.symmetric(horizontal: hPadding,vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(42),
                  border: Border.all(width:2, color: appColors.blue0166F4.withValues(alpha: 0.1))
                ),
                child: Image.asset(
                      gowagrLogo, 
                      height: 30,
                    ),
              ),
               YBox(24),
               Row(
                children: [
                 GowagrTextWidget(text: 'Explore', color: appColors.blue355587,
                                      fontWeight: FontWeight.w700,
                                      fontsize: 20,),
                  XBox( 24),
                GowagrTextWidget(text: 'Portfolio', color: appColors.greyDAE0EA,
                                      fontWeight: FontWeight.w700,
                                      fontsize: 20,),
                   XBox( 24),
                 GowagrTextWidget(text: 'Activity', color: appColors.greyDAE0EA,
                                      fontWeight: FontWeight.w700,
                                      fontsize: 20,),
                ],
              ),
                  YBox(24),
             
              GowagrTextField(),
              YBox(24),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                
                  children: [
                      GowagrFilterChip(label: Icon(Icons.trending_up, size: 12, color:  appColors.whiteFBFBFB ),icon:  
                      GowagrTextWidget(text: 'Trending', color: appColors.whiteFBFBFB,
                                        fontWeight: FontWeight.w500,
                                        fontsize: 12,), selected: true, ),
                      const SizedBox(width: 10),
                      GowagrFilterChip(icon: Icon(Icons.bookmark_outline, size: 12, color:  appColors.blue355587 ),label:  
                      
                      GowagrTextWidget(text: 'Watchlist', color: appColors.blue355587,
                                        fontWeight: FontWeight.w500,
                                        fontsize: 12,),  ),
                                        const SizedBox(width: 10),
                                          GowagrFilterChip(icon: Icon(CupertinoIcons.music_note, size: 12, color:  appColors.black ),label:  
                      
                      GowagrTextWidget(text: 'Entertainment', color: appColors.blue355587,
                                        fontWeight: FontWeight.w500,
                                        fontsize: 12,),  ),
                                        const SizedBox(width: 10),
                                          GowagrFilterChip(icon: Icon(Icons.sports_soccer_sharp, size: 12, color:  appColors.black ),label:  
                      
                      GowagrTextWidget(text: 'Sports', color: appColors.blue355587,
                                        fontWeight: FontWeight.w500,
                                        fontsize: 12,),  ),
                                          const SizedBox(width: 10),
                                          GowagrFilterChip(icon: Icon(CupertinoIcons.music_note, size: 12, color:  appColors.black ),label:  
                      
                      GowagrTextWidget(text: 'Entertainment', color: appColors.blue355587,
                                        fontWeight: FontWeight.w500,
                                        fontsize: 12,),  ),
                  
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children:  [
                    MarketCard(
                      
                    ),
                    SizedBox(height: 16),
                    HeadiesCard(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}









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
