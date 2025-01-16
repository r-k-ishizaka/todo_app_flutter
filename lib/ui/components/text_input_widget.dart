import 'package:flutter/material.dart';

import '../../domain/validators/validator.dart';

/// テキスト入力フォームウィジェット
class TextInputWidget extends StatelessWidget {
  const TextInputWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
  });

  /// コントローラー
  final TextEditingController controller;

  /// ヒントテキスト
  final String hintText;

  /// バリデータ
  final Validator validator;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextFormField(
        controller: controller,
        decoration: InputDecoration(
            border: InputBorder.none, isDense: true, contentPadding: EdgeInsets.zero, hintText: hintText, counterText: ''),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (String? value) {
          final result = validator.validate(controller.text);
          return result.when(
            success: () => null,
            error: (message) => message,
          );
        },
        maxLength: 100,
      ),
      Divider(),
    ]);
  }
}
