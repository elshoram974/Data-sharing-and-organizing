import 'package:dio/dio.dart';

class APIServices {
  const APIServices(this.dio);
  final Dio dio;

  Future<Map<String, dynamic>> get(final String link) async {
    final Response response = await dio.get(link);
    return response.data;
  }
}
