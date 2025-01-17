import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:todo_app/ui/pages/adding_todo/adding_todo_page.dart';
import 'package:todo_app/ui/pages/home/home_view_model.dart';

import '../../../domain/models/todo_item.dart';
import '../../../domain/models/types/due_date_time.dart';
import '../../components/todo_item_widget.dart';

/// ホーム画面
class HomePage extends HookConsumerWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewModelProvider);

    useEffect(() {
      SchedulerBinding.instance.addPostFrameCallback(
        (_) => ref.read(homeViewModelProvider.notifier).fetchTodoItems(),
      );
      return null;
    }, const []);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: state.when(initial: () {
        return const Center(child: CircularProgressIndicator());
      }, loading: () {
        return TodoItemSkeletonWidget(count: 5);
      }, loaded: (items) {
        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                TodoItemWidget(
                  todoItem: items[index],
                  onToggle: (value, id) {
                    ref.read(homeViewModelProvider.notifier).completeTodoItem(id);
                  },
                ),
                if (index != items.length - 1) const Divider(),
              ],
            );
          },
        );
      }, additionalLoading: (items) {
        return TodoItemSkeletonWidget(count: items.length);
      }, error: () {
        return const Center(child: Text('エラーが発生しました'));
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AddingTodoPage(title: 'Todoを追加'),
          ));
          if (result != null) {
            if (!context.mounted) return;
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text('TODOアイテムを追加しました')));

            ref.read(homeViewModelProvider.notifier).fetchTodoItems();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

/// To-Do アイテムのリストのスケルトンウィジェット
class TodoItemSkeletonWidget extends StatelessWidget {
  const TodoItemSkeletonWidget({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      itemBuilder: (context, index) {
        return Skeletonizer(
          child: TodoItemWidget(
            todoItem: TodoItem(
              id: '',
              title: 'test',
              isCompleted: false,
              dueDateTime: DueDateTime(DateTime.now()),
            ),
            onToggle: (value, id) {
              // ref.read(homeViewModelProvider.notifier).completeTodoItem(index);
            },
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemCount: count,
    );
  }
}
