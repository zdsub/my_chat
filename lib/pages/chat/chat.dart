import 'package:flutter/material.dart';
import 'package:my_chat/enums/message_type.dart';
import 'package:my_chat/models/message.dart';
import 'package:my_chat/pages/chat/chat_input.dart';
import 'package:my_chat/pages/chat/chat_message.dart';

/// 聊天页面
class ChatPage extends StatefulWidget {
  const ChatPage({ super.key });

  @override
  State<StatefulWidget> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final GlobalKey<ChatMessageState> _globalKey = GlobalKey();
  final List<Message> messageList = [
    Message(text: "Hello7", type: MessageType.ai),
    Message(text: "你好7", type: MessageType.human),
    Message(text: "Hello6", type: MessageType.ai),
    Message(text: "你好6", type: MessageType.human),
    Message(text: "Hello5", type: MessageType.ai),
    Message(text: "你好5", type: MessageType.human),
    Message(text: "Hello4", type: MessageType.ai),
    Message(text: "你好4", type: MessageType.human),
    Message(text: "Hello3", type: MessageType.ai),
    Message(text: "你好3", type: MessageType.human),
    Message(text: "Hello2", type: MessageType.ai),
    Message(text: "你好2", type: MessageType.human),
    Message(text: "Hello1", type: MessageType.ai),
    Message(text: "你好1", type: MessageType.human),
  ];

  void addMessage(Message message) {
    setState(() => messageList.insert(0, message));
    _globalKey.currentState?.scrollToEnd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("会话1"),
      ),
      body: Column(
        children: [
          ChatMessage(messageList: messageList, key: _globalKey),
          ChatInput(onSend: addMessage)
        ]
      )
    );
  }
}
