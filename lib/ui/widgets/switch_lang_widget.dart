import 'package:cherry_flutter/cherry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/lang/lang_service.dart';
import 'package:flutter_template/ui/helper/popup_menu_box.dart';
import 'package:get/get.dart';

class SwitchLangWidget extends StatelessWidget {
  const SwitchLangWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => CHFPopMenuButtonBox<LangBean>(
      tooltip: LangService.to.currentLocale.name,
      child: LangSelectBox(
        title: LangService.to.currentLocale.name,
        color: const Color(0xff111111),
      ),
      itemBuilder: (_) => createLangPopupMenuItem(localList),
      onSelected: (val) => LangService.to.changeLocale(val),
    ));
  }
}


class LangSelectBox extends StatelessWidget {
  final String title;
  final Color color;

  const LangSelectBox({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.w,
      height: 60.w,
      padding: const EdgeInsets.only(left: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child:
              Text(title, style: TextStyle(fontSize: 24.sp, color: color)),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 2),
            child: Icon(Icons.keyboard_arrow_down, size: 36.sp, color: color),
          )
        ],
      ),
    );
  }
}