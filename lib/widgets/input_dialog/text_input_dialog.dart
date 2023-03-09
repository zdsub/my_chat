import 'package:flutter/material.dart';

import 'input_dialog.dart';

/// 文本输入对话框
class TextInputDialog extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  final String title;
  final String content;
  final int maxLength;

  TextInputDialog({ super.key, required this.title, required this.content, this.maxLength = 256 });

  @override
  Widget build(BuildContext context) {
    _textEditingController.text = content;

    return InputDialog(
      title: title,
      content: TextField(
        controller: _textEditingController,
        maxLength: maxLength,
        decoration: const InputDecoration(
          counterText: ""
        )
      ),
      onConfirm: () => _textEditingController.text
    );
  }
}
