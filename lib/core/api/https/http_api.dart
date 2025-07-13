import 'package:dio/dio.dart';

abstract class IHttpApi {
  /// get
  Future<Response> get(String uri,
      {Map<String, dynamic>? queryParameters, int? readTimeout});

  /// post
  Future<Response> post(String uri,
      {dynamic data, Map<String, dynamic>? queryParameters, int? readTimeout});

  /// postMultipart
  Future<Response> postMultipart(String uri,
      {dynamic data, Map<String, dynamic>? queryParameters, int? readTimeout});

  /// put
  Future<Response> put(String uri,
      {dynamic data, Map<String, dynamic>? queryParameters, int? readTimeout});

  Future<Response> patch(String uri,
      {dynamic data, Map<String, dynamic>? queryParameters, int? readTimeout});

  /// delete
  Future<Response> delete(String uri,
      {dynamic data, Map<String, dynamic>? queryParameters, int? readTimeout});
}
