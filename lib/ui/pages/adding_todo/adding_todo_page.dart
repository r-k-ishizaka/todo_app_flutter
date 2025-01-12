import 'package:flutter/material.dart';
import 'package:todo_app/domain/models/todo_item.dart';
import 'package:todo_app/domain/models/types/due_date_time.dart';
import 'package:todo_app/ui/components/due_date_time_input_form_widget.dart';
import 'package:todo_app/ui/components/text_input_widget.dart';

/// To-Do 追加画面
class AddingTodoPage extends StatefulWidget {
  const AddingTodoPage({super.key, required this.title});

  final String title;

  @override
  State<AddingTodoPage> createState() => _AddingTodoPageState();
}

class _AddingTodoPageState extends State<AddingTodoPage> {
  final TextEditingController _titleController = TextEditingController();
  DueDateTime? dueDateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('タイトル', style: Theme.of(context).textTheme.labelLarge),
              TextInputWidget(
                  controller: _titleController, hintText: 'タイトルを入力してください'),

              Text('締切日時', style: Theme.of(context).textTheme.labelLarge),
              DueDateTimeInputWidget(
                  dueDateTime: dueDateTime,
                  hintText: '締切日時を選択してください',
                  onDueDateTimeSelected: (DueDateTime value) {
                    setState(() {
                      dueDateTime = value;
                    });
                  }),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (dueDateTime == null || _titleController.text.isEmpty) {
            return;
          }
          Navigator.pop(
            context,
            TodoItem(
                title: _titleController.text,
                isCompleted: false,
                dueDateTime: dueDateTime!),
          );
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
