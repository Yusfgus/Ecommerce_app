import 'package:dio/dio.dart';


class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://dummyjson.com/products',
        receiveDataWhenStatusError: true,
      ),
    );
  }
  static Future<Response?> getData({
    required String url,
    required Map<String, dynamic> model,
  }) async => await dio?.get(
    url,
    queryParameters: model,
  );
}
