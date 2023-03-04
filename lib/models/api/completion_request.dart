// ChatGPT请求数据
class CompletionRequest {
  String model;
  String prompt;
  int? max_tokens;
  double? temperature;
  double? top_p;
  // double? frequency_enalty;
  // double? presence_penalty;
  // List<String>? stop;

  CompletionRequest({
    required this.model,
    required this.prompt,
    required this.max_tokens,
    required this.temperature,
    required this.top_p,
    // required this.frequency_enalty,
    // required this.presence_penalty,
    // this.stop
  });

  Map<String, dynamic> toJson() =>
    <String, dynamic>{
      'model': model,
      'prompt': prompt,
      'max_tokens': max_tokens,
      'temperature': temperature,
      'top_p': top_p,
      // 'frequency_penalty': frequency_enalty,
      // 'presence_penalty': presence_penalty,
      // "stop": stop
    };
}
