import 'package:flutter/material.dart';
import 'package:flutter_template/lang/lang_service.dart';

List<PopupMenuItem<LangBean>> createLangPopupMenuItem(
    List<LangBean> list) {
  return List.generate(list.length, (index) {
    return PopupMenuItem<LangBean>(
      textStyle: const TextStyle(fontSize: 12, color: Color(0xff333333)),
      value: list[index],
      height: 40,
      child: Text(list[index].name),
    );
  });
}