import 'package:my_chat/enums/message_type.dart';

/// 封装聊天信息
class Message {
  Message({ required this.text, required this.type });

  String text;
  MessageType type;
}