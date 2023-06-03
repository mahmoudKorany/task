import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static get() {
    dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: 'https://jsonplaceholder.typicode.com/',
      ),
    );
  }

  static Future<Response> getData({
    required String url,
  }) async {
    return await dio!.get(
      url,
    );
  }
}
