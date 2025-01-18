import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/domain/models/todo_item.dart';

import '../../data/db/sqflite/repositories/todo_repository.dart';
import '../models/types/due_date_time.dart';

part 'todo_repository.g.dart';

/// To-Do の操作を行うリポジトリ
abstract interface class TodoRepository {
  /// To-Do アイテムを取得
  Future<List<TodoItem>> fetchTodoItems();

  /// To-Do アイテムを追加
  Future<void> addTodo(String title, DueDateTime dueDateTime);

  /// To-Do アイテムを完了
  Future<void> completeTodoById(String id);
}

@Riverpod(keepAlive: true)
TodoRepository todoRepository(Ref ref) => TodoRepositoryImpl();
