import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const path = '/profile';
  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.red,
      child: Center(child: Text('Profile')),
    );
  }
}
