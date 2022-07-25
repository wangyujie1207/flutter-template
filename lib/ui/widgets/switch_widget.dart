import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwitchWidget extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const SwitchWidget({Key? key, required this.value, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      child: Transform.scale(
        scale: 0.8,
        child: CupertinoSwitch(
          activeColor: Theme.of(context).primaryColor,
          trackColor: const Color(0xffCCCCCC),
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
