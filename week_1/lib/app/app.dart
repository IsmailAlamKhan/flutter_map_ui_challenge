import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

import 'features/home/view/home_view.dart';
import 'shared/theme.dart';

class SliverChallengeApp extends StatelessWidget {
  const SliverChallengeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) => MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme(colors: lightDynamic),
        darkTheme: AppTheme.darkTheme(colors: darkDynamic),
        home: const HomeView(),
      ),
    );
  }
}
