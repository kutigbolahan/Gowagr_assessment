import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gowagr_assessment/core/api/api.dart';
import 'package:gowagr_assessment/features/Dashboard/dashboard.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';



class DashboardNotifiers
    extends StateNotifier<ApiResponse<GowagrModelResponse>> {
  DashboardNotifiers() : super(ApiResponse.init());


Future<bool> isConnected() async {
  final connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult != ConnectivityResult.none;
}

  Future<void> gowagr({
    required WidgetRef ref,
    required BuildContext context,
     
   required String? keyword,
  required  bool? trending,
   required int? size,
   required int? page,
   required String? category,
      
   
  }) async {
    state = state.copiedLoading(true);
  // final connected = await isConnected();
    final bool isConnected = await InternetConnectionChecker.instance.hasConnection;
if ( isConnected) {
  print('This is connected');

    try {
       final response = await ref.read(dashboardRemoteSourceProvider).gowagr(keyword:  keyword,trending: trending,size: size,page: page, category: category);
        if (response.data != null && response.data!.events?.isNotEmpty == true) {
      final box = Hive.box('gowagrBox');
    await box.put('gowagr_data', response.data?.toJson());
    var name = box.get('gowagr_data');
    print('This is cached name data$name');
    }
    
    state = response;
    } catch (e) {
       state = ApiResponse.error("Something went wrong.");
      

    
    }
} else{
 
    final box = Hive.box('gowagrBox');
    final cachedJson = box.get('gowagr_data');

    if (cachedJson != null) {
      final cachedMap = Map<String, dynamic>.from(cachedJson);
cachedMap['events'] = (cachedMap['events'] as List)
    .map((event) {
      final eventMap = Map<String, dynamic>.from(event as Map);

     
      if (eventMap['markets'] != null) {
        eventMap['markets'] = (eventMap['markets'] as List)
            .map((market) => Map<String, dynamic>.from(market as Map))
            .toList();
      }

      return eventMap;
    })
    .toList();

cachedMap['pagination'] = Map<String, dynamic>.from(cachedMap['pagination']);

final cachedData = GowagrModelResponse.fromJson(cachedMap);
state = ApiResponse.completed(cachedData);
    } else {
      state = ApiResponse.error("Failed to load data and no cache available");
    }

}
   

    
  }
}