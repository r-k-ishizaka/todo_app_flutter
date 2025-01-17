import 'package:todo_app/domain/models/todo_item.dart';

/// To-Do の操作を行うリポジトリ
abstract interface class TodoRepository {
  /// To-Do アイテムを取得
  Future<List<TodoItem>> fetchTodoItems();

  /// To-Do アイテムを追加
  Future<void> addTodo(String title, DateTime dueDateTime);

  /// To-Do アイテムを完了
  Future<void> completeTodoById(String id);
}
