import 'package:dio/dio.dart';
import 'package:flutter_template/request/src/http_error.dart';
import 'app_dio.dart';
import 'http_resp.dart';
import 'http_config.dart';

typedef JsonParse<T> = T Function(dynamic data);
typedef IsSuccessResponse = bool Function(Response<dynamic> response);

class HttpClient {
  late final AppDio _dio;
  final IsSuccessResponse checkSuccessFn;

  HttpClient(
      {BaseOptions? options,
      HttpConfig? dioConfig,
      required this.checkSuccessFn})
      : _dio = AppDio(options: options, dioConfig: dioConfig);

  Future<HttpResponse<T>> _request<T>(String uri,
      {required String method,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      JsonParse<T>? jsonParse,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      Response response = await _dio.request(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      int _code = response.data["code"] is int
          ? response.data["code"]
          : int.tryParse(response.data["code"]) ?? -1;
      String _message = response.data["message"];
      if (checkSuccessFn(response)) {
        if (jsonParse != null) {
          return HttpResponse<T>(
              code: _code,
              message: _message,
              data: jsonParse(response.data["data"]));
        } else {
          return HttpResponse<T>(
              code: _code, message: _message, data: response.data["data"]);
        }
      }
      throw HttpException(code: _code, message: _message);
    } on DioError catch (e) {
      throw HttpException.create(e);
    }
  }

  Future<HttpResponse<T>> get<T>(String uri,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      JsonParse<T>? jsonParse,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {
    return _request<T>(uri,
        method: 'GET',
        queryParameters: queryParameters,
        options: options,
        jsonParse: jsonParse,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);
  }

  Future<HttpResponse<T>> post<T>(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    JsonParse<T>? jsonParse,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return _request<T>(uri,
        method: 'POST',
        data: data,
        queryParameters: queryParameters,
        options: options,
        jsonParse: jsonParse,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
  }

  Future<HttpResponse<T>> patch<T>(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    JsonParse<T>? jsonParse,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return _request<T>(uri,
        method: 'PATCH',
        data: data,
        queryParameters: queryParameters,
        options: options,
        jsonParse: jsonParse,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
  }

  Future<HttpResponse<T>> delete<T>(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    JsonParse<T>? jsonParse,
    CancelToken? cancelToken,
  }) async {
    return _request<T>(
      uri,
      method: 'DELETE',
      data: data,
      queryParameters: queryParameters,
      options: options,
      jsonParse: jsonParse,
      cancelToken: cancelToken,
    );
  }

  Future<HttpResponse<T>> put<T>(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    JsonParse<T>? jsonParse,
    CancelToken? cancelToken,
  }) async {
    return _request<T>(
      uri,
      method: 'PUT',
      data: data,
      queryParameters: queryParameters,
      options: options,
      jsonParse: jsonParse,
      cancelToken: cancelToken,
    );
  }

  Future<Response> download(
    String urlPath,
    savePath, {
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    bool deleteOnError = true,
    String lengthHeader = Headers.contentLengthHeader,
    data,
    Options? options,
  }) async {
    try {
      var response = await _dio.download(
        urlPath,
        savePath,
        onReceiveProgress: onReceiveProgress,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        deleteOnError: deleteOnError,
        lengthHeader: lengthHeader,
        data: data,
        options: data,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
