import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:handytasksapp/app/core/interface/http_client_repository.dart';
import 'package:handytasksapp/app/core/network/http_client_response.dart';

class DioHttpCustom implements HttpClientRepository {
  final Dio dioCustomhttpClient;
  DioHttpCustom({required this.dioCustomhttpClient});
  @override
  Future<HttpClientResponse> delete(
    String url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
    Map<String, String>? params,
  }) async {
    try {
      final response = await dioCustomhttpClient.post(
        url,
        data: body,
        options: Options(headers: headers),
      );
      return HttpClientResponse(
        statusCode: response.statusCode ?? 500,
        body: body,
        message: response.statusCode == 200 ? 'Success' : 'Error',
        isSuccess: response.statusCode == 200,
      );
    } catch (e) {
      return HttpClientResponse(
        statusCode: 500,
        body: null,
        message: e.toString(),
        isSuccess: false,
      );
    }
  }

  @override
  Future<HttpClientResponse> get(
    String url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
    Map<String, String>? params,
  }) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<HttpClientResponse> post(
    String url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
    Map<String, String>? params,
  }) async {
    try {
      final response = await dioCustomhttpClient.post(
  url,
  data: body,
  options: Options(
    headers: {
      ...?headers,
      'Content-Type': 'application/json',
      'Accept':'application/json'
    },
  ),
);

      return HttpClientResponse(
        statusCode: response.statusCode ?? 500,
        body: response.data,
        message: response.statusCode == 200 ? 'Success' : 'Error',
        isSuccess: response.statusCode == 200,
      );
    } catch (e) {
      return HttpClientResponse(
        statusCode: 500,
        body: null,
        message: e.toString(),
        isSuccess: false,
      );
    }
  }

  @override
  Future<HttpClientResponse> put(
    String url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
    Map<String, String>? params,
  }) {
    // TODO: implement put
    throw UnimplementedError();
  }
}
