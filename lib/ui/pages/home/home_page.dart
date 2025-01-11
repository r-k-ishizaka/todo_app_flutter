import 'package:flutter/material.dart';

import '../../../domain/models/todo_item.dart';
import '../../../domain/models/types/due_date_time.dart';
import '../../components/todo_item_widget.dart';

/// ホーム画面
class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<TodoItem> _todoItems = [
    TodoItem(
      title: 'TODOアイテムのタイトル1',
      isCompleted: false,
      dueDateTime: DueDateTime(DateTime.now()),
    ),
    TodoItem(
      title: 'TODOアイテムのタイトル2',
      isCompleted: true,
      dueDateTime: DueDateTime(DateTime.now()),
    ),
  ];

  // TODO 画面確認用に実装、後で消す
  void _addTodoItem() {
    setState(() {
      _todoItems.add(TodoItem(
        title: 'TODOアイテムのタイトル${_todoItems.length + 1}',
        isCompleted: _todoItems.length % 2 == 1,
        dueDateTime: DueDateTime(DateTime.now()),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _todoItems.length,
        itemBuilder: (BuildContext context, int index) {
          return TodoItemWidget(
            todoItem: _todoItems[index],
            onToggle: () {
              // TODO チェックボックスのトグル時の処理を実装
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO 追加ボタン押下時の処理を実装
          _addTodoItem();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
