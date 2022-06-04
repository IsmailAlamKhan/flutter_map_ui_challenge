import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

import 'theme.dart';

class AppBuilder extends StatelessWidget {
  const AppBuilder({
    super.key,
    required this.builder,
  });

  final Widget Function(ThemeData lightTheme, ThemeData darkTheme) builder;

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) => builder(
        AppTheme.lightTheme(colors: lightDynamic),
        AppTheme.darkTheme(colors: darkDynamic),
      ),
    );
  }
}
