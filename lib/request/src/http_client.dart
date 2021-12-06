import 'package:dio/dio.dart';
import 'package:flutter_template/request/src/http_error.dart';
import 'app_dio.dart';
import 'http_resp.dart';
import 'http_config.dart';
typedef IsSuccessResponse = bool Function(Response<dynamic> response);
class HttpClient {
  late final AppDio _dio;
  final IsSuccessResponse checkSuccessFn;

  HttpClient({BaseOptions? options, HttpConfig? dioConfig, required this.checkSuccessFn})
      : _dio = AppDio(options: options, dioConfig: dioConfig);

  Future<HttpResponse> get(String uri,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {
    try {
      var response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      // return BaseResponse();
      return HttpResponse(code: 200, data: {});
    } on DioError catch(e) {
      throw AppException.create(e);
    }
  }

  Future<HttpResponse> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      // return handleResponse(response, httpTransformer: httpTransformer);
      print('++++++++');
      print(response.data);
      if(checkSuccessFn(response)){
      }
      // return HttpResponse(code: , data: data)
      return HttpResponse(code: 200, data: data);
    }  on DioError catch(e) {
      throw AppException.create(e);
    }
  }

  Future<HttpResponse> patch(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      // return handleResponse(response, httpTransformer: httpTransformer);
      return HttpResponse(code: 200, data: data);
    }  on DioError catch(e) {
      throw AppException.create(e);
    }
  }

  Future<HttpResponse> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      // return handleResponse(response, httpTransformer: httpTransformer);
      return HttpResponse(code: 200, data: data);
    } on DioError catch(e) {
      throw AppException.create(e);
    }
  }

  Future<HttpResponse> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      // return handleResponse(response, httpTransformer: httpTransformer);
      return HttpResponse(code: 200, data: data);
    } on DioError catch(e) {
      throw AppException.create(e);
    }
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
