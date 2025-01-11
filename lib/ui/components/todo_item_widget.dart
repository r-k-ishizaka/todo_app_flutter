import 'package:flutter/material.dart';
import 'package:todo_app/domain/models/todo_item.dart';

/// To-Doリストのアイテムを表すウィジェット
class TodoItemWidget extends StatelessWidget {
  /// To-Doリストのアイテム
  final TodoItem todoItem;
  /// チェックボックスのトグル時のコールバック
  final VoidCallback onToggle;

  const TodoItemWidget(
      {super.key, required this.todoItem, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: todoItem.isCompleted ? Colors.grey : Colors.transparent,
          borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(
          todoItem.title,
          style: TextStyle(
            decoration: todoItem.isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        subtitle: Text(todoItem.dueDateTime.formattedString()),
        trailing: Checkbox(
          value: todoItem.isCompleted,
          onChanged: (bool? value) {
            onToggle();
          },
        ),
      ),
    );
  }
}
