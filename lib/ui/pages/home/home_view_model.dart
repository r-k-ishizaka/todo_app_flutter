import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/domain/models/todo_item.dart';

import '../../../domain/repositories/todo_repository.dart';

part 'home_view_model.g.dart';

/// ホーム画面のViewModel
@riverpod
class HomeViewModel extends _$HomeViewModel {
  final _todoItems = <TodoItem>[];
  late final _todoRepository = ref.read(todoRepositoryProvider);

  @override
  List<TodoItem> build() {
    return _todoItems;
  }

  /// To-Doアイテムを取得する.
  void fetchTodoItems() async {
    state = List.empty();
    state = await _todoRepository.fetchTodoItems();
  }

  /// To-Doアイテムを完了する.
  void completeTodoItem(int index) {
    if (index != -1) {
      _todoItems[index] = _todoItems[index].copyWith(isCompleted: true);
      ref.notifyListeners();
    }
  }
}
