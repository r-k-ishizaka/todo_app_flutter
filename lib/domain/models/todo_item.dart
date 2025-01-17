import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/domain/models/types/due_date_time.dart';

part 'todo_item.freezed.dart';

/// To-Doリストのアイテムを表すクラス
@freezed
class TodoItem with _$TodoItem {
  const factory TodoItem({
    /// ID (必須)
    required String id,

    /// タイトル (必須)
    required String title,

    /// 完了済みかどうか (必須)
    required bool isCompleted,

    /// 締切日時 (必須)
    required DueDateTime dueDateTime,
  }) = _TodoItem;
}
