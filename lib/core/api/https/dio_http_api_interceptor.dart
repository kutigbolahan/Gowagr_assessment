// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:middleman/core/constants/constants.dart';

final dioApiInterceptorProvider = Provider<DioApiInterceptor>((ref) {
  //final authLocalSource = ref.read(authLocalSourceProvider);

  return DioApiInterceptor(
      // authLocalSource: authLocalSource
      );
});

class DioApiInterceptor extends Interceptor {
  DioApiInterceptor(
      // {required this.authLocalSource}
      );
  // final IAuthLocalSource authLocalSource;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    /// setup the api keys to be attached to the headers based on the environment
    // final keyHeaders = getKeyHeaders();
    // options.headers.addAll(keyHeaders);

    // log('key headers are => $keyHeaders');

    // if (doBasicAuth == false) {

    // }

    // final authSignatureHeader = getAuthSignatureHeader(
    //   body: options.data ?? {},
    // );

    // log('authsignature headers are => $authSignatureHeader');

    // options.headers.addAll(authSignatureHeader);

    log('dio options headers are => ${options.headers}');
    // print('This is the token from interceptors${box.read(kToken)}');

    /// get the token
    final token = box.read(kToken);

    if (token != null) {
      options.headers.addAll({
        HttpHeaders.authorizationHeader: 'Bearer $token',
      });

      return handler.next(options);
    }

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
        // return UnAuthorizedException();
      }
    }

    return handler.next(err);
  }
}
