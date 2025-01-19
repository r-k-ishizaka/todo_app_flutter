import '../../../../domain/models/todo_item.dart';
import '../../../../domain/models/types/due_date_time.dart';

const _idName = 'id';
const _titleName = 'title';
const _isCompletedName = 'is_completed';
const _dueDateTimeName = 'due_date_time';

/// To-Do アイテムの拡張
extension TodoItemExtension on TodoItem {
  toMap() {
    return {
      _idName: id,
      _titleName: title,
      _isCompletedName: isCompleted ? 1 : 0,
      _dueDateTimeName: dueDateTime.toIso8601String(),
    };
  }
}

/// To-Do アイテムのマップ拡張
extension type TodoItemMap(Map<String, Object?> map) {
  TodoItem toTodoItem() {
    return TodoItem(
      id: map[_idName] as String,
      title: map[_titleName] as String,
      isCompleted: map[_isCompletedName] == 1,
      dueDateTime: DueDateTime.fromIso8601String(map[_dueDateTimeName] as String),
    );
  }
}
