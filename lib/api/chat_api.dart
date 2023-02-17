import 'package:my_chat/models/api/chat_request.dart';
import 'package:my_chat/models/api/chat_response.dart';
import 'package:my_chat/utils/dio.dart';

/// ChatGPT请求类
class ChatApi {
  static Future<ChatResponse> send(ChatRequest chatRequest) async {
    final response = await dio.post("", data: chatRequest);
    return ChatResponse.fromJson(response.data);

  }
}