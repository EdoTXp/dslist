import 'package:dio/dio.dart';
import 'package:frontend/api/api.dart';

class GameApi implements Api {
  final String baseUrl;
  late final Dio _dio;

  GameApi({
    required this.baseUrl,
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: Duration(
          seconds: 5,
        ),
      ),
    );
  }

  @override
  Future<Response> get(String path) async {
    return _dio.get(path);
  }

  @override
  Future<Response> post(String path, dynamic data) async {
    return _dio.post(path, data: data);
  }
}
