import 'package:dio/dio.dart';

import '../parser/http_response.dart';

/// Response 解析
abstract class HttpTransformer {
  HttpResponse parse(Response response);
}





