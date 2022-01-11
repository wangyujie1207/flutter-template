import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/ui/widgets/loading_widget.dart';

void showToast(String? text, [int seconds = 2]) {
  BotToast.showText(
      text: text ?? ' ',
      duration: Duration(seconds: seconds),
      textStyle: TextStyle(fontSize: 24.sp, color: Colors.white));
}

CancelFunc showLoading({String? text}) {
  return BotToast.showCustomLoading(
    backgroundColor: Colors.transparent,
    toastBuilder: (void Function() cancelFunc) {
      return CLoading(message: text ?? '加载中..');
    },
  );
}

class CustomLoadingWidget extends StatelessWidget {
  final String? text;

  const CustomLoadingWidget({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        height: 90.w,
        constraints: BoxConstraints(minWidth: 240.w),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          color: const Color(0xff4c4c4c),
          border: Border.all(width: 1.w, color: const Color(0xffa5a5a5)),
          borderRadius: BorderRadius.circular(8.w),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 30.w,
              height: 30.w,
              child: CircularProgressIndicator(
                valueColor: const AlwaysStoppedAnimation(Colors.white),
                strokeWidth: 2.w,
              ),
            ),
            SizedBox(width: 20.w),
            Text(
              text ?? 'unKnow',
              style: TextStyle(fontSize: 30.sp, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
