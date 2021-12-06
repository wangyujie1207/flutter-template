import 'package:flutter_template/ui/view/application.dart';
import 'package:get/get.dart';

class RouteGet {
  ///root page
  static const String main = "/";

  ///pages map
  static final List<GetPage> getPages = [
    GetPage(name: main, page: () => const ApplicationPage()),
  ];
}