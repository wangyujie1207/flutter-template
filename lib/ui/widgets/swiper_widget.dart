import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../utils/router_observer.dart';

final GlobalKey<_SwiperWidgetState> noticeSwiperKey = GlobalKey();
final GlobalKey<_SwiperWidgetState> bannerSwiperKey = GlobalKey();
final GlobalKey<_SwiperWidgetState> shopBannerSwiperKey = GlobalKey();
final GlobalKey<_SwiperWidgetState> goodsBannerSwiperKey = GlobalKey();
final GlobalKey<_SwiperWidgetState> playBannerSwiperKey = GlobalKey();

class SwiperWidget extends StatefulWidget {
  final ScrollPhysics? physics;
  final Axis? scrollDirection;
  final SwiperPlugin? pagination;
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final double height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final Color? background;
  final int? autoplayDelay;
  final AlignmentGeometry? alignment;

  const SwiperWidget(
      {Key? key,
      this.physics,
      this.scrollDirection,
      this.pagination,
      required this.itemBuilder,
      required this.itemCount,
      required this.height,
      this.width,
      this.padding,
      this.background,
      this.autoplayDelay,
      this.alignment})
      : super(key: key);

  @override
  _SwiperWidgetState createState() => _SwiperWidgetState();
}

class _SwiperWidgetState extends State<SwiperWidget> with RouteAware {
  bool autoPlay = true;
  int currentIndex = 0;

  @override
  void didChangeDependencies() {
    routeObserver.subscribe(this, ModalRoute.of(context)!); //订阅
    super.didChangeDependencies();
  }

  @override
  void didPopNext() {
    updateAutoPlay(true);
    super.didPopNext();
  }

  @override
  void didPushNext() {
    updateAutoPlay(false);
    super.didPushNext();
  }

  updateAutoPlay(bool val) {
    if (val == autoPlay) return;
    if (mounted) {
      setState(() {
        autoPlay = val;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      padding: widget.padding,
      color: widget.background ?? Colors.white,
      height: widget.height,
      child: Swiper(
        physics: widget.physics,
        itemBuilder: widget.itemBuilder,
        itemCount: widget.itemCount,
        loop: true,
        autoplay: autoPlay,
        scrollDirection: widget.scrollDirection ?? Axis.horizontal,
        pagination: widget.pagination,
        index: currentIndex,
        autoplayDelay: widget.autoplayDelay ?? kDefaultAutoplayDelayMs,
        onIndexChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
