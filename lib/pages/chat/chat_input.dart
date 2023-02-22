import 'package:flutter/material.dart';

import '../../enums/message_type.dart';
import '../../models/message.dart';
import '../../models/setting.dart';
import '../../services/chat_service.dart';
import 'key_not_found_dialog.dart';

class ChatInput extends StatefulWidget {
  ValueChanged<Message> onSend;

  ChatInput({ super.key, required this.onSend });

  @override
  State<StatefulWidget> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  bool sendButtonEnable = false;
  final TextEditingController _textEditingController = TextEditingController();

  void onSend(BuildContext context) async {
    // 判断是否设置密钥
    if (Setting.key == null) {
      showDialog(
          context: context,
          builder: (context) => KeyNotFoundDialog()
      );
      return;
    }

    // 获取并清空文本
    var text = _textEditingController.text;
    _textEditingController.clear();
    setState(() => sendButtonEnable = false);

    // 添加发送消息
    widget.onSend(Message(
      text: text,
      type: MessageType.human
    ));

    // 添加回复消息
    text = await ChatService.sendMessage(text);
    widget.onSend(Message(
      text: text,
      type: MessageType.ai
    ));
  }

  void onChange(String text) {
    if (!text.isEmpty && !sendButtonEnable) {
      setState(() => sendButtonEnable = true);
    } else if (text.isEmpty && sendButtonEnable) {
      setState(() => sendButtonEnable = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 1, color: Color.fromARGB(16, 0, 0, 0))
        )
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textEditingController,
              onChanged: onChange,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30)
                )
              )
            )
          ),
          Container(
            margin: const EdgeInsets.only(left: 8),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ))
              ),
              onPressed: sendButtonEnable ? () => onSend(context) : null,
              child: const Text("发送")
            )
          )
        ]
      )
    );
  }
}
