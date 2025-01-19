import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/domain/models/todo_item.dart';

import '../../data/db/sqflite/repositories/todo_repository.dart';

part 'todo_repository.g.dart';

/// To-Do の操作を行うリポジトリ
abstract interface class TodoRepository {
  /// To-Do アイテムを取得
  Future<List<TodoItem>> fetchTodoItems();

  /// To-Do アイテムを取得
  Future<TodoItem> fetchTodoItemById(String id);

  /// To-Do アイテムを追加
  Future<void> addTodo(TodoItem todoItem);

  /// To-Do アイテムを更新
  Future<void> updateTodo(TodoItem todoItem);
}

@Riverpod(keepAlive: true)
TodoRepository todoRepository(Ref ref) => ref.read(todoRepositoryImplProvider);
