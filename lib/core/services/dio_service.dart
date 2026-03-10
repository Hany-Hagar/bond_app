import 'package:dio/dio.dart';
import '../../const_data/api_const_data.dart';

class DioService {
  final Dio _dio;

  DioService()
    : _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          receiveDataWhenStatusError: true,
          validateStatus: (status) => status! < 500,
          connectTimeout: const Duration(seconds: 10),
        ),
      );

  Future<Response> get({
    required String url,
    Map<String, dynamic>? headers,
  }) async {
    return await _dio.get(url, options: Options(headers: headers));
  }

  Future<Response> post({
    required String url,
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    return await _dio.post(
      url,
      data: data,
      options: Options(headers: headers),
    );
  }

  Future<Response> put({
    required String url,
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    return await _dio.put(
      url,
      data: data,
      options: Options(headers: headers),
    );
  }

  Future<Response> delete({
    required String url,
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    return await _dio.delete(
      url,
      data: data,
      options: Options(headers: headers),
    );
  }
}
