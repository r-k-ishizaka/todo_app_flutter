import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/domain/models/common/validation_result.dart';
import 'package:todo_app/domain/models/types/due_date_time.dart';
import 'package:todo_app/domain/validators/title_validator.dart';

import '../../../domain/models/todo_item.dart';

part 'adding_todo_view_model.freezed.dart';
part 'adding_todo_view_model.g.dart';

/// To-Do 追加画面の ViewModel
@riverpod
class AddingTodoViewModel extends _$AddingTodoViewModel {
  final AddingTodoState _addingTodoState = AddingTodoState(
    title: "",
    dueDateTime: null,
  );

  final _titleValidator = TitleValidator();

  @override
  AddingTodoState build() => _addingTodoState;

  /// タイトルを更新
  void updateTitle(String title) {
    state = state.copyWith(title: title);
  }

  /// タイトルのバリデータ
  TitleValidator get titleValidator => _titleValidator;

  /// 締切日時を更新
  void updateDueDateTime(DueDateTime dueDateTime) {
    state = state.copyWith(dueDateTime: dueDateTime);
  }

  /// To-Do 追加可能かどうか
  bool get canAddTodo => titleValidator.validate(state.title).isValid && state.dueDateTime != null;
}

/// To-Do 追加画面の状態
@freezed
class AddingTodoState with _$AddingTodoState {
  const factory AddingTodoState({
    /// タイトル
    required String title,

    /// 詳細
    required DueDateTime? dueDateTime,
  }) = _AddingTodoState;
}

/// To-Do 追加画面の状態拡張
extension AddingTodoStateExtension on AddingTodoState {
  /// [TodoItem] に変換
  TodoItem toTodoItem() {
    return TodoItem(
      title: title,
      isCompleted: false,
      dueDateTime: dueDateTime!,
    );
  }
}
