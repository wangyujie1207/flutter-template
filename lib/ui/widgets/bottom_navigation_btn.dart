import 'package:cherry_flutter/cherry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigationBtn extends StatelessWidget {
  final dynamic content;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final GestureTapCallback? onTap;

  const BottomNavigationBtn(
      {Key? key, required this.content, this.color, this.onTap, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Padding(
        padding: padding ?? EdgeInsets.all(30.w),
        child: CHFButton(
          height: 88.w,
          color: color ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10.w),
          content: content,
          fontSize: 30.sp,
          onTap: onTap,
        ),
      ),
    );
  }
}
