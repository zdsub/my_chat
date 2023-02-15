import 'package:dio/dio.dart';

final _options = BaseOptions(
  baseUrl: "https://api.openai.com/v1/completions",
  headers: {
    "Authorization": "Bearer "
  },
  contentType: "application/json"
);

final dio = Dio(_options);