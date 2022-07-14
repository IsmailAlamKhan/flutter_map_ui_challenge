import 'package:flutter/material.dart';

class SomePageView extends StatelessWidget {
  const SomePageView({super.key});
  static const path = '/some_page';
  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.purple,
      child: Center(child: Text('SomePage')),
    );
  }
}
