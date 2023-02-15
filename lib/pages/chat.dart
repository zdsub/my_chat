import 'package:flutter/material.dart';
import 'package:my_chat/api/chatgpt.dart';
import 'package:my_chat/enums/message_type.dart';
import 'package:my_chat/models/message.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<StatefulWidget> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Message> messageList = [];
  final TextEditingController _textEditingController = TextEditingController();

  void onSend() async {
    var text = _textEditingController.text;
    _textEditingController.clear();

    setState(() {
      messageList.add(Message(
          text: text,
          type: MessageType.human
      ));
    });

    //var data = await ChatGPTApi.chat(text);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("会话1"),
        ),
        body: Column(children: [
          Expanded(
            child: ListView.builder(
              itemCount: messageList.length,
              itemBuilder: (context, index) => Text(messageList[index].text),
            )
          ),
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
