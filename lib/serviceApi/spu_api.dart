import 'package:flutter_template/request/index.dart';
import 'package:flutter_template/request/src/http_error.dart';
import 'package:get/get.dart';

class SpuApi {
  final HttpClient httpClient = Get.find<HttpClient>();
  final String _goods = "/goods/goods_list";
  final String _user = "/center/index";

  test() async {
    try {
      HttpResponse result = await httpClient.post(_goods);
    } on HttpException catch (e) {
    }
  }
}
