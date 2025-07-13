import 'dart:convert';
import 'dart:developer';

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:middleman/core/api/https/dio_http_api_interceptor.dart';

import 'package:middleman/core/core.dart';

/// dio api client provider
final dioHttpApiProvider = Provider<IHttpApi>((ref) {
  return DioHttpApi(ref);
});

class DioHttpApi implements IHttpApi {
  final Ref ref;
  final Dio _dio;

  DioHttpApi(this.ref) : _dio = Dio() {
    final baseOptions = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(milliseconds: 1000 * 60),
      receiveTimeout: const Duration(milliseconds: 1000 * 60),
      contentType: 'application/json',
      validateStatus: _validateStatus,
    );

    // set the options
    _dio.options = baseOptions;

    final presetHeaders = <String, String>{
      Headers.acceptHeader: '*/*',
      HttpHeaders.contentTypeHeader: 'application/json',
      // HttpHeaders.authorizationHeader: 'Bearer ${box.read(kToken)}',
    };

    _dio.options.headers.addAll(presetHeaders);

    debugPrint('About to add interceptors ${presetHeaders.toString()}');
//UNCOMMENT THIS IF YOU NEED INTERCEPTORS
    final dioApiInterceptor = ref.read(dioApiInterceptorProvider);

    _dio.interceptors.addAll(
      [
        if (kDebugMode)
          LogInterceptor(
            requestHeader: false,
            requestBody: true,
            responseBody: true,
            error: true,
          ),
        //UNCOMMENT THIS IF YOU NEED INTERCEPTORS
        dioApiInterceptor,
      ],
    );
    // InterceptorsWrapper(
    //   onRequest: (options, handler) {
    //     // Add token to headers
    //     options.headers['Authorization'] = 'Bearer ${box.read(kToken)}';
    //     print('This is auto token ${options.headers['Authorization']}');
    //     return handler.next(options); // continue
    //   },
    //   onResponse: (response, handler) {
    //     // Do something with response data
    //     return handler.next(response); // continue
    //   },
    //   onError: (DioError e, handler) {
    //     // Handle errors
    //     return handler.next(e); // continue
    //   },
    // );
  }

  static String baseUrl = AppConfig.baseUrl;

  @override
  Future<Response> get(String uri,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? extraHeaders,
      int? readTimeout}) async {
    try {
      if (readTimeout != null) {
        _dio.options.receiveTimeout = const Duration(minutes: 1);
      }
      if (extraHeaders != null) {
        _dio.options.headers.addAll(extraHeaders);
      }
      final response = await _dio.get(
        uri,
        queryParameters: queryParameters,
      );
      log('response by Kuti:: ${response.toString()}');
      return response;
    } catch (e) {
      throw ApiException.getException(e);
    }
  }

  @override
  Future<Response> post(String uri,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      bool? doBasicAuth,
      int? readTimeout}) async {
    try {
      if (readTimeout != null) {
        _dio.options.receiveTimeout = const Duration(minutes: 1);
      }
      // final headers = {
      //   'Authorization': box.read(kToken),
      //   'Content-Type': 'application/json',
      //   ..._dio.options.headers,
      // };
      final response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        //  options: Options(headers: headers),
      );

      log('response by Kuti:: ${response.toString()}');
      log('Headers used: ${json.encode(_dio.options.headers)}');
      log('Request URL: $uri');
      log('Request Data: ${json.encode(data)}');

      return response;
    } catch (e) {
      // log('e is $e');
      throw ApiException.getException(e);
    }
  }

  @override
  Future<Response> postMultipart(String uri,
      {data, Map<String, dynamic>? queryParameters, int? readTimeout}) async {
    try {
      if (readTimeout != null) {
        _dio.options.receiveTimeout = const Duration(minutes: 1);
      }
      final response = await _dio.post(uri,
          data: data,
          options: Options(headers: {
            'Content-type': 'multipart/form-data',
            'Accept': 'application/json',
            //'Authorization': box.read('token'),
          }));

      log('response by Kuti:: ${response.toString()}');

      return response;
    } catch (e) {
      // log('e is $e');
      throw ApiException.getException(e);
    }
  }

  @override
  Future<Response> delete(String uri,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      int? readTimeout}) async {
    try {
      if (readTimeout != null) {
        _dio.options.receiveTimeout = const Duration(minutes: 1);
      }
      final response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
      );
      log('response by Kuti:: ${response.toString()}');

      return response;
    } catch (e) {
      throw ApiException.getException(e);
    }
  }

  @override
  Future<Response> put(String uri,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      int? readTimeout}) async {
    try {
      if (readTimeout != null) {
        _dio.options.receiveTimeout = const Duration(minutes: 1);
      }
      final response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
      );
      log('response by Kuti:: ${response.toString()}');
      return response;
    } catch (e) {
      // log('e is $e');
      throw ApiException.getException(e);
    }
  }

  /// validate the status of a request
  bool _validateStatus(int? status) {
    return status! == 200 || status == 201;
  }

  @override
  Future<Response> patch(String uri,
      {data, Map<String, dynamic>? queryParameters, int? readTimeout}) async {
    try {
      if (readTimeout != null) {
        _dio.options.receiveTimeout = const Duration(minutes: 1);
      }
      final response = await _dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
      );
      log('response by Kuti:: ${response.toString()}');
      return response;
    } catch (e) {
      // log('e is $e');
      throw ApiException.getException(e);
    }
  }
}

extension ResponseExtension on Response {
  bool get isSuccess {
    final is200 = statusCode == HttpStatus.ok;
    final is201 = statusCode == HttpStatus.created;
    return is200 || is201;
  }
}
