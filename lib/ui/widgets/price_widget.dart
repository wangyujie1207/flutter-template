import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceWidget extends StatelessWidget {
  final String price;
  final String? unit;
  final double? fontSize;
  final double? unitFontSize;

  const PriceWidget(
      {Key? key,
      required this.price,
      this.unit,
      this.fontSize,
      this.unitFontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: '¥',
            style: TextStyle(
                fontSize: unitFontSize ?? 22.sp,
                color: Theme.of(context).primaryColor),
            children: [
          TextSpan(
              text: price,
              style: TextStyle(
                  fontSize: fontSize ?? 40.sp, fontWeight: FontWeight.bold)),
          TextSpan(text: unit ?? ''),
        ]));
  }
}
