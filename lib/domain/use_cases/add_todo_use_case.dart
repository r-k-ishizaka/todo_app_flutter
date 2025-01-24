import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../models/common/result.dart';
import '../models/todo_item.dart';
import '../models/types/due_date_time.dart';
import '../repositories/todo_repository.dart';

part 'add_todo_use_case.g.dart';

/// To-Do アイテムを追加する UseCase
class AddTodoUseCase {
  const AddTodoUseCase({required this.todoRepository});

  final TodoRepository todoRepository;

  /// To-Do アイテムを追加
  Future<Result<void>> call({
    required String title,
    required DueDateTime dueDateTime,
  }) async {
    final todoItem = TodoItem(
      id: Uuid().v4(),
      title: title,
      isCompleted: false,
      dueDateTime: dueDateTime,
    );

    return await todoRepository.addTodo(
      todoItem,
    );
  }
}

@Riverpod(keepAlive: true)
AddTodoUseCase addTodoUseCase(Ref ref) => AddTodoUseCase(
      todoRepository: ref.read(todoRepositoryProvider),
    );
