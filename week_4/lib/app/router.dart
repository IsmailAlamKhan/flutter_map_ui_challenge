import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'features/home/home_view.dart';
import 'features/root/root.dart';
import 'features/todo/todo_item.dart';
import 'features/todo/todo_view.dart';
import 'shared/tab_destination.dart';

final routerProvider = Provider(
  (_) => GoRouter(
    routes: [
      GoRoute(
        path: '/',
        redirect: (_) => HomeView.path,
      ),
      GoRoute(
        path: '/:name',
        builder: (context, state) {
          String? name = state.params['name'];

          int index = 0;
          Widget child = tabs.first.builder(context);
          if (name != null) {
            name = '/$name';
            final tab = tabs.firstWhere((tab) => tab.path == name);
            index = tabs.indexOf(tab);
            child = tab.builder(context);
          }
          if (name == TodoView.path) {
            final todoId = state.queryParams['id'];
            if (todoId != null) {
              final todo = todos.firstWhere((todo) => todo.id == int.parse(todoId));
              child = TodoView(item: todo);
            }
          }

          return RootView(key: state.pageKey, currentIndex: index, child: child);
        },
      ),
    ],
  ),
);
