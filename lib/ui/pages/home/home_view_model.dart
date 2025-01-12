import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/domain/models/todo_item.dart';

part 'home_view_model.g.dart';

/// ホーム画面のViewModel
@riverpod
class HomeViewModel extends _$HomeViewModel {
  final _todoItems = <TodoItem>[];

  @override
  List<TodoItem> build() {
    return _todoItems;
  }

  /// To-Doアイテムを追加する.
  void addTodoItem(TodoItem todoItem) {
    _todoItems.add(todoItem);
    ref.notifyListeners();
  }
}
