import 'package:flutter/material.dart';

/// 输入对话框
class InputDialog extends StatelessWidget {
  final String title;
  final Widget content;
  final dynamic Function() onConfirm;

  const InputDialog({ super.key, required this.title, required this.content, required this.onConfirm });

  void onCancel(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onConfirm(BuildContext context) {
    Navigator.of(context).pop(onConfirm());
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: content,
      actions: [
        TextButton(
          onPressed: () => onCancel(context),
          child: const Text("取消")
        ),
        TextButton(
          onPressed: () => _onConfirm(context),
          child: const Text("确定")
        )
      ]
    );
  }
}
