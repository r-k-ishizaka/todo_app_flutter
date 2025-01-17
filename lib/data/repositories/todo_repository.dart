import 'package:todo_app/domain/models/todo_item.dart';

import '../../domain/models/types/due_date_time.dart';
import '../../domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final cache = <TodoItem>[];

  @override
  Future<void> addTodo(String title, DueDateTime dueDateTime) async {
    // 0.5秒待機後に追加
    await Future.delayed(const Duration(milliseconds: 500));

    final todoItem = TodoItem(
      id: DateTime.now().toIso8601String(),
      title: title,
      isCompleted: false,
      dueDateTime: dueDateTime,
    );
    cache.add(todoItem);
    return Future.value();
  }

  @override
  Future<void> completeTodoById(String id) async {
    // 0.5秒待機後に完了
    await Future.delayed(const Duration(milliseconds: 500));

    final item = cache.firstWhere((element) => element.id == id);
    cache[cache.indexOf(item)] = item.copyWith(isCompleted: true);
    return Future.value();
  }

  @override
  Future<List<TodoItem>> fetchTodoItems() async {
    // 0.5秒待機後に取得
    await Future.delayed(const Duration(milliseconds: 500));

    return Future.value(cache);
  }
}
