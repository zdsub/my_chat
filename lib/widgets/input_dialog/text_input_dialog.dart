import 'package:flutter/material.dart';

import 'input_dialog.dart';

/// 文本输入对话框
class TextInputDialog extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  final String title;
  final String content;

  TextInputDialog({ super.key, required this.title, required this.content });

  @override
  Widget build(BuildContext context) {
    _textEditingController.text = content;

    return InputDialog(
      title: title,
      content: TextField(
        controller: _textEditingController,
      ),
      onConfirm: () => _textEditingController.text
    );
  }
}
