import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NetworkImageWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxFit? fit;
  final String? imageUrl;
  final double? radius;
  final BorderRadiusGeometry? borderRadius;
  final double? holderRadius;
  final Widget? placeholder;
  final Widget? errorWidget;

  const NetworkImageWidget(
      {Key? key,
      this.width,
      this.height,
      this.fit,
      this.imageUrl,
      this.radius,
      this.borderRadius,
      this.holderRadius,
      this.placeholder,
      this.errorWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? "http://via.placeholder.com/200x150",
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius ??
              (radius == null ? null : BorderRadius.circular(radius!)),
          image: DecorationImage(
            image: imageProvider,
            fit: fit ?? BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) =>
          placeholder ??
          Container(
            width: width,
            height: height,
            alignment: Alignment.center,
            child: CupertinoActivityIndicator(
              radius: holderRadius ?? 5,
            ),
          ),
      errorWidget: (context, url, error) =>
          errorWidget ?? const Icon(Icons.error),
    );
  }
}
