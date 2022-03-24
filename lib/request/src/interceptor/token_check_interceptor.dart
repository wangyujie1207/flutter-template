import 'package:dio/dio.dart';
import 'package:flutter_template/config/config.dart';
import 'package:flutter_template/lang/lang_service.dart';
import 'package:flutter_template/routes/routes.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get_storage/get_storage.dart';

class TokenCheckInterceptor extends Interceptor {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print(GetStorage().read(Config.token));
    options.headers["token"] = GetStorage().read(Config.token);
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
    //
    // if (response.data['code'] == 403 &&
    //     response.data['code'] == 401 &&
    //     Get.currentRoute != RouteGet.login) {
    //   UserController.to.logout();
    //   showToast(response.data['message']);
    //   Get.offNamed(RouteGet.login);
    // }
    return handler.next(response);
  }
}
