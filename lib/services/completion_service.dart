import 'package:my_chat/api/chat_api.dart';
import 'package:my_chat/models/api/completion_request.dart';
import 'package:my_chat/settings/settings.dart';

final completionService = CompletionService();

/// 聊天业务
class CompletionService {
  Future<String> sendMessage(String message) async {
    final completionRequest = CompletionRequest(
      prompt: message,
      max_tokens: settings.completion.max_tokens,
      model: settings.completion.model,
      temperature: settings.completion.temperature,
      top_p: settings.completion.top_p,
      frequency_enalty: settings.completion.frequency_penalty,
      presence_penalty: settings.completion.presence_penalty,
      stop: settings.completion.stop.isNotEmpty ? settings.completion.stop : null,
      best_of: settings.completion.best_of
    );
    final completionResponse = await chatApi.completions(completionRequest);
    return completionResponse.choices[0].text.trim();
  }
}
