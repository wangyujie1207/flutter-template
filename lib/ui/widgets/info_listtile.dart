import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'listtile_widget.dart';

class InfoListTile extends StatelessWidget {
  final String label;
  final double? height;
  final bool hasArrow;
  final bool hasBorder;
  final dynamic content;
  final Widget? prefix;
  final Widget? suffix;
  final Color? contentColor;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final GestureTapCallback? onTap;

  const InfoListTile(
      {Key? key,
        required this.label,
        this.height,
        this.hasArrow = false,
        this.hasBorder = false,
        this.content,
        this.prefix,
        this.suffix,
        this.contentColor,
        this.fontSize,
        this.padding,
        this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTileWidget(
      label: label,
      fontSize: fontSize ?? 28.sp,
      contentColor: contentColor ?? const Color(0xff333333),
      height: height ?? 60.w,
      hasArrow: hasArrow,
      hasBorder: hasBorder,
      content: content,
      prefix: prefix,
      suffix: suffix,
      padding: padding,
      splashColor: Colors.transparent,
      onTap: onTap,
    );
  }
}
