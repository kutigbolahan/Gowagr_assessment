// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gowagr_assessment/core/api/api.dart';

import 'package:gowagr_assessment/features/Dashboard/dashboard.dart';

import 'package:gowagr_assessment/features/shared/shared.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class DashboardNotifiers
    extends StateNotifier<ApiResponse<GowagrModelResponse>> {
  DashboardNotifiers() : super(ApiResponse.init());

  // Future<void> gowagr({
  //   required WidgetRef ref,
  //   required BuildContext context,
  //   required String? keyword,
  //   required bool? trending,
  //   required int? size,
  //   required int? page,
  //   required String? category,
  // }) async {
  //   state = state.copiedLoading(true);

  //   final bool isConnected =
  //       await InternetConnectionChecker.instance.hasConnection;
  //   if (isConnected) {
  //     try {
  //       final response = await ref
  //           .read(dashboardRemoteSourceProvider)
  //           .gowagr(
  //             keyword: keyword,
  //             trending: trending,
  //             size: size,
  //             page: page,
  //             category: category,
  //           );
  //       if (response.data != null &&
  //           response.data!.events?.isNotEmpty == true) {
  //         final box = Hive.box('gowagrBox');
  //         await box.put('gowagr_data', response.data?.toJson());
  //       }

  //       state = response;
  //     } catch (e) {
  //       state = ApiResponse.error("Something went wrong.");
  //     }
  //   } else {
  //     genericFunctions.showADialog(context);
  //     final box = Hive.box('gowagrBox');
  //     final cachedJson = box.get('gowagr_data');

  //     if (cachedJson != null) {
  //       final cachedMap = Map<String, dynamic>.from(cachedJson);
  //       cachedMap['events'] = (cachedMap['events'] as List).map((event) {
  //         final eventMap = Map<String, dynamic>.from(event as Map);

  //         if (eventMap['markets'] != null) {
  //           eventMap['markets'] = (eventMap['markets'] as List)
  //               .map((market) => Map<String, dynamic>.from(market as Map))
  //               .toList();
  //         }

  //         return eventMap;
  //       }).toList();

  //       cachedMap['pagination'] = Map<String, dynamic>.from(
  //         cachedMap['pagination'],
  //       );

  //       final cachedData = GowagrModelResponse.fromJson(cachedMap);
  //       state = ApiResponse.completed(cachedData);
  //     } else {
  //       state = ApiResponse.error("Failed to load data and no cache available");
  //     }
  //   }
  // }


  Future<void> gowagr({
  required WidgetRef ref,
  required BuildContext context,
  required String? keyword,
  required bool? trending,
  required int? size,
  required int? page,
  required String? category,
  bool isLoadMore = false, // NEW
}) async {
 state = state.copiedLoading(true);

  final bool isConnected =
      await InternetConnectionChecker.instance.hasConnection;

  if (isConnected) {
    try {
      final response = await ref.read(dashboardRemoteSourceProvider).gowagr(
            keyword: keyword,
            trending: trending,
            size: size,
            page: page,
            category: category,
          );

      if (response.data != null &&
          response.data!.events?.isNotEmpty == true) {
        final box = Hive.box('gowagrBox');
        await box.put('gowagr_data', response.data?.toJson());
      }

      if (isLoadMore &&
          state.data != null &&
          state.data!.events != null &&
          response.data != null) {
        final previousEvents = state.data!.events!;
        final newEvents = response.data!.events!;
        final combinedEvents = [...previousEvents, ...newEvents];
        final combinedData = response.data!;
        combinedData.events = combinedEvents;

        state = ApiResponse.completed(combinedData);
      } else {
        state = response;
      }
    } catch (e) {
      state = ApiResponse.error("Something went wrong.");
    }
  } else {
    if (!isLoadMore) genericFunctions.showADialog(context);
    final box = Hive.box('gowagrBox');
    final cachedJson = box.get('gowagr_data');

    if (cachedJson != null) {
      final cachedMap = Map<String, dynamic>.from(cachedJson);
      cachedMap['events'] = (cachedMap['events'] as List).map((event) {
        final eventMap = Map<String, dynamic>.from(event as Map);
        if (eventMap['markets'] != null) {
          eventMap['markets'] = (eventMap['markets'] as List)
              .map((market) => Map<String, dynamic>.from(market as Map))
              .toList();
        }
        return eventMap;
      }).toList();

      cachedMap['pagination'] =
          Map<String, dynamic>.from(cachedMap['pagination']);

      final cachedData = GowagrModelResponse.fromJson(cachedMap);
      state = ApiResponse.completed(cachedData);
    } else {
      state = ApiResponse.error("Failed to load data and no cache available");
    }
  }
}
}



