import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/data/db/sqflite/mapper/todo_item_extension.dart';
import 'package:todo_app/domain/models/todo_item.dart';

import '../../../../domain/repositories/todo_repository.dart';
import '../database_helper.dart';

part 'todo_repository.g.dart';

class TodoRepositoryImpl implements TodoRepository {
  TodoRepositoryImpl({required this.databaseHelper});

  final DatabaseHelper databaseHelper;

  @override
  Future<void> addTodo(TodoItem todoItem) async {
    final db = await databaseHelper.database;

    db.insert(_tableName, todoItem.toMap());
  }

  @override
  Future<void> updateTodo(TodoItem todoItem) async {
    final db = await databaseHelper.database;

    await db.update(
      _tableName,
      todoItem.toMap(),
      where: 'id = ?',
      whereArgs: [todoItem.id],
    );
  }

  @override
  Future<List<TodoItem>> fetchTodoItems() async {
    final db = await databaseHelper.database;

    final maps = await db.query(_tableName);

    return List.generate(maps.length, (index) => TodoItemMap(maps[index]).toTodoItem());
  }

  @override
  Future<TodoItem> fetchTodoItemById(String id) async {
    final db = await databaseHelper.database;

    final maps = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    return TodoItemMap(maps.first).toTodoItem();
  }

  static const _tableName = 'todo_items';
}

@Riverpod(keepAlive: true)
TodoRepositoryImpl todoRepositoryImpl(Ref ref) => TodoRepositoryImpl(
      databaseHelper: ref.read(databaseHelperProvider),
    );
