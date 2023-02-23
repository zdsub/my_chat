import 'package:my_chat/enums/message_type.dart';

/// 聊天信息
class Message {
  Message({ required this.text, required this.type });

  String text;
  MessageType type;
}
