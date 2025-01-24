import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/domain/models/todo_item.dart';

import '../models/common/result.dart';
import '../repositories/todo_repository.dart';

part 'complete_todo_use_case.g.dart';

/// To-Do アイテムを完了する UseCase
class CompleteTodoUseCase {
  const CompleteTodoUseCase({required this.todoRepository});

  final TodoRepository todoRepository;

  /// To-Do アイテムを完了
  Future<Result<void>> call({
    required String id,
  }) async {
    return await todoRepository.fetchTodoItemById(id).then(
          (value) => value.when(
            success: (todoItem) => Result<TodoItem>.success(todoItem),
            error: (exception) => Result<TodoItem>.error(exception),
          ),
        );
  }
}

@Riverpod(keepAlive: true)
CompleteTodoUseCase completeTodoUseCase(Ref ref) => CompleteTodoUseCase(
      todoRepository: ref.read(todoRepositoryProvider),
    );
