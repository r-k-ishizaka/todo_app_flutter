import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/domain/models/types/due_date_time.dart';

import '../../../domain/models/todo_item.dart';

part 'adding_todo_view_model.freezed.dart';
part 'adding_todo_view_model.g.dart';

/// To-Do 追加画面の ViewModel
@riverpod
class AddingTodoViewModel extends _$AddingTodoViewModel {
  final AddingTodoState _addingTodoState = AddingTodoState(
    titleController: TextEditingController(),
    dueDateTime: null,
  );

  @override
  AddingTodoState build() => _addingTodoState;

  /// 締切期日を設定
  void setDueDateTime(DueDateTime dueDateTime) {
    state = _addingTodoState.copyWith(dueDateTime: dueDateTime);
  }
}

/// 追加画面の状態
@freezed
class AddingTodoState with _$AddingTodoState {
  const factory AddingTodoState({
    /// タイトル
    required TextEditingController titleController,

    /// 詳細
    required DueDateTime? dueDateTime,
  }) = _AddingTodoState;
}

extension AddingTodoStateExtension on AddingTodoState {
  /// 入力が有効かどうか
  bool get isValid => titleController.text.isNotEmpty && dueDateTime != null;

  /// [TodoItem] に変換
  TodoItem toTodoItem() {
    if (!isValid) {
      throw Exception('Invalid state');
    }
    return TodoItem(
      title: titleController.text,
      isCompleted: false,
      dueDateTime: dueDateTime!,
    );
  }
}
