import 'package:todo_app/domain/models/types/due_date_time.dart';

/// To-Doリストのアイテムを表すクラス
class TodoItem {
  /// タイトル (必須)
  final String title;
  /// 完了済みかどうか (必須)
  final bool isCompleted;
  /// 締切日時 (必須)
  final DueDateTime dueDateTime;

  const TodoItem({
    required this.title,
    required this.isCompleted,
    required this.dueDateTime,
  });
}
