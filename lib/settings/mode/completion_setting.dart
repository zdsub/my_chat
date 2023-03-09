import '../settings.dart';

/// Completions配置信息
class CompletionSetting {
  static const List<String> modelList = ["text-davinci-003", "text-davinci-002", "code-davinci-002"];

  String _model = sharedPreferences.getString("completion.model") ?? "text-davinci-003";
  int _max_tokens = sharedPreferences.getInt("completion.max_tokens") ?? 256;
  double _temperature = sharedPreferences.getDouble("completion.temperature") ?? 0.9;
  double _top_p = sharedPreferences.getDouble("completion.top_p") ?? 1;
  double _frequency_penalty = sharedPreferences.getDouble("completion.frequency_penalty") ?? 0.0;
  double _presence_penalty = sharedPreferences.getDouble("completion.presence_penalty") ?? 0.6;
  List<String> _stop = sharedPreferences.getStringList("completion.stop") ?? [];
  int _best_of = sharedPreferences.getInt("completion.best_of") ?? 1;

  String get model => _model;

  set model(String value) {
    if (_model != value) {
      _model = value;
      sharedPreferences.setString("completion.model", value);
    }
  }

  int get max_tokens => _max_tokens;

  set max_tokens(int value) {
    if (_max_tokens != value) {
      _max_tokens = value;
      sharedPreferences.setInt("completion.max_tokens", value);
    }
  }

  double get temperature => _temperature;

  set temperature(double value) {
    if (_temperature != value) {
      _temperature = value;
      sharedPreferences.setDouble("completion.temperature", value);
    }
  }

  double get top_p => _top_p;

  set top_p(double value) {
    if (_top_p != value) {
      _top_p = value;
      sharedPreferences.setDouble("completion.top_p", value);
    }
  }

  double get frequency_penalty => _frequency_penalty;

  set frequency_penalty(double value) {
    if (_frequency_penalty != value) {
      _frequency_penalty = value;
      sharedPreferences.setDouble("completion.frequency_penalty", value);
    }
  }

  double get presence_penalty => _presence_penalty;

  set presence_penalty(double value) {
    if (_presence_penalty != value) {
      _presence_penalty = value;
      sharedPreferences.setDouble("completion.presence_penalty", value);
    }
  }

  List<String> get stop => _stop;

  set stop(List<String> value) {
    if (_stop != value) {
      _stop = value;
      sharedPreferences.setStringList("completion.stop", value);
    }
  }

  int get best_of => _best_of;

  set best_of(int value) {
    if (_best_of != value) {
      _best_of = value;
      sharedPreferences.setInt("completion.best_of", value);
    }
  }
}
