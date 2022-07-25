import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DividerWidget extends StatelessWidget {
  final double? height;
  final double? indent;
  final Color? color;
  final EdgeInsetsGeometry? margin;

  const DividerWidget({Key? key, this.height, this.indent, this.color, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Divider(
        height: height ?? 1.w,
        thickness: height ?? 1.w,
        indent: indent,
        endIndent: indent,
        color: color ?? const Color(0xffEEEEEE),
      ),
    );
  }
}
