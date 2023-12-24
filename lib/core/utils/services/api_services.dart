import 'package:dio/dio.dart';

class APIServices {
  const APIServices(this.dio);
  final Dio dio;

  Future<Map<String, dynamic>> get(final String link) async {
    final Response response = await dio.get(link);
    return response.data;
  }

  Future<Map<String, dynamic>> post(
    final String link,
    Map<String, dynamic> body,
  ) async {
    final Response response = await dio.post(link, data: body);
    return response.data;
  }
}
