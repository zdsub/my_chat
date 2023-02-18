import 'package:flutter/material.dart';
import 'package:my_chat/enums/message_type.dart';
import 'package:my_chat/models/message.dart';
import 'package:my_chat/pages/chat/chat_item.dart';
import 'package:my_chat/services/chat_service.dart';

/// 聊天页面
class ChatPage extends StatefulWidget {
  const ChatPage({ super.key });

  @override
  State<StatefulWidget> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Message> messageList = [
    Message(text: "你好", type: MessageType.human),
    Message(text: "Hello", type: MessageType.ai)
  ];
  final TextEditingController _textEditingController = TextEditingController();

  void onSend() async {
    final text = _textEditingController.text;
    _textEditingController.clear();

    setState(() {
      messageList.add(Message(
          text: text,
          type: MessageType.human
      ));
    });

    final message = await ChatService.sendMessage(text);
    setState(() {
      messageList.add(Message(
          text: message,
          type: MessageType.ai
      ));
    });
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
              itemBuilder: (context, index) => ChatItem(message: messageList[index])
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
