import 'package:cherry_request/cherry_request.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import '../interceptor/token_check_interceptor.dart';

class HttpClientController extends GetxService {
  Future<HttpClient> init() async {
    HttpConfig httpConfig = HttpConfig(
      baseUrl: "http://192.168.1.175/api",
      interceptors: [TokenCheckInterceptor()],
      connectTimeout: 100000,
      sendTimeout: 100000,
      receiveTimeout: 100000,
    );
    return HttpClient(dioConfig: httpConfig, checkSuccessFn: (Response<dynamic> response){
      return response.data!["code"] == 200;
    });
  }
}
