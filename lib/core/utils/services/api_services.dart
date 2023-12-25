import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:data_sharing_organizing/core/utils/enums/http_exception_type_enum.dart';
import 'package:http/http.dart' as http;

import '../exceptions/http_exception.dart';

class APIServices {
  const APIServices();

  // Future<Map<String, dynamic>> get(final String link) async {
  //   final Response response = await dio.get(link);
  //   return response.data;
  // }

  // Future<Map<String, dynamic>> post(
  //   final String link,
  //   Map<String, dynamic> body,
  // ) async {
  //   final Response response = await dio.post(link, data: body);
  //   return response.data;
  // }
  Future<Map<String, dynamic>> post(
    final String link,
    Map<String, dynamic> body,
  ) async {
    http.Response response = await _handleRequestErrors<http.Response>(
      () => http.post(Uri.parse(link), body: body),
    );

    if (response.statusCode != 200) {
      throw MyHttpException(
        type: HttpExceptionType.badResponse,
        response: response,
      );
    }

    return jsonDecode(response.body);
  }

  Future<T> _handleRequestErrors<T>(
    Future<T> Function() function,
  ) async {
    try {
      return await function();
    } catch (e) {
      if (e is TimeoutException) {
        throw MyHttpException(type: HttpExceptionType.connectionTimeout);
      } else if (e is SocketException) {
        throw MyHttpException(type: HttpExceptionType.connectionError);
      } else {
        throw MyHttpException(type: HttpExceptionType.unknown);
      }
    }
  }
}
