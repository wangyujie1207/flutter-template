import 'package:flutter/material.dart';

extension SizeBoxExtension on num {
  Widget get hb => SizedBox(
    width: this as double,
  );

  Widget get vb => SizedBox(
    height: this as double,
  );
}