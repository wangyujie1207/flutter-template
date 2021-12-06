import 'package:dio/dio.dart';
import 'package:flutter_template/lang/lang_service.dart';
import 'package:get_storage/get_storage.dart';

class TokenCheckInterceptor extends Interceptor {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers["token"] = GetStorage().read('token');
    options.headers["lang"] = LangService.to.localValue;
    return handler.next(options);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    // LogUtil.v(response.request.uri, tag: 'uri');
    // LogUtil.v(response.request.headers, tag: 'headers');
    // LogUtil.v(response.request.data, tag: 'data');
    // // LogUtil.v(response.data['code'], tag: 'response status code');
    // LogUtil.v(response, tag: 'response data');

    // if (response.data['code'] == 403 && Get.currentRoute != Routes.LOGIN_START_PAGE) {
    //   UserController.to.deleteCurrentUser();
    //   showToast(response.data['message']);
    //   Get.offAllNamed(Routes.LOGIN_START_PAGE);
    // }
    return handler.next(response);
  }
}
