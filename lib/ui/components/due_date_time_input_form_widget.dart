import 'package:flutter/material.dart';

import '../../domain/models/types/due_date_time.dart';

/// 締切日時入力フォームウィジェット
class DueDateTimeInputWidget extends StatelessWidget {
  const DueDateTimeInputWidget({
    super.key,
    required this.dueDateTime,
    required this.hintText,
    required this.onDueDateTimeSelected,
  });

  /// 締切日時
  final DueDateTime? dueDateTime;
  /// ヒントテキスト
  final String hintText;
  /// 締切日時選択時のコールバック
  final void Function(DueDateTime) onDueDateTimeSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            showDatePicker(
              context: context,
              firstDate: DateTime.now(),
              lastDate: DateTime.now().copyWith(year: DateTime.now().year + 1),
              initialDate: dueDateTime?.dateTime ?? DateTime.now(),
            ).then((DateTime? value) {
              if (value != null) {
                onDueDateTimeSelected(DueDateTime(value));
              }
            });
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8,
            children: <Widget>[
              const Icon(Icons.calendar_today),
              Text(dueDateTime?.formattedString() ?? hintText),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
