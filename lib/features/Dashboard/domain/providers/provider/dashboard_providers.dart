import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gowagr_assessment/core/core.dart';
import 'package:gowagr_assessment/features/Dashboard/dashboard.dart';
import 'package:gowagr_assessment/features/Dashboard/domain/providers/notifiers/dashboard_notifiers.dart';

final gowagrProvider =
    StateNotifierProvider<DashboardNotifiers, ApiResponse<GowagrModelResponse>>(
      (_) => DashboardNotifiers(),
    );
