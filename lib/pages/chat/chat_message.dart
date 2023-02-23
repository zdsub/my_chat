import 'package:flutter/material.dart';

import '../../models/message.dart';
import 'chat_item.dart';

/// 聊天信息组件
class ChatMessage extends StatefulWidget {
  final List<Message> messageList;

  const ChatMessage({ super.key, required this.messageList });

  @override
  State<StatefulWidget> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.messageList.length,
        itemBuilder: (context, index) => ChatItem(message: widget.messageList[index])
      )
    );
  }
}
