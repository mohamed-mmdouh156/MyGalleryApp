import 'package:dio/dio.dart';
import 'package:my_gallery/constants/constants.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({required String url, Map<String, dynamic>? query}) async {
    return await dio!.get(url, queryParameters: query??{});
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> body,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
    };
    return await dio!.post(url, data: body);
  }


  static Future<Response> postImage({
    required String url,
    Map<String, dynamic>? query,
    required FormData body,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
    };
    return await dio!.post(url, data: body);
  }
}