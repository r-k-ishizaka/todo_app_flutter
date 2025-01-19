import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/todo_repository.dart';

part 'complete_todo_use_case.g.dart';

/// To-Do アイテムを完了する UseCase
class CompleteTodoUseCase {
  const CompleteTodoUseCase({required this.todoRepository});

  final TodoRepository todoRepository;

  /// To-Do アイテムを完了
  Future<void> call({
    required String id,
  }) async {
    /// 取得
    final todoItem = await todoRepository.fetchTodoItemById(id);

    /// 更新
    await todoRepository.updateTodo(
      todoItem.copyWith(
        isCompleted: true,
      ),
    );

    return;
  }
}

@Riverpod(keepAlive: true)
CompleteTodoUseCase completeTodoUseCase(Ref ref) => CompleteTodoUseCase(
      todoRepository: ref.read(todoRepositoryProvider),
    );
