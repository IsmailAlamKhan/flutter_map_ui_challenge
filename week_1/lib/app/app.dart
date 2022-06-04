import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

import 'features/home/view/home_view.dart';

class SliverChallengeApp extends StatelessWidget {
  const SliverChallengeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBuilder(
      builder: (lightTheme, darkTheme) => MaterialApp(
        title: 'Flutter Demo',
        theme: lightTheme,
        darkTheme: darkTheme,
        home: const HomeView(),
      ),
    );
  }
}
