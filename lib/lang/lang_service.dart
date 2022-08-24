import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LangBean {
  String name;
  int value;
  Locale locale;

  LangBean({required this.name, required this.value, required this.locale});
}

final List<LangBean> localList = [
  LangBean(name: 'English', value: 5, locale: const Locale('en', 'US')),
  LangBean(name: '中文简体', value: 1, locale: const Locale('zh', 'CN')),
  LangBean(name: '中文繁體', value: 2, locale: const Locale('zh', 'HK')),
  LangBean(name: '日本語', value: 3, locale: const Locale('ja', 'JP')),
  LangBean(name: '한국말', value: 4, locale: const Locale('ko', 'KR')),
];

class LangService extends GetxController {
  static LangService get to => Get.find<LangService>();
  final _getStorage = GetStorage();

  final Rx<LangBean> _currentLocale = localList.first.obs;

  LangBean get currentLocale => _currentLocale.value;
  set currentLocale(val) => _currentLocale.value = val;

  int get localValue => _currentLocale.value.value;
  String? get localName => _currentLocale.value.name;
  Locale get local => _currentLocale.value.locale;

  List<Locale> get supportedLocales {
    List<Locale> _temp = [];
    for (var value in localList) {
      _temp.add(value.locale);
    }
    return _temp;
  }

  launchLocale() {
    final int? _oldValue = _getStorage.read<int>('lang');
    late LangBean _result;
    if (_oldValue == null) {
      _result = localList.firstWhere((element) {
        if (ui.window.locale.languageCode == 'zh') {
          return ui.window.locale.countryCode == 'CN'
              ? element.locale.countryCode == 'CN'
              : element.locale.countryCode == 'HK';
        }
        return element.locale.languageCode == ui.window.locale.languageCode;
      }, orElse: () => _currentLocale.value);
      int _value = _result.value;
      _getStorage.write('lang', _value);
    } else {
      _result = localList.firstWhere((element) => element.value == _oldValue);
    }
    _currentLocale.value = _result;
  }

  changeLocale(LangBean locale) {
    if (locale.value == _currentLocale.value.value) return;
    _currentLocale.value = locale;
    Get.updateLocale(locale.locale);
    _getStorage.write('lang', locale.value);
  }

  @override
  void onInit() {
    super.onInit();
    launchLocale();
  }
}
