import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/domain/models/todo_item.dart';
import 'package:todo_app/domain/use_cases/complete_todo_use_case.dart';

import '../../../domain/repositories/todo_repository.dart';

part 'home_view_model.freezed.dart';
part 'home_view_model.g.dart';

/// ホーム画面のViewModel
@riverpod
class HomeViewModel extends _$HomeViewModel {
  late final _todoRepository = ref.read(todoRepositoryProvider);
  late final _completeTodoUseCase = ref.read(completeTodoUseCaseProvider);

  @override
  HomeState build() => HomeState.initial();

  /// To-Doアイテムを取得する.
  void fetchTodoItems() async {
    if (state.isLoading) return;
    state = state.getLoadStartState();
    final result = await _todoRepository.fetchTodoItems();
    result.when(
      success: (result) {
        final items = result;
        state = state.getFetchTodoItemsState(items);
      },
      error: (error) {
        state = HomeState.error();
      },
    );
  }

  /// To-Doアイテムを完了する.
  void completeTodoItem(String id) async {
    if (state.isLoading) return;
    state = state.getLoadStartState();
    await _completeTodoUseCase(id: id);
    final result = await _todoRepository.fetchTodoItems();
    result.when(
      success: (result) {
        final items = result;
        state = state.getFetchTodoItemsState(items);
      },
      error: (error) {
        state = HomeState.error();
      },
    );
  }
}

/// ホーム画面の状態
@freezed
sealed class HomeState with _$HomeState {
  /// 初期表示状態
  const factory HomeState.initial() = _Initial;

  /// ローディング状態
  const factory HomeState.loading() = _Loading;

  /// データ取得完了状態
  const factory HomeState.loaded(List<TodoItem> todoItems) = _Loaded;

  /// 追加ローディング状態
  const factory HomeState.additionalLoading(List<TodoItem> todoItems) = _AdditionalLoading;

  /// エラー状態
  const factory HomeState.error() = _Error;
}

/// ホーム画面の状態拡張
extension HomeStateExtension on HomeState {
  /// ロード中かどうか
  bool get isLoading => maybeWhen(loading: () => true, additionalLoading: (items) => true, orElse: () => false);

  /// ロード開始時の状態を返却する.
  HomeState getLoadStartState() => when(
        initial: () => HomeState.loading(),
        loading: () => throw Exception('ローディング状態からの遷移は不正です'),
        loaded: (items) => HomeState.additionalLoading(items),
        additionalLoading: (items) => throw Exception('追加ローディング状態からの遷移は不正です'),
        error: () => HomeState.loading(),
      );

  /// データ取得完了時の状態を返却する.
  HomeState getFetchTodoItemsState(List<TodoItem> newItems) => when(
        initial: () => throw Exception('初期表示状態からの遷移は不正です'),
        loading: () => HomeState.loaded(newItems),
        loaded: (items) => throw Exception('データ取得完了状態からの遷移は不正です'),
        additionalLoading: (oldItems) => HomeState.loaded(newItems),
        error: () => throw Exception('エラー状態からの遷移は不正です'),
      );
}
