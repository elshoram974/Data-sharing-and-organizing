import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../exceptions/http_exception.dart';
import '../functions/handle_request_errors.dart';

class APIServices {
  const APIServices();

  Future<Map<String, dynamic>> post(
    final String link,
    final Map<String, dynamic> body,
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
    required final String filePath,
    required final Map<String, dynamic> body,
    required final http.Client client,
    required final void Function(int sent, int total) onProgress,
  }) async {
    final http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(link));

    body.forEach((key, value) => request.fields[key] = value);

    final http.MultipartFile file = await http.MultipartFile.fromPath(fieldName, filePath);

    request.files.add(file);
    http.StreamedResponse response = await handleRequestErrors<http.StreamedResponse>(
      () async {
        http.StreamedResponse sR = await client.send(request);
        sR.stream.listen((List<int> chunk) {
          final double progress = sR.contentLength == null ? 0.0 : chunk.length / sR.contentLength!;
          onProgress(sR.contentLength! * progress.toInt(), sR.contentLength!);
        });
        return sR;
      },
    );

    if (response.statusCode != 200) {
      throw MyHttpException.badResponse(
        statusCode: response.statusCode,
        response: response,
      );
    }

    return jsonDecode(await response.stream.bytesToString());
  }
}
