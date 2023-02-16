import 'package:flutter/material.dart';
import 'package:my_chat/pages/chat.dart';
import 'package:my_chat/pages/home/setting_dialog.dart';

/// 主页面
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat GPT"),
        actions: [
          IconButton(
            onPressed: () =>
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatPage())),
            icon: const Icon(Icons.add)),
          IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (context) => SettingDialog()
            ),
            icon: const Icon(Icons.settings)),
        ]),
      body: const Center(
        child: Text("Hello World")
      )
    );
  }
}
