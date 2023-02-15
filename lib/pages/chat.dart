import 'package:flutter/material.dart';
import 'package:my_chat/api/chatgpt.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<StatefulWidget> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textEditingController = TextEditingController();
  String _text = "";

  void onSend() async {
    var message = _textEditingController.text;
    _textEditingController.clear();
    var data = await ChatGPTApi.chat(message);
    setState(() => _text = data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("会话1"),
        ),
        body: Column(children: [
          Expanded(child: Center(child: Text(_text))),
          Row(children: [
            Expanded(
              child: TextField(
                controller: _textEditingController,
            )),
            TextButton(onPressed: onSend, child: const Text("发送"))
          ])
        ]));
  }
}
