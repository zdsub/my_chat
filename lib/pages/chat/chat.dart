import 'package:flutter/material.dart';
import 'package:my_chat/enums/message_type.dart';
import 'package:my_chat/models/message.dart';
import 'package:my_chat/models/setting.dart';
import 'package:my_chat/pages/chat/chat_item.dart';
import 'package:my_chat/pages/chat/key_not_found_dialog.dart';
import 'package:my_chat/services/chat_service.dart';

/// 聊天页面
class ChatPage extends StatefulWidget {
  const ChatPage({ super.key });

  @override
  State<StatefulWidget> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Message> messageList = [
    Message(text: "你好1", type: MessageType.human),
    Message(text: "Hello1", type: MessageType.ai),
    Message(text: "你好2", type: MessageType.human),
    Message(text: "Hello2", type: MessageType.ai),
    Message(text: "你好3", type: MessageType.human),
    Message(text: "Hello3", type: MessageType.ai),
    Message(text: "你好4", type: MessageType.human),
    Message(text: "Hello4", type: MessageType.ai),
    Message(text: "你好5", type: MessageType.human),
    Message(text: "Hello5", type: MessageType.ai),
    Message(text: "你好6", type: MessageType.human),
    Message(text: "Hello6", type: MessageType.ai),
    Message(text: "你好7", type: MessageType.human),
    Message(text: "Hello7", type: MessageType.ai)
  ];
  final TextEditingController _textEditingController = TextEditingController();

  void onSend(BuildContext context) async {
    if (Setting.key == null) {
      showDialog(
        context: context,
        builder: (context) => KeyNotFoundDialog()
      );
      return;
    }

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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messageList.length,
              itemBuilder: (context, index) => ChatItem(message: messageList[index])
            )
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                    )
                  ),
                  controller: _textEditingController,
                )
              ),
              ElevatedButton(
                onPressed: () => onSend(context),
                child: const Text("发送")
              )
            ]
          )
        ]
      )
    );
  }
}
