import 'package:my_chat/models/api/completion_request.dart';
import 'package:my_chat/models/api/completion_response.dart';
import 'package:my_chat/utils/dio.dart';

final openaiApi = OpenaiApi();

/// OpenAI API请求类
class OpenaiApi {
  Future<CompletionResponse> completions(CompletionRequest completionRequest) async {
    final response = await dio.post("/completions", data: completionRequest);
    print(response.data);
    return CompletionResponse.fromJson(response.data);
  }
}
