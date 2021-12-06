import 'package:event_bus/event_bus.dart';
import 'package:flutter_template/controllers/application_controller.dart';
import 'package:flutter_template/lang/lang_service.dart';
import 'package:flutter_template/request/http_client_service.dart';
import 'package:flutter_template/request/src/http_client.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static Future<void> init() async {
   await Get.putAsync<HttpClient>(() => HttpClientController().init());
   Get.put<LangService>(LangService());
   Get.put<EventBus>(EventBus());
   Get.put<ApplicationController>(ApplicationController());
  }
}