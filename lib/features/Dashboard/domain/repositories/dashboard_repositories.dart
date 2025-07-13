import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gowagr_assessment/core/api/api_response.dart';
import 'package:gowagr_assessment/features/Dashboard/dashboard.dart';



final authRepositoryProvider = Provider<DashboardRepositories>((ref) {
  return DashboardRepositoriesImpl(ref);
});

abstract class DashboardRepositories {
 Future<ApiResponse<GowagrModelResponse>> gowagr(
   
  );
}

class DashboardRepositoriesImpl implements DashboardRepositories {
  DashboardRepositoriesImpl(this.ref)
      : dashboardRemoteSource = ref.watch(dashboardRemoteSourceProvider);
 

  final Ref ref;

  DashboardRemoteSource dashboardRemoteSource;


  @override
  Future<ApiResponse<GowagrModelResponse>> gowagr(
   
      ) async {
    final response = await dashboardRemoteSource.gowagr();
    return response;
  }

  
}
