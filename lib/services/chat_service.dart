import 'package:my_chat/api/chat_api.dart';
import 'package:my_chat/models/api/chat_request.dart';

class ChatService {
  static Future<String> sendMessage(String message) async {
    final chatRequest = ChatRequest(
        model: "text-davinci-003",
        prompt: message,
        temperature: 0.9,
        max_tokens: 150,
        top_p: 1,
        frequency_enalty: 0.0,
        presence_penalty: 0.6
    );
    final chatResponse = await ChatApi.send(chatRequest);
    return chatResponse.choices[0].text.trim();
  }
}