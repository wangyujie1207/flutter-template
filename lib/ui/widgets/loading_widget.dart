import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CLoading extends StatelessWidget {
  final String? message;

  const CLoading({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 216.w,
      height: 216.w,
      decoration: BoxDecoration(
          color: const Color(0xff4c4c4c),
          borderRadius: BorderRadius.circular(24.w)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image.asset('assets/images/common/loading.gif', width: 50.w,),
          const CupertinoActivityIndicator(radius: 15),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.w),
            child: Text(
              message ?? '',
              style: TextStyle(
                fontSize: 28.sp,
                height: 1.4,
                color: const Color(0xffEDEDED),
              ),
            ),
          )
        ],
      ),
    );
  }
}
