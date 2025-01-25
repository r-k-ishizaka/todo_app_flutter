import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/data/db/sqflite/mapper/todo_item_extension.dart';
import 'package:todo_app/domain/models/todo_item.dart';

import '../../../../domain/models/common/future_result_builder.dart';
import '../../../../domain/models/common/result.dart';
import '../../../../domain/repositories/todo_repository.dart';
import '../database_helper.dart';

part 'todo_repository.g.dart';

class TodoRepositoryImpl implements TodoRepository {
  TodoRepositoryImpl({required this.databaseHelper});

  final DatabaseHelper databaseHelper;

  @override
  Future<Result<void>> addTodo(TodoItem todoItem) {
    return FutureResultBuilder.build(() async {
      final db = await databaseHelper.database;

      db.insert(_tableName, todoItem.toMap());
    });
  }

  @override
  Future<Result<void>> updateTodo(TodoItem todoItem) {
    return FutureResultBuilder.build(() async {
      final db = await databaseHelper.database;

      await db.update(
        _tableName,
        todoItem.toMap(),
        where: 'id = ?',
        whereArgs: [todoItem.id],
      );
    });
  }

  @override
  Future<Result<List<TodoItem>>> fetchTodoItems() async {
    return FutureResultBuilder.build(() async {
      final db = await databaseHelper.database;

      final maps = await db.query(_tableName);

      return List.generate(maps.length, (index) => TodoItemMap(maps[index]).toTodoItem());
    });
  }

  @override
  Future<Result<TodoItem>> fetchTodoItemById(String id) async {
    return FutureResultBuilder.build(() async {
      final db = await databaseHelper.database;

      final maps = await db.query(
        _tableName,
        where: 'id = ?',
        whereArgs: [id],
      );

      return TodoItemMap(maps.first).toTodoItem();
    });
  }

  static const _tableName = 'todo_items';
}

@Riverpod(keepAlive: true)
TodoRepositoryImpl todoRepositoryImpl(Ref ref) => TodoRepositoryImpl(
      databaseHelper: ref.read(databaseHelperProvider),
    );
