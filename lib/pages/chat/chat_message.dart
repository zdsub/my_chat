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

  @override
  void initState() {
    super.initState();

  }

  /// 滑动到底部
  void scrollToEnd() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.messageList.length,
        itemBuilder: (context, index) => ChatItem(message: widget.messageList[index])
      )
    );
  }
}
