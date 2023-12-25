import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../exceptions/http_exception.dart';
import '../functions/handle_request_errors.dart';

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
    http.Response response = await handleRequestErrors<http.Response>(
      () => http.post(Uri.parse(link), body: body),
    );

    final Map<String, dynamic> res = jsonDecode(response.body);

    if (response.statusCode != 200) {
      throw MyHttpException.badResponse(
        statusCode: response.statusCode,
        response: response,
      );
    }

    return res;
  }
}
