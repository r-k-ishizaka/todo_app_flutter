import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/domain/models/todo_item.dart';

import '../../domain/models/types/due_date_time.dart';
import '../../domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final cache = <TodoItem>[];

  @override
  Future<void> addTodo(String title, DateTime dueDateTime) {
    // 0.2秒待機後に追加
    Future.delayed(const Duration(milliseconds: 200));

    final todoItem = TodoItem(
      id: DateTime.now().toIso8601String(),
      title: title,
      isCompleted: false,
      dueDateTime: DueDateTime(dueDateTime),
    );
    cache.add(todoItem);
    return Future.value();
  }

  @override
  Future<void> completeTodoById(String id) {
    // 0.2秒待機後に完了
    Future.delayed(const Duration(milliseconds: 200));

    final item = cache.firstWhere((element) => element.id == id);
    cache[cache.indexOf(item)] = item.copyWith(isCompleted: true);
    return Future.value();
  }

  @override
  Future<List<TodoItem>> fetchTodoItems() {
    // 0.2秒待機後に取得
    Future.delayed(const Duration(milliseconds: 200));

    return Future.value(cache);
  }
}

@Riverpod(keepAlive: true)
TodoRepository todoRepository(Ref ref) => TodoRepositoryImpl();
