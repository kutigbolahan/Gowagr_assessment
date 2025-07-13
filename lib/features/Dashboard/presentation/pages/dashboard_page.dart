import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gowagr_assessment/core/constants/constants.dart';
import 'package:gowagr_assessment/features/Dashboard/domain/providers/provider/dashboard_providers.dart';
import 'package:gowagr_assessment/features/Dashboard/presentation/widgets/filter_chips_widget.dart';
import 'package:gowagr_assessment/features/Dashboard/presentation/widgets/headies_card_widget.dart';
import 'package:gowagr_assessment/features/Dashboard/presentation/widgets/market_card_widget.dart';
import 'package:gowagr_assessment/features/shared/refresh_function.dart';
import 'package:gowagr_assessment/features/shared/shared.dart';
import 'package:liquid_pull_refresh/liquid_pull_refresh.dart';



class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {

  @override
  void initState() {
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.whiteFBFBFB,
      body: SafeArea(
        child: LiquidPullRefresh(
           height: 100,
          color: appColors.blue0166F4,
          showChildOpacityTransition: false,
          bottomShaddow: true,
          onRefresh: () async {
           
 return await genericFunctions.reFreshAllEndpoints(ref, context);
          
          },
          child: Padding(
            padding: const EdgeInsets.all(hPadding),
            child: SingleChildScrollView(
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
                     GestureDetector(
                      onTap: (){
                         ref.watch(gowagrProvider.notifier).gowagr(ref: ref, context: context);
                      },
                       child: GowagrTextWidget(text: 'Explore', color: appColors.blue355587,
                                            fontWeight: FontWeight.w700,
                                            fontsize: 20,),
                     ),
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
                  const YBox(20),
                   MarketCard(
                          
                        ),
                        YBox(20),
                        HeadiesCard(),
                  // Expanded(
                  //   child: ListView(
                  //     children:  [
                  //       MarketCard(
                          
                  //       ),
                  //       SizedBox(height: 16),
                  //       HeadiesCard(),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}












