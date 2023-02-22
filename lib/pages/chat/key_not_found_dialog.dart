import 'package:flutter/material.dart';
import 'package:my_chat/pages/home/setting_dialog.dart';

/// 未设置密钥对话框
class KeyNotFoundDialog extends StatelessWidget  {
  const KeyNotFoundDialog({ super.key });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text("设置密钥后才能发送信息，是否立即设置？"),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("否")
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            showDialog(
              context: context,
              builder: (context) => SettingDialog()
            );
          },
          child: const Text("是")
        )
      ]
    );
  }
}
