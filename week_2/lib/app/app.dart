import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

import 'features/home/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBuilder(
      builder: (lightTheme, darkTheme) => MaterialApp(
        // darkTheme: darkTheme,
        theme: lightTheme,
        home: const HomeView(),
      ),
    );
  }
}
