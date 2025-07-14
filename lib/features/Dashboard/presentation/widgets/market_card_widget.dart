import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gowagr_assessment/core/constants/constants.dart';

import 'package:gowagr_assessment/core/utils/utils.dart';

import 'package:gowagr_assessment/features/Dashboard/domain/providers/provider/dashboard_providers.dart';
import 'package:gowagr_assessment/features/shared/shared.dart';
import 'package:intl/intl.dart';

class MarketCard extends ConsumerStatefulWidget {
  const MarketCard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MarketCardState();
}

class _MarketCardState extends ConsumerState<MarketCard> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;
  final int _pageSize = 10;
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 100 &&
          !_isLoadingMore) {
        _loadMore();
      }
    });
  }

  Future<void> _loadMore() async {
    final provider = ref.read(gowagrProvider.notifier);
    final pagination = ref.read(gowagrProvider).data?.pagination;

    if (pagination != null && _currentPage < pagination.lastPage!) {
      setState(() => _isLoadingMore = true);
      _currentPage++;

      await provider.gowagr(
        ref: ref,
        context: context,
        keyword: '',
        trending: true,
        size: _pageSize,
        page: _currentPage,
        category: '',
        isLoadMore: true,
      );

      setState(() => _isLoadingMore = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
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
            controller: _scrollController,

            physics: const BouncingScrollPhysics(),
            itemCount: gowagrProviderList.data?.events?.length,
            itemBuilder: (BuildContext context, int index) {
              final wagerlist = gowagrProviderList.data?.events?[index];

              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
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
                      const YBox(24),

                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 45,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: appColors.blue0166F4.withValues(
                                  alpha: 0.05,
                                ),
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: appColors.blue0166F4.withValues(
                                    alpha: 0.5,
                                  ),
                                ),
                              ),

                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GowagrTextWidget(
                                      text: "Buy Yes - ",
                                      color: appColors.blue0166F4,
                                      fontWeight: FontWeight.w500,
                                      fontsize: 12,
                                    ),
                                    GowagrTextWidget(
                                      text:
                                          NumberFormat.currency(
                                            name: '\u{20A6}',
                                          ).format(
                                            wagerlist?.markets?[0].yesBuyPrice,
                                          ),
                                      color: appColors.blue0166F4,
                                      fontWeight: FontWeight.w700,
                                      fontsize: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const XBox(17),
                          Expanded(
                            child: Container(
                              height: 45,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: appColors.redFF4E4E.withValues(
                                  alpha: 0.05,
                                ),
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: appColors.redFF4E4E.withValues(
                                    alpha: 0.5,
                                  ),
                                ),
                              ),

                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GowagrTextWidget(
                                      text: "Buy No - ",
                                      color: appColors.redFF4E4E,
                                      fontWeight: FontWeight.w500,
                                      fontsize: 12,
                                    ),
                                    GowagrTextWidget(
                                      text:
                                          NumberFormat.currency(
                                            name: '\u{20A6}',
                                          ).format(
                                            wagerlist?.markets?[0].noBuyPrice,
                                          ),
                                      color: appColors.redFF4E4E,
                                      fontWeight: FontWeight.w700,
                                      fontsize: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const YBox(24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50.0),
                            child: Row(
                              children: [
                                GowagrTextWidget(
                                  text: NumberFormat.currency(name: '\u{20A6}')
                                      .format(
                                        wagerlist
                                            ?.markets?[0]
                                            .yesPriceForEstimate,
                                      ),
                                  color: appColors.grey98A8C1,
                                  fontWeight: FontWeight.w600,
                                  fontsize: 11,
                                ),
                                const XBox(5),
                                Icon(
                                  Icons.arrow_forward,
                                  color: appColors.grey98A8C1,
                                  size: 12,
                                ),
                                const XBox(5),
                                GowagrTextWidget(
                                  text: NumberFormat.currency(name: '\u{20A6}')
                                      .format(
                                        wagerlist
                                            ?.markets?[0]
                                            .yesProfitForEstimate,
                                      ),
                                  color: appColors.green17BD5E,
                                  fontWeight: FontWeight.w600,
                                  fontsize: 11,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 50.0),
                            child: Row(
                              children: [
                                GowagrTextWidget(
                                  text: NumberFormat.currency(name: '\u{20A6}')
                                      .format(
                                        wagerlist
                                            ?.markets?[0]
                                            .noPriceForEstimate,
                                      ),
                                  color: appColors.grey98A8C1,
                                  fontWeight: FontWeight.w600,
                                  fontsize: 11,
                                ),
                                const XBox(5),
                                Icon(
                                  Icons.arrow_forward,
                                  color: appColors.grey98A8C1,
                                  size: 12,
                                ),
                                const XBox(5),
                                GowagrTextWidget(
                                  text: NumberFormat.currency(name: '\u{20A6}')
                                      .format(
                                        wagerlist
                                            ?.markets?[0]
                                            .noProfitForEstimate,
                                      ),
                                  color: appColors.green17BD5E,
                                  fontWeight: FontWeight.w600,
                                  fontsize: 11,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const YBox(24),
                      Row(
                        children: [
                          Icon(
                            Icons.bar_chart,
                            size: 16,
                            color: appColors.grey98A8C1,
                          ),
                          const XBox(2),
                          GowagrTextWidget(
                            text: "${wagerlist?.totalOrders} Trades",
                            color: appColors.grey98A8C1,
                            fontWeight: FontWeight.w500,
                            fontsize: 10,
                          ),
                          const Spacer(),
                          GowagrTextWidget(
                            text:
                                'Ends ${DateTimeUtils.formatDate(dateMonthFormat, wagerlist?.resolutionDate ?? DateTime.now().toString())}',
                            color: appColors.grey98A8C1,
                            fontWeight: FontWeight.w500,
                            fontsize: 10,
                          ),
                          Icon(
                            Icons.bookmark_outline,
                            size: 16,
                            color: appColors.grey98A8C1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
