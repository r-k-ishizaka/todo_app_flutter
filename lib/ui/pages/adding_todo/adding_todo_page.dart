import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/domain/models/types/due_date_time.dart';
import 'package:todo_app/ui/components/due_date_time_input_form_widget.dart';
import 'package:todo_app/ui/components/text_input_widget.dart';

import 'adding_todo_view_model.dart';

/// To-Do 追加画面
class AddingTodoPage extends HookConsumerWidget {
  const AddingTodoPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addingTodoViewModelProvider);
    final controller = useTextEditingController.fromValue(TextEditingValue.empty);

    useEffect(() {
      controller.addListener(() {
        ref.read(addingTodoViewModelProvider.notifier).updateTitle(controller.text);
      });
      return null;
    }, const []);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(spacing: 16, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Text('タイトル', style: Theme.of(context).textTheme.labelLarge),
          TextInputWidget(
              controller: controller,
              hintText: 'タイトルを入力してください',
              validator: ref.read(addingTodoViewModelProvider.notifier).titleValidator),
          Text('締切日時', style: Theme.of(context).textTheme.labelLarge),
          DueDateTimeInputWidget(
              dueDateTime: state.dueDateTime,
              hintText: '締切日時を選択してください',
              onDueDateTimeSelected: (DueDateTime value) {
                ref.read(addingTodoViewModelProvider.notifier).updateDueDateTime(value);
              }),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ref.read(addingTodoViewModelProvider.notifier).canAddTodo
            ? Theme.of(context).floatingActionButtonTheme.backgroundColor
            : Colors.grey,
        onPressed: () async {
          if (!ref.read(addingTodoViewModelProvider.notifier).canAddTodo) return;
          await ref.read(addingTodoViewModelProvider.notifier).addTodo();

          // 画面が破棄されている場合は何もしない
          if (!context.mounted) return;
          Navigator.pop(
            context,
            'success',
          );
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
