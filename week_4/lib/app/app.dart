import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:utils/utils.dart';

import 'router.dart';

class AdaptiveNavigationApp extends ConsumerWidget {
  const AdaptiveNavigationApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(routerProvider);
    return AppBuilder(builder: (lightTheme, darkTheme) {
      return MaterialApp.router(
        title: 'Flutter Demo',
        theme: lightTheme,
        darkTheme: darkTheme,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        routeInformationProvider: router.routeInformationProvider,
      );
    });
  }
}
