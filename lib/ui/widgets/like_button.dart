import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:like_button/like_button.dart';

class LikeButtonWidget extends StatelessWidget {
  final double? size;
  final int? likeCount;
  final EdgeInsetsGeometry? likeCountPadding;
  final bool showCount;
  final bool? isLiked;
  final LikeButtonTapCallback? onTap;

  const LikeButtonWidget(
      {Key? key,
      this.size,
      this.likeCount,
      this.likeCountPadding,
      this.showCount = true,
      this.isLiked = false,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LikeButton(
      size: size ?? 45.sp,
      isLiked: isLiked,
      onTap: onTap,
      circleColor: CircleColor(
        start: Theme.of(context).primaryColor,
        end: Theme.of(context).primaryColor,
      ),
      bubblesColor: BubblesColor(
        dotPrimaryColor: Theme.of(context).primaryColor,
        dotSecondaryColor: Theme.of(context).primaryColor,
      ),
      likeCount: likeCount,
      likeCountAnimationType: LikeCountAnimationType.part,
      likeCountPadding: likeCountPadding ?? EdgeInsets.only(left: 10.w),
      likeBuilder: (bool isLiked) {
        return !isLiked
            ? const Icon(Icons.favorite_border, color: Color(0xff333333))
            : Icon(Icons.favorite, color: Theme.of(context).primaryColor);
      },
      countBuilder: (int? count, bool isLiked, String text) {
        if (!showCount) return const SizedBox();
        Color color = isLiked ? Theme.of(context).primaryColor : Colors.grey;
        Widget result = Text(text, style: TextStyle(color: color));
        return result;
      },
    );
  }
}
