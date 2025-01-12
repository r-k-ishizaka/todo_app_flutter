import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/ui/pages/adding_todo/adding_todo_page.dart';
import 'package:todo_app/ui/pages/home/home_view_model.dart';

import '../../../domain/models/todo_item.dart';
import '../../components/todo_item_widget.dart';

/// ホーム画面
class HomePage extends ConsumerWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoItems = ref.watch(homeViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        itemCount: todoItems.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              TodoItemWidget(
                todoItem: todoItems[index],
                onToggle: () {
                },
              ),
              if (index != todoItems.length - 1) const Divider(),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AddingTodoPage(title: 'Todoを追加')));
          if (result != null) {
            ref
                .read(homeViewModelProvider.notifier)
                .addTodoItem(result as TodoItem);

            if (!context.mounted) return;
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text('TODOアイテムを追加しました')));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
