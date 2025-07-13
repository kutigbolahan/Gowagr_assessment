import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gowagr_assessment/core/api/api.dart';
import 'package:gowagr_assessment/features/Dashboard/dashboard.dart';



class DashboardNotifiers
    extends StateNotifier<ApiResponse<GowagrModelResponse>> {
  DashboardNotifiers() : super(ApiResponse.init());

  Future<void> gowagr({
    required WidgetRef ref,
    required BuildContext context,
   
  }) async {
    state = state.copiedLoading(true);
    final response = await ref.read(dashboardRemoteSourceProvider).gowagr();

    state = response;
  }
}