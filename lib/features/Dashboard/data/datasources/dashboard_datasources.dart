
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gowagr_assessment/core/core.dart';

import 'package:gowagr_assessment/features/Dashboard/data/models/response/gowagr_response_model.dart';


final dashboardRemoteSourceProvider = Provider<DashboardRemoteSource>((ref) {
  final apiClient = ref.watch(dioHttpApiProvider);

  return DashboardRemoteSourceImpl(apiClient);
});

abstract class DashboardRemoteSource {
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

class DashboardRemoteSourceImpl implements DashboardRemoteSource {
  DashboardRemoteSourceImpl(
    this.apiClient,
  );

  final IHttpApi apiClient;
  
  @override
  Future<ApiResponse<GowagrModelResponse>> gowagr(
     {
   required String? keyword,
  required  bool? trending,
   required int? size,
   required int? page,
   required String? category,
      }
   
  )async {
    try {
      final response = await apiClient.get(gowagrEndpoints.gowagr,
       queryParameters: {
          if (keyword != null) 'keyword': keyword,
          if (trending != null) 'trending': true,
          'size': size,
          'page': page,
          if (category != null) 'category': category,
        },
        );

      if (response.isSuccess) {
        return ApiResponse<GowagrModelResponse>.completed(
            GowagrModelResponse.fromJson(response.data));
      } else {
        return ApiResponse<GowagrModelResponse>.error(response.data['message']);
      }
    } on ApiException catch (err) {
      return ApiResponse<GowagrModelResponse>.error(err.toString());
    }
  }

  



 

  

 
}
