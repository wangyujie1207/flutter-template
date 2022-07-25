import 'package:flutter/material.dart';

class ActionBarBox extends StatelessWidget {
  final Widget child;
  final GestureTapCallback? onTap;
  final EdgeInsetsGeometry? padding;
  const ActionBarBox({Key? key, this.onTap, required this.child, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: padding ?? const EdgeInsets.all(15),
        child: child,
      ),
    );
  }
}