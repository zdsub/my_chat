import 'package:flutter/material.dart';

import '../../enums/message_type.dart';
import '../../models/message.dart';
import '../../models/setting.dart';
import '../../services/chat_service.dart';
import 'key_not_found_dialog.dart';

/// 聊天输入组件
class ChatInput extends StatefulWidget {
  final ValueChanged<Message> onSend;

  const ChatInput({ super.key, required this.onSend });

  @override
  State<StatefulWidget> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  bool sendButtonEnable = false;
  final TextEditingController _textEditingController = TextEditingController();

  void onSend() async {
    // 判断是否设置密钥
    if (Setting.key.isEmpty) {
      KeyNotFoundDialog.show(context);
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
              maxLength: 255,
              onChanged: onChange,
              decoration: InputDecoration(
                counterText: "",
                contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(30),
                )
              )
            )
          ),
          Container(
            margin: const EdgeInsets.only(left: 4),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                )),
                backgroundColor: MaterialStateProperty.all(Colors.blue[sendButtonEnable ? 500 : 200]),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                elevation: MaterialStateProperty.all(0)
              ),
              onPressed: sendButtonEnable ? onSend : null,
              child: const Text("发送")
            )
          )
        ]
      )
    );
  }
}
