import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gowagr_assessment/core/constants/constants.dart';

import 'package:gowagr_assessment/features/Dashboard/presentation/widgets/filter_chips_widget.dart';

import 'package:gowagr_assessment/features/Dashboard/presentation/widgets/market_card_widget.dart';

import 'package:gowagr_assessment/features/shared/shared.dart';
import 'package:liquid_pull_refresh/liquid_pull_refresh.dart';import 'package:hive/hive.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  String selectedFilter = 'Trending';
   bool _hasInitialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_hasInitialized) {
        genericFunctions.reFreshAllEndpoints(ref, context);
        _hasInitialized = true;
      }
    });
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
                    width: 100,
                    height: 50,
                    padding: EdgeInsets.symmetric(
                      horizontal: hPadding,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(42),
                      border: Border.all(
                        width: 2,
                        color: appColors.blue0166F4.withValues(alpha: 0.1),
                      ),
                    ),
                    child: Image.asset(gowagrLogo, height: 30),
                  ),
                  YBox(24),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async{
                       //   genericFunctions.reFreshAllEndpoints(ref, context);
                          final box = Hive.box('gowagrBox');
                          var name = box.get('gowagr_data');
     print('This is cached name data${name}');
                        },
                        child: GowagrTextWidget(
                          text: 'Explore',
                          color: appColors.blue355587,
                          fontWeight: FontWeight.w700,
                          fontsize: 20,
                        ),
                      ),
                      XBox(24),
                      GowagrTextWidget(
                        text: 'Portfolio',
                        color: appColors.greyDAE0EA,
                        fontWeight: FontWeight.w700,
                        fontsize: 20,
                      ),
                      XBox(24),
                      GowagrTextWidget(
                        text: 'Activity',
                        color: appColors.greyDAE0EA,
                        fontWeight: FontWeight.w700,
                        fontsize: 20,
                      ),
                    ],
                  ),
                  YBox(24),

                  GowagrTextField(category: selectedFilter),
                  YBox(24),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        GowagrFilterChip(
                          label: Icon(
                            Icons.trending_up,
                            size: 12,
                            color: selectedFilter == 'Trending'
                                ? appColors.whiteFBFBFB
                                : appColors.blue355587,
                          ),
                          icon: GowagrTextWidget(
                            text: 'Trending',
                            color: selectedFilter == 'Trending'
                                ? appColors.whiteFBFBFB
                                : appColors.blue355587,
                            fontWeight: FontWeight.w500,
                            fontsize: 12,
                          ),
                          name: 'Trending',
                          selectedName: selectedFilter,
                          onTap: () {
                            setState(() {
                              selectedFilter = 'Trending';
                            });
                          },
                        ),
                        const SizedBox(width: 10),
                        GowagrFilterChip(
                          selectedName: selectedFilter,
                          onTap: () {
                            setState(() {
                              selectedFilter = 'Watchlist';
                            });
                          },
                          icon: Icon(
                            Icons.bookmark_outline,
                            size: 12,
                            color: selectedFilter == 'Watchlist'
                                ? appColors.whiteFBFBFB
                                : appColors.blue355587,
                          ),
                          label: GowagrTextWidget(
                            text: 'Watchlist',
                            color: selectedFilter == 'Watchlist'
                                ? appColors.whiteFBFBFB
                                : appColors.blue355587,
                            fontWeight: FontWeight.w500,
                            fontsize: 12,
                          ),
                          name: 'Watchlist',
                        ),
                        const SizedBox(width: 10),
                        GowagrFilterChip(
                          selectedName: selectedFilter,
                          onTap: () {
                            setState(() {
                              selectedFilter = 'Entertainment';
                            });
                          },
                          icon: Icon(
                            CupertinoIcons.music_note,
                            size: 12,
                            color: selectedFilter == 'Entertainment'
                                ? appColors.whiteFBFBFB
                                : appColors.black,
                          ),
                          label: GowagrTextWidget(
                            text: 'Entertainment',
                            color: selectedFilter == 'Entertainment'
                                ? appColors.whiteFBFBFB
                                : appColors.blue355587,
                            fontWeight: FontWeight.w500,
                            fontsize: 12,
                          ),
                          name: 'Entertainment',
                        ),
                        const SizedBox(width: 10),
                        GowagrFilterChip(
                          selectedName: selectedFilter,
                          onTap: () {
                            setState(() {
                              selectedFilter = 'Sports';
                            });
                          },
                          icon: Icon(
                            Icons.sports_soccer_sharp,
                            size: 12,
                            color: selectedFilter == 'Sports'
                                ? appColors.whiteFBFBFB
                                : appColors.black,
                          ),
                          label: GowagrTextWidget(
                            text: 'Sports',
                            color: selectedFilter == 'Sports'
                                ? appColors.whiteFBFBFB
                                : appColors.blue355587,
                            fontWeight: FontWeight.w500,
                            fontsize: 12,
                          ),
                          name: 'Sports',
                        ),
                        const SizedBox(width: 10),
                        GowagrFilterChip(
                          selectedName: selectedFilter,
                          onTap: () {
                            setState(() {
                              selectedFilter = 'Entertainment';
                            });
                          },
                          icon: Icon(
                            CupertinoIcons.music_note,
                            size: 12,
                            color: selectedFilter == 'Entertainment'
                                ? appColors.whiteFBFBFB
                                : appColors.black,
                          ),
                          label: GowagrTextWidget(
                            text: 'Entertainment',
                            color: selectedFilter == 'Entertainment'
                                ? appColors.whiteFBFBFB
                                : appColors.blue355587,
                            fontWeight: FontWeight.w500,
                            fontsize: 12,
                          ),
                          name: 'Entertainment',
                        ),
                      ],
                    ),
                  ),
                  const YBox(20),

                  // height: 100,
                  MarketCard(),

                  YBox(20),
                 //  HeadiesCard(),
                 
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
