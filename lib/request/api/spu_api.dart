import 'package:flutter_template/request/index.dart';
import 'package:get/get.dart';

class SpuApi {
  final HttpClient httpClient = Get.find<HttpClient>();
  final String _goods = "/goods/goods_list";
  final String _user = "/center/index";

  test() async{
    var result = await httpClient.post(_user);
    print('_____');
    print(result);
  }
}