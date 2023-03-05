import 'package:flutter/material.dart';
import 'package:my_chat/settings/settings.dart';

/// 设置密钥对话框
class SetKeyDialog extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  SetKeyDialog({ super.key });

  static Future show(BuildContext context) {
    return showDialog(context: context, builder: (context) => SetKeyDialog());
  }

  void onCancel(BuildContext context) {
    Navigator.of(context).pop(false);
  }

  void onConfirm(BuildContext context) {
    settings.key = _textEditingController.text;
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    _textEditingController.text = settings.key;

    return AlertDialog(
      title: const Text("设置密钥"),
      content: TextField(
        controller: _textEditingController,
      ),
      actions: [
        TextButton(
          onPressed: () => onCancel(context),
          child: const Text("取消")
        ),
        TextButton(
          onPressed: () => onConfirm(context),
          child: const Text("确定")
        )
      ]
    );
  }
}