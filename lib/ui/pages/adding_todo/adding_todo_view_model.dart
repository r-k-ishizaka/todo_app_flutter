import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/domain/models/common/validation_result.dart';
import 'package:todo_app/domain/models/types/due_date_time.dart';
import 'package:todo_app/domain/validators/title_validator.dart';

import '../../../domain/use_cases/add_todo_use_case.dart';

part 'adding_todo_view_model.freezed.dart';
part 'adding_todo_view_model.g.dart';

/// To-Do 追加画面の ViewModel
@riverpod
class AddingTodoViewModel extends _$AddingTodoViewModel {
  late final _titleValidator = ref.read(titleValidatorProvider);
  late final _addTodoUseCase = ref.read(addTodoUseCaseProvider);

  @override
  AddingTodoState build() {
    return AddingTodoState(
      title: "",
      dueDateTime: null,
    );
  }

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

  /// To-Do を追加
  void addTodo(Function onSuccess) async {
    if (!canAddTodo) {
      throw Exception("To-Do を追加できません");
    }

    await _addTodoUseCase(
      title: state.title,
      dueDateTime: state.dueDateTime!,
    );

    onSuccess();
  }
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
