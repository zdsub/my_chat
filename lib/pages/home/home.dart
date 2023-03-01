import 'package:flutter/material.dart';
import 'package:my_chat/pages/chat/chat.dart';
import 'package:my_chat/pages/home/setting_dialog.dart';
import 'package:my_chat/pages/setting/setting.dart';

/// 主页面
class HomePage extends StatelessWidget {
  const HomePage({ super.key });

  void onChat(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatPage()));
  }

  void onSetting(BuildContext context) {
    // SettingDialog.show(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat GPT"),
        actions: [
          IconButton(
            onPressed: () => onChat(context),
            icon: const Icon(Icons.add)),
          IconButton(
            onPressed: () => onSetting(context),
            icon: const Icon(Icons.settings)),
        ]),
      body: const Center(
        child: Text("Hello World")
      )
    );
  }
}
