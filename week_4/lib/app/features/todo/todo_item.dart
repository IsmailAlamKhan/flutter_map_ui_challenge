class TodoItem {
  final String title;
  final int id;
  TodoItem({
    required this.title,
    required this.id,
  });
}

final todos = List.generate(50, (i) => TodoItem(title: 'Todo $i', id: i));
