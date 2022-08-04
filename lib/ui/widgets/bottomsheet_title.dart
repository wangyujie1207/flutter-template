import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomsheetTitle extends StatelessWidget {
  final double? height;
  final String? title;
  final bool hasBorder;
  final VoidCallback? onPressed;
  final AlignmentGeometry? alignment;

  const BottomsheetTitle(
      {Key? key,
        this.height,
        this.title,
        this.hasBorder = false,
        this.onPressed,
        this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? 120.w,
      padding: EdgeInsets.only(left: 30.w, right: 20.w),
      decoration: BoxDecoration(
          border: Border(
            bottom: hasBorder
                ? BorderSide(width: 1.w, color: const Color(0xffEEEEEE))
                : BorderSide.none,
          )),
      child: Stack(
        children: [
          Align(
            alignment: alignment ?? Alignment.center,
            child: Text(title ?? '',
                style: TextStyle(
                    fontSize: 32.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                splashRadius: 50.w,
                onPressed: onPressed,
                icon: Icon(
                  Icons.close,
                  size: 42.sp,
                  color: Colors.black,
                )),
          )
        ],
      ),
    );
  }
}
