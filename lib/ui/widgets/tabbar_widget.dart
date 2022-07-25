import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabModel<T> {
  String? title;
  T? value;

  TabModel({this.title, this.value});
}

class TabBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final ValueChanged<int>? onTap;
  final TabController? controller;
  final List<TabModel> tabs;
  final bool isScrollable;
  final EdgeInsetsGeometry? labelPadding;
  final Color? labelColor;
  final TextStyle? labelStyle;
  final Color? unselectedLabelColor;
  final TextStyle? unselectedLabelStyle;
  final Color? indicatorColor;
  final EdgeInsetsGeometry indicatorPadding;
  final TabBarIndicatorSize? indicatorSize;
  final Decoration? indicator;
  final FontWeight? labelFontWeight;
  final FontWeight? unselectedLabelStyleFontWeight;
  final double? fontSize;

  final double? width;
  final double height;
  final EdgeInsetsGeometry? padding;
  final Decoration? decoration;
  final AlignmentGeometry? alignment;

  const TabBarWidget(
      {Key? key,
      this.onTap,
      this.controller,
      required this.tabs,
      this.isScrollable = false,
      this.labelPadding,
      this.labelColor,
      this.labelStyle,
      this.unselectedLabelColor,
      this.unselectedLabelStyle,
      this.indicatorColor,
      this.indicatorPadding = EdgeInsets.zero,
      this.indicatorSize,
      this.indicator,
      this.labelFontWeight,
      this.unselectedLabelStyleFontWeight,
      this.fontSize,
      this.width,
      this.height = 35,
      this.padding,
      this.decoration,
      this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      alignment: alignment,
      decoration: decoration,
      child: Theme(
        data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent),
        child: TabBar(
          onTap: onTap,
          controller: controller,
          tabs: tabs.map((tab) => Tab(text: tab.title)).toList(),
          isScrollable: isScrollable,
          labelPadding: labelPadding,
          labelColor: labelColor ?? const Color(0xff333333),
          labelStyle: labelStyle ??
              TextStyle(
                  fontSize: fontSize ?? 30.sp,
                  fontWeight: labelFontWeight ?? FontWeight.normal),
          unselectedLabelColor: unselectedLabelColor ?? const Color(0xffAAAAAA),
          unselectedLabelStyle: unselectedLabelStyle ??
              TextStyle(
                  fontSize: fontSize ?? 30.sp,
                  fontWeight:
                      unselectedLabelStyleFontWeight ?? FontWeight.normal),
          indicatorColor: indicatorColor ?? Theme.of(context).primaryColor,
          indicatorPadding: indicatorPadding,
          indicatorSize: indicatorSize ?? TabBarIndicatorSize.tab,
          indicator: indicator,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, height);
}
