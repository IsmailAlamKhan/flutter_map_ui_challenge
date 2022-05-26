import 'package:flutter/material.dart';

extension BrightnessX on Brightness {
  Color? contrastColor({
    Color? Function(Brightness brightness)? colorBuilder,
  }) {
    if (colorBuilder != null) {
      return colorBuilder(this);
    }
    if (this == Brightness.light) {
      return Colors.black87;
    } else {
      return Colors.white70;
    }
  }
}
