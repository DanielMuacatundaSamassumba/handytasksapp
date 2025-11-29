import 'dart:convert';

import 'package:handytasksapp/app/core/network/http_client_response.dart';


abstract interface class HttpClientRepository {
  Future<HttpClientResponse> post(String url,{ Map<String, String>? headers, Object? body, Encoding encoding , Map<String, String> ? params});
  Future<HttpClientResponse> get(String url,{ Map<String, String>? headers, Object? body, Encoding encoding , Map<String, String> ? params});
  Future<HttpClientResponse> put(String url,{ Map<String, String>? headers, Object? body, Encoding encoding , Map<String, String> ? params});
  Future<HttpClientResponse> delete(String url,{ Map<String, String>? headers, Object? body, Encoding encoding , Map<String, String> ? params});
}


