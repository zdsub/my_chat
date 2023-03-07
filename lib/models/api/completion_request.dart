// Completions请求模型
class CompletionRequest {
  String model;
  String? prompt;
  int? max_tokens;
  double? temperature;
  double? top_p;
  double? frequency_enalty;
  double? presence_penalty;
  List<String>? stop;
  int? best_of;

  CompletionRequest({
    required this.model,
    this.prompt,
    this.max_tokens,
    this.temperature,
    this.top_p,
    this.frequency_enalty,
    this.presence_penalty,
    this.stop,
    this.best_of
  });

  Map<String, dynamic> toJson() =>
    <String, dynamic>{
      "model": model,
      "prompt": prompt,
      "max_tokens": max_tokens,
      "temperature": temperature,
      "top_p": top_p,
      "frequency_penalty": frequency_enalty,
      "presence_penalty": presence_penalty,
      "stop": stop,
      "best_of": best_of
    };
}
