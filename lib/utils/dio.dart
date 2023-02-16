import 'package:dio/dio.dart';
import '../models/setting.dart';

final dio = createDio();

Dio createDio() {
  final dio = Dio(BaseOptions(
    baseUrl: "https://api.openai.com/v1/completions",
    contentType: "application/json"
  ));
  
  dio.interceptors.add(MyInterceptors());

  return dio;
}

class MyInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    if (Setting.key != null) {
      options.headers["Authorization"] = "Bearer ${Setting.key}";
    }

    super.onRequest(options, handler);
  }
}
