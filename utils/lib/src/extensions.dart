import 'package:flutter/material.dart';

extension ColorX on Color {
  double _computeLuminance() {
    return computeLuminance();
  }

  Brightness brightnessBasedOnBackground() {
    if (_computeLuminance() > 0.5) {
      return Brightness.light;
    } else {
      return Brightness.dark;
    }
  }

  Color? contrastColor({
    Color? Function(Brightness brightness)? colorBuilder,
  }) =>
      brightnessBasedOnBackground().contrastColor(colorBuilder: colorBuilder);
}

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

extension ListX<T> on List<T> {
  List<E> indexedMap<E>(E Function(int index, T element) f) => asMap()
      .map(
        (index, value) => MapEntry(index, f(index, value)),
      )
      .values
      .toList();
}
