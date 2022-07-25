import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/ui/widgets/widgets.dart';
import 'package:get/get.dart';

import '../../controllers/countdown_controller.dart';

class CountdownWidget extends StatefulWidget {
  final CountdownController controller;
  final String account;
  final String? label;
  final Color? disableColor;
  final double? width;

  const CountdownWidget({Key? key, required this.controller, required this.account, this.label, this.disableColor, this.width}) : super(key: key);

  @override
  State<CountdownWidget> createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {

  @override
  void dispose() {
    widget.controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (widget.controller.countdownLoading) {
        return const RowLoadingWidget();
      }
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => widget.controller.handlerCountdown(widget.account),
        child: Container(
          width: widget.width ?? 160.w,
          alignment: Alignment.center,
          child: Text(
            widget.controller.count > 0 ? '${widget.controller.count}s' : widget.label ?? '获取验证码',
            style: TextStyle(
              fontSize: 28.sp,
              color: widget.controller.count > 0
                  ? widget.disableColor ?? const Color(0xffCCCCCC)
                  : Theme.of(context).primaryColor,
            ),
          ),
        ),
      );
    });
  }
}
