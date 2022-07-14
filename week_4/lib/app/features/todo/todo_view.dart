import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../helper.dart';
import 'todo_item.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key, this.item});
  final TodoItem? item;
  static const path = '/todo';
  @override
  Widget build(BuildContext context) {
    Widget listView = ListView(
      children: todos
          .map(
            (e) => ListTile(
              title: Text(e.title),
              onTap: () {
                context.go(
                  '${TodoView.path}?id=${e.id}',
                );
              },
            ),
          )
          .toList(),
    );
    if (isSmallScreen(context)) {
      return TodoViewMobile(
        item: item,
        listView: listView,
      );
    }
    return TodoViewDesktopAndTab(item: item, listView: listView);
  }
}

class TodoViewMobile extends StatelessWidget {
  const TodoViewMobile({
    super.key,
    this.item,
    required this.listView,
  });
  final TodoItem? item;
  final Widget listView;

  @override
  Widget build(BuildContext context) {
    if (item != null) {
      return Scaffold(
        appBar: AppBar(
          leading: BackButton(onPressed: () => context.go(TodoView.path)),
        ),
        body: Center(child: Text(item!.title)),
      );
    }
    return listView;
  }
}

class TodoViewDesktopAndTab extends StatelessWidget {
  const TodoViewDesktopAndTab({
    super.key,
    this.item,
    required this.listView,
  });
  final TodoItem? item;
  final Widget listView;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 200,
          child: listView,
        ),
        if (item != null) Expanded(child: Center(child: Text(item!.title))),
      ],
    );
  }
}
