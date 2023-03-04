import 'package:my_chat/models/api/completion_request.dart';
import 'package:my_chat/models/api/completion_response.dart';
import 'package:my_chat/utils/dio.dart';

final chatApi = ChatApi();

/// ChatGPT请求类
class ChatApi {
  Future<CompletionResponse> completions(CompletionRequest completionRequest) async {
    final response = await dio.post("/completions", data: completionRequest);
    print(response.data);
    return CompletionResponse.fromJson(response.data);
  }
}
