import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/domain/models/types/due_date_time.dart';
import 'package:todo_app/ui/components/due_date_time_input_form_widget.dart';
import 'package:todo_app/ui/components/text_input_widget.dart';

import 'adding_todo_view_model.dart';

/// To-Do 追加画面
class AddingTodoPage extends ConsumerWidget {
  const AddingTodoPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addingTodoViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('タイトル', style: Theme.of(context).textTheme.labelLarge),
              TextInputWidget(
                  controller: state.titleController, hintText: 'タイトルを入力してください'),
              Text('締切日時', style: Theme.of(context).textTheme.labelLarge),
              DueDateTimeInputWidget(
                  dueDateTime: state.dueDateTime,
                  hintText: '締切日時を選択してください',
                  onDueDateTimeSelected: (DueDateTime value) {
                    ref
                        .read(addingTodoViewModelProvider.notifier)
                        .setDueDateTime(value);
                  }),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: state.isValid
            ? Theme.of(context).floatingActionButtonTheme.backgroundColor
            : Colors.grey,
        onPressed: () {
          if (!state.isValid) return;
          Navigator.pop(
            context,
            state.toTodoItem(),
          );
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
