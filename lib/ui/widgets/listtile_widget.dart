import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListTileWidget extends StatelessWidget {
  final String label;
  final double? height;
  final bool hasArrow;
  final bool hasBorder;
  final dynamic content;
  final Widget? prefix;
  final Widget? suffix;
  final Color? splashColor;
  final EdgeInsetsGeometry? padding;
  final GestureTapCallback? onTap;

  const ListTileWidget(
      {Key? key,
      this.label = '',
      this.height,
      this.hasArrow = true,
      this.hasBorder = false,
      this.content,
      this.prefix,
      this.suffix,
      this.splashColor,
      this.padding,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.w,
      child: InkWell(
        onTap: onTap ?? () {},
        splashColor: splashColor,
        highlightColor: splashColor,
        child: Padding(
          padding: padding ?? EdgeInsets.symmetric(horizontal: 30.w),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border(
                bottom: hasBorder
                    ? BorderSide(width: 1.w, color: const Color(0xffEEEEEE))
                    : BorderSide.none,
              ),
            ),
            child: Row(
              children: [
                prefix ??
                    Text(label,
                        style: TextStyle(
                            fontSize: 30.sp, color: const Color(0xff333333))),
                const Spacer(),
                if (suffix != null) suffix!,
                if (content != null)
                  content is String
                      ? Text(
                          content,
                          style: TextStyle(
                            fontSize: 30.sp,
                            color: const Color(0xff999999),
                          ),
                        )
                      : content,
                if (hasArrow)
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(Icons.arrow_forward_ios,
                        size: 36.sp, color: const Color(0xff333333)),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
