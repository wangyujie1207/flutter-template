import 'package:cherry_flutter/cherry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/ui/helper/size_box_entension.dart';
import 'package:get/get.dart';
import 'bottom_navigation_btn.dart';
import 'bottomsheet_title.dart';

class InputBottomsheet extends StatelessWidget {
  final String title;
  final String label;
  final String hintText;

  const InputBottomsheet(
      {Key? key,
      required this.title,
      required this.label,
      required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomsheetTitle(
            title: title,
            onPressed: () => Get.back(),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: CHFOutlineBorderField(
              controller: TextEditingController(),
              enable: true,
              title: label,
              hintText: hintText,
            ),
          ),
          50.w.vb,
          BottomNavigationBtn(
            content: '确认',
            onTap: () {},
          )
        ],
      ),
    );
  }
}
