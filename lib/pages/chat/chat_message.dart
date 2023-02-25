import 'package:flutter/material.dart';

import '../../models/message.dart';
import 'chat_item.dart';

/// 聊天信息组件
class ChatMessage extends StatefulWidget {
  final List<Message> messageList;

  const ChatMessage({ super.key, required this.messageList });

  @override
  State<StatefulWidget> createState() => ChatMessageState();
}

class ChatMessageState extends State<ChatMessage> {
  final ScrollController _scrollController = ScrollController();

  /// 滑动到底部
  void scrollToEnd() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.linear,);
    });
  }

  /// 隐藏键盘
  void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: hideKeyboard,
        child: Container(
          decoration: const BoxDecoration(),
          child: Stack(
            children: [
              ListView.builder(
                reverse: true,
                shrinkWrap: true,
                controller: _scrollController,
                itemCount: widget.messageList.length,
                itemBuilder: (context, index) => ChatItem(message: widget.messageList[index])
              )
            ]
          )
        )
      )
    );
  }
}
