import 'package:my_chat/utils/dio.dart';

class ChatGPTApi {
  static Future<String> chat(String message) async {
    var response = await dio.post("", data: {
      "model": "text-davinci-003",
      "prompt": message,
      "temperature": 0.9,
      "max_tokens": 150,
      "top_p": 1,
      "frequency_penalty": 0.0,
      "presence_penalty": 0.6
    });
    print(response);
    return response.data.toString();
  }
}