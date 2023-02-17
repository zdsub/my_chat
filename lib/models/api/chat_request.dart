// ChatGPT请求数据
class ChatRequest {
  String model;
  String prompt;
  double temperature;
  int max_tokens;
  int top_p;
  double frequency_enalty;
  double presence_penalty;
  // List<String> stop;

  ChatRequest({
    required this.model,
    required this.prompt,
    required this.temperature,
    required this.max_tokens,
    required this.top_p,
    required this.frequency_enalty,
    required this.presence_penalty }
  );

  Map<String, dynamic> toJson() =>
      <String, dynamic>{
        'model': model,
        'prompt': prompt,
        'temperature': temperature,
        'max_tokens': max_tokens,
        'top_p': top_p,
        'frequency_penalty': frequency_enalty,
        'presence_penalty': presence_penalty,
      };
}