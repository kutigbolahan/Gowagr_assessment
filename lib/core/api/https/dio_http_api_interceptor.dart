// ignore_for_file: deprecated_member_use, unused_local_variable

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final dioApiInterceptorProvider = Provider<DioApiInterceptor>((ref) {
 

  return DioApiInterceptor(
      
      );
});

class DioApiInterceptor extends Interceptor {
  DioApiInterceptor(
    
      );
  

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
   

    log('dio options headers are => ${options.headers}');
  

   

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    final statusCode = err.response?.statusCode;
    bool doRefresh = false;
    // debugPrint(err.response.data)
    if (err.response?.data != null &&
        err.response?.data is Map<dynamic, dynamic>) {
      debugPrint('DioError has data');
      var errorMsg = (err.response!.data as Map)['message'];
      debugPrint('DioError:: $errorMsg  || ${err.response?.statusCode}');
      if ((err.response?.statusCode == 401 ||
              err.response?.statusCode == 403) &&
          errorMsg.toLowerCase().contains('invalid token')) {
        debugPrint('Due for a refresh-token call');
        doRefresh = true;
       
      }
    }

    return handler.next(err);
  }
}
