import 'package:flutter/material.dart';

/// テキスト入力フォームウィジェット
class TextInputWidget extends StatelessWidget {
  const TextInputWidget({
    super.key,
    required this.controller,
    required this.hintText,
  });

  /// コントローラー
  final TextEditingController controller;
  /// ヒントテキスト
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.zero,
          hintText: hintText,
        ),
      ),
      Divider(),
    ]);
  }
}
