import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RowLoadingWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;

  const RowLoadingWidget({Key? key, this.width, this.margin, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 160.w,
      height: height,
      margin: margin,
      alignment: Alignment.center,
      child: CupertinoActivityIndicator(radius: 15.w),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CupertinoActivityIndicator(radius: 10));
  }
}

class EmptyWidget extends StatelessWidget {
  final EdgeInsetsGeometry? padding;

  const EmptyWidget({Key? key, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            padding: padding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/common/no_data.png',
                  width: 250.w,
                ),
                Text(
                  'nodata'.tr,
                  style: TextStyle(
                      fontSize: 24.sp, color: const Color(0xff999999)),
                ),
              ],
            )));
  }
}
