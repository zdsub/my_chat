import 'package:dio/dio.dart';
import '../settings/setting.dart';

final dio = createDio();

// 创建自定义dio实例
Dio createDio() {
  final dio = Dio(BaseOptions(
    baseUrl: "https://api.openai.com/v1",
    contentType: "application/json"
  ));
  
  dio.interceptors.add(MyInterceptors());

  return dio;
}

/// 自定义dio拦截器
class MyInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Authorization"] = "Bearer ${settings.key}";
    super.onRequest(options, handler);
  }
}
