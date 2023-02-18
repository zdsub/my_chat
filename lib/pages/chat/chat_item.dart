import 'package:flutter/material.dart';
import 'package:my_chat/enums/message_type.dart';

import '../../models/message.dart';

/// 聊天内容组件
class ChatItem extends StatelessWidget {
  Message message;

  ChatItem({ super.key, required this.message });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: message.type == MessageType.human ? Colors.white : const Color.fromARGB(12, 0, 0, 0)
      ),
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Row(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Image(
              height: 48,
              width: 48,
              image: AssetImage("assets/${message.type == MessageType.human ? "human" : "ai" }.png")
            )
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 16),
              child: Text(message.text)
            )
          )
        ]
      )
    );
  }

}