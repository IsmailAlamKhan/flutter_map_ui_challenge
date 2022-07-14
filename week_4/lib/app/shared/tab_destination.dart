import 'package:flutter/material.dart';

import '../features/home/home.dart';
import '../features/profile/profile.dart';
import '../features/settings/settings.dart';
import '../features/some_page/some_page.dart';
import '../features/todo/todo.dart';

class TabDestination {
  final Widget icon;
  final String label;
  final String path;
  final WidgetBuilder builder;
  TabDestination({
    required this.icon,
    required this.label,
    required this.path,
    required this.builder,
  });
}

final tabs = [
  TabDestination(
    icon: const Icon(Icons.home),
    label: 'Home',
    path: HomeView.path,
    builder: (_) => const HomeView(),
  ),
  TabDestination(
    icon: const Icon(Icons.today_outlined),
    label: 'Todo',
    path: TodoView.path,
    builder: (_) => const TodoView(),
  ),
  TabDestination(
    icon: const Icon(Icons.abc),
    label: 'SomePage',
    path: SomePageView.path,
    builder: (_) => const SomePageView(),
  ),
  TabDestination(
    icon: const Icon(Icons.person),
    label: 'Profile',
    path: ProfileView.path,
    builder: (_) => const ProfileView(),
  ),
  TabDestination(
    icon: const Icon(Icons.settings),
    label: 'Settings',
    path: SettingsView.path,
    builder: (_) => const SettingsView(),
  ),
];
