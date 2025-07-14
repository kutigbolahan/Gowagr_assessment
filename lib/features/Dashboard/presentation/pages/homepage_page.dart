import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gowagr_assessment/core/constants/assets.dart';
import 'package:gowagr_assessment/core/constants/colors.dart';
import 'package:gowagr_assessment/core/constants/dimensions.dart';
import 'package:gowagr_assessment/features/Dashboard/presentation/pages/dashboard_page.dart';

import 'package:gowagr_assessment/features/shared/shared.dart';
import 'package:liquid_pull_refresh/liquid_pull_refresh.dart';

class Hompage extends ConsumerStatefulWidget {
  const Hompage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HompageState();
}

class _HompageState extends ConsumerState<Hompage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);

    super.initState();
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
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
                TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,

                  labelPadding: EdgeInsets.only(right: 30),
                  dividerColor: Colors.transparent,
                  splashFactory: NoSplash.splashFactory,
                  unselectedLabelColor: appColors.greyDAE0EA,
                  labelColor: appColors.blue355587,
                  indicator: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: const BorderRadius.all(Radius.circular(36)),
                  ),
                  tabs: [
                    Tab(
                      child: GowagrTextWidget(
                        text: 'Explore',

                        fontWeight: FontWeight.w700,
                        fontsize: 20,
                      ),
                    ),
                    Tab(
                      child: GowagrTextWidget(
                        text: 'Portfolio',

                        fontWeight: FontWeight.w700,
                        fontsize: 20,
                      ),
                    ),
                    Tab(
                      child: GowagrTextWidget(
                        text: 'Activity',

                        fontWeight: FontWeight.w700,
                        fontsize: 20,
                      ),
                    ),
                  ],
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [DashboardPage(), Container(), Container()],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
