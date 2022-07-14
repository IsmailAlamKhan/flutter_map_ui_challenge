import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});
  static const path = '/settings';

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.green,
      child: Center(child: Text('Settings')),
    );
  }
}
