import 'package:flutter/material.dart';
import 'package:my_chat/pages/setting/setting/setting.dart';

/// 未设置密钥对话框
class KeyNotFoundDialog extends StatelessWidget  {
  const KeyNotFoundDialog({ super.key });

  static void show(BuildContext context) {
    showDialog(context: context, builder: (context) => const KeyNotFoundDialog());
  }

  void onNo(BuildContext context) {
    Navigator.of(context).pop();
  }

  void onYes(BuildContext context) {
    Navigator.of(context).pop();
    SettingPage.show(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text("设置密钥后才能发送消息，是否立即设置？"),
      actions: [
        TextButton(
          onPressed: () => onNo(context),
          child: const Text("否")
        ),
        TextButton(
          onPressed: () => onYes(context),
          child: const Text("是")
        )
      ]
    );
  }
}
