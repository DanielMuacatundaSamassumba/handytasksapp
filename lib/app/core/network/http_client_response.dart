abstract class HttpClientResponseModel {


  int get statusCode;
  dynamic get body;
  String get message;
  bool get isSuccess;
}

class HttpClientResponse implements HttpClientResponseModel {
  @override
  final int statusCode;

  @override
  final dynamic body;

  @override
  final String message;

  @override
  final bool isSuccess;

  HttpClientResponse({
    required this.statusCode,
    required this.body,
    required this.message,
    required this.isSuccess,
  });
}
