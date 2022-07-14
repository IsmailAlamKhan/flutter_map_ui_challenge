import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final todoControllerProvider = ChangeNotifierProvider<TodoController>(
  (_) => TodoController(),
);

class TodoController extends ChangeNotifier {
  void navigateToTodo() {}
}
