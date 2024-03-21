import 'dart:async';
import 'dart:convert';


import 'package:http/http.dart' as http;

import '../exceptions/http_exception.dart';
import '../functions/handle_request_errors.dart';
import 'pick_image.dart';

class APIServices {
  const APIServices();

  Future<Map<String, dynamic>> post(
    final String link,
    final Map<String, String?> body,
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

  Future<Map<String, dynamic>> uploadFile({
    required final String link,
    required final String fieldName,
    required final MyFileData  fileToUpload,
    required final Map<String, String> body,
  }) async {
    final http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse(link));

    request.fields.addAll(body);

    final http.MultipartFile file = http.MultipartFile.fromBytes(
      fieldName,
      fileToUpload.file,
      filename: '${fileToUpload.nameWithoutExt}.${fileToUpload.ext}',
    );

    request.files.add(file);

    http.StreamedResponse streamedResponse = await request.send();
    http.Response response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode != 200) {
      throw MyHttpException.badResponse(
        statusCode: response.statusCode,
        response: response,
      );
    }

    return jsonDecode(response.body);
  }
}
