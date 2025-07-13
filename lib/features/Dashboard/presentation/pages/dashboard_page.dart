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
                      title: "HEIS Delux before Q2, 2025",
                      avatar: rema,
                      yesPrice: "₦80",
                      noPrice: "₦20",
                      yesReturn: "₦22k",
                      noReturn: "₦15k",
                      trades: 129,
                      endDate: "Ends 14th Oct."
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
  final String title;
  final String avatar;
  final String yesPrice;
  final String noPrice;
  final String yesReturn;
  final String noReturn;
  final int trades;
  final String endDate;

  const MarketCard({
    super.key,
    required this.title,
    required this.avatar,
    required this.yesPrice,
    required this.noPrice,
    required this.yesReturn,
    required this.noReturn,
    required this.trades,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(avatar),
                radius: 25,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: GowagrTextWidget(text: 'HEIS Delux before Q2, 2025', color: appColors.blue032B69, fontWeight: FontWeight.w700, fontsize: 14,),
              ),
            ],
          ),
          const SizedBox(height: 12),
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
                  
                  child: Center(child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       GowagrTextWidget(text: "Buy Yes - ", color: appColors.blue0166F4, fontWeight: FontWeight.w500, fontsize: 12,), GowagrTextWidget(text: "\u{20A6}80", color: appColors.blue0166F4, fontWeight: FontWeight.w700, fontsize: 12,)
                    ],
                  )
                  
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.red),
                  ),
                  child: Center(child: Text("Buy No - $noPrice", style: TextStyle(color: Colors.red))),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("₦10k  →  $yesReturn", style: const TextStyle(color: Colors.green)),
              Text("₦10k  →  $noReturn", style: const TextStyle(color: Colors.green)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.bar_chart, size: 16),
              const SizedBox(width: 4),
              Text("$trades Trades"),
              const Spacer(),
              Text(endDate, style: const TextStyle(color: Colors.grey))
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
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
               CircleAvatar(
                backgroundImage: AssetImage(headies),
                radius: 20,
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Text("Who Wins Headies Next Rated Award 2024?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _VoteRow(name: "Odumodublvck", yes: "₦55", no: "₦45"),
          const SizedBox(height: 10),
          _VoteRow(name: "Shallipopi", yes: "₦45", no: "₦55"),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.bar_chart, size: 16),
              const SizedBox(width: 4),
              const Text("₦1.5M"),
              const Spacer(),
              const Text("Ends 14th Oct.", style: TextStyle(color: Colors.grey)),
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
  final String no;
  const _VoteRow({required this.name, required this.yes, required this.no});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 2, child: Text(name)),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(6),
              color: Colors.blue.shade50,
            ),
            child: Center(child: Text("Yes $yes", style: const TextStyle(color: Colors.blue))),
          ),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.circular(6),
              color: Colors.red.shade50,
            ),
            child: Center(child: Text("No $no", style: const TextStyle(color: Colors.red))),
          ),
        ),
      ],
    );
  }
}
