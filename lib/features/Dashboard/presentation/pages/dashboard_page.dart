import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gowagr_assessment/core/constants/constants.dart';

import 'package:gowagr_assessment/features/Dashboard/presentation/widgets/filter_chips_widget.dart';

import 'package:gowagr_assessment/features/Dashboard/presentation/widgets/market_card_widget.dart';

import 'package:gowagr_assessment/features/shared/shared.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  String selectedFilter = 'Trending';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.whiteFBFBFB,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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

            Expanded(child: MarketCard()),

            YBox(20),
          ],
        ),
      ),
    );
  }
}
