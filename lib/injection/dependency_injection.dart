import 'package:cherry_request/cherry_request.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter_template/controllers/application_controller.dart';
import 'package:flutter_template/lang/lang_service.dart';
import 'package:get/get.dart';

import 'http_client_service.dart';

class DependencyInjection {
  static Future<void> init() async {
   await Get.putAsync<HttpClient>(() => HttpClientController().init());
   Get.put<LangService>(LangService());
   Get.put<EventBus>(EventBus());
   Get.put<ApplicationController>(ApplicationController());
  }
}