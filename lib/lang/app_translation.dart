import 'package:get/get.dart';

import 'en_us.dart';
import 'ja_jp.dart';
import 'ko_kr.dart';
import 'zh_cn.dart';
import 'zh_hk.dart';

class TranslationService extends Translations {

  @override
  Map<String, Map<String, String>> get keys => {
    'zh_CN': zhCN,
    'zh_HK': zhHK,
    'en_US': enUS,
    'ja_JP': jaJP,
    'ko_KR': koKR,
  };
}