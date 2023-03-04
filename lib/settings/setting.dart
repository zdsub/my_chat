final settings = Setting();

/// 配置信息
class Setting {
  String key = "";
  final _CompletionSetting completion = _CompletionSetting();
}

/// Completions配置信息
class _CompletionSetting {
  String model = "text-davinci-003";
  int? max_tokens;
  double? temperature;
  double? top_p;
}
