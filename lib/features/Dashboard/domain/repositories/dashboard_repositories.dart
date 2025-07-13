import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gowagr_assessment/core/api/api_response.dart';
import 'package:gowagr_assessment/features/Dashboard/dashboard.dart';



final authRepositoryProvider = Provider<DashboardRepositories>((ref) {
  return DashboardRepositoriesImpl(ref);
});

abstract class DashboardRepositories {
 Future<ApiResponse<GowagrModelResponse>> gowagr(
   {
   required String? keyword,
  required  bool? trending,
   required int? size,
   required int? page,
   required String? category,
      }
  );
}

class DashboardRepositoriesImpl implements DashboardRepositories {
  DashboardRepositoriesImpl(this.ref)
      : dashboardRemoteSource = ref.watch(dashboardRemoteSourceProvider);
 

  final Ref ref;

  DashboardRemoteSource dashboardRemoteSource;


  @override
  Future<ApiResponse<GowagrModelResponse>> gowagr({
   required String? keyword,
   required bool? trending,
   required int? size,
   required int? page,
   required String? category,
      }) async {
    final response = await dashboardRemoteSource.gowagr(keyword: keyword,trending: trending,size: size,page: page, category: category );
    return response;
  }

  
}
