import 'package:flutter_template/ui/view/application.dart';
import 'package:get/get.dart';
part './app_routes.dart';

abstract class AppPages {

  static final pages = [
    GetPage(name: Routes.home, page:()=> const ApplicationPage()),
  ];
}