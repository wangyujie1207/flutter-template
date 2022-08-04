import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

final List<CustomBottomNavigationBarItem> navigationBars =
    <CustomBottomNavigationBarItem>[
  CustomBottomNavigationBarItem(
    title: '首页',
    image: 'assets/images/tab/tab1.png',
    selectedImage: 'assets/images/tab/tab1-1.png',
  ),
  CustomBottomNavigationBarItem(
    title: '分类',
    image: 'assets/images/tab/tab2.png',
    selectedImage: 'assets/images/tab/tab2-1.png',
  ),
  CustomBottomNavigationBarItem(
    title: '寄卖',
    image: 'assets/images/tab/tab3.png',
    selectedImage: 'assets/images/tab/tab3.png',
  ),
  CustomBottomNavigationBarItem(
    title: '消息',
    image: 'assets/images/tab/tab4.png',
    selectedImage: 'assets/images/tab/tab4-1.png',
  ),
  CustomBottomNavigationBarItem(
    title: '我的',
    image: 'assets/images/tab/tab5.png',
    selectedImage: 'assets/images/tab/tab5-1.png',
  ),
];

class CustomBottomNavigationBar extends StatelessWidget {
  final List<CustomBottomNavigationBarItem> items;
  final int currentIndex;
  final Function(int index) handlerSelected;

  const CustomBottomNavigationBar(
      {Key? key,
      required this.items,
      required this.currentIndex,
      required this.handlerSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: kBottomNavigationBarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(items.length, (index) {
            return CustomBottomNavigationBarItemWidget(
              title: items[index].title.tr,
              image: items[index].image,
              selectImage: items[index].selectedImage,
              isSelected: index == currentIndex,
              onTap: () => handlerSelected(index),
            );
          }),
        ),
      ),
    );
  }
}

class CustomBottomNavigationBarItem {
  String title;
  String image;
  String selectedImage;

  CustomBottomNavigationBarItem(
      {required this.title, required this.image, required this.selectedImage});
}

class CustomBottomNavigationBarItemWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final String image;
  final String selectImage;
  final GestureTapCallback onTap;

  const CustomBottomNavigationBarItemWidget(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.isSelected,
      required this.image,
      required this.selectImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.translucent,
        child: SizedBox(
          height: kBottomNavigationBarHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              isSelected
                  ? Image.asset(
                      selectImage,
                      width: 40.w,
                      height: 40.w,
                      fit: BoxFit.fill,
                    )
                  : Image.asset(
                      image,
                      width: 40.w,
                      height: 40.w,
                      fit: BoxFit.fill,
                    ),
              SizedBox(height: 4.w),
              Text(
                title,
                maxLines: 1,
                softWrap: true,
                style: TextStyle(
                    fontSize: 22.sp,
                    color: isSelected
                        ? const Color(0xff333333)
                        : const Color(0xff999999)),
              )
            ],
          ),
        ),
      ),
    );
  }
}