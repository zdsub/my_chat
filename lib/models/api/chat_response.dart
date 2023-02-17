/// ChatGPT响应数据
class ChatResponse {
  String id;
  String object;
  int created;
  String model;
  List<_Choices> choices;
  _Usage usage;

  ChatResponse.fromJson(Map<String, dynamic> json) :
    id = json["id"],
    object = json["object"],
    created = json["created"],
    model = json["model"],
    choices = _Choices.create(json["choices"]),
    usage = _Usage.fromJson(json["usage"]);
}

class _Choices {
  String text;
  int index;
  dynamic logprobs;
  String finish_reason;

  _Choices.fromJson(Map<String, dynamic> json) :
    text = json["text"],
      index = json["index"],
      logprobs = json["logprobs"],
      finish_reason = json["finish_reason"];

  static List<_Choices> create(List<dynamic> jsonList) {
    final list = <_Choices>[];
    for (final json in jsonList) {
      list.add(_Choices.fromJson(json));
    }
    return list;
  }
}

class _Usage {
  int prompt_tokens;
  int completion_tokens;
  int total_tokens;

  _Usage.fromJson(Map<String, dynamic> json) :
    prompt_tokens = json["prompt_tokens"],
    completion_tokens = json["completion_tokens"],
    total_tokens = json["total_tokens"];
}
