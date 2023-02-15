import 'package:my_chat/enums/message_type.dart';

class Message {
  Message({ required this.text, required this.type });

  String text;
  MessageType type;
}