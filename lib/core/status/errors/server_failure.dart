// ! Failure --------------------------

import 'package:dio/dio.dart';

import 'failure.dart';

class ServerFailure extends Failure {
  ServerFailure(super.error);
  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('connectionTimeout');

      case DioExceptionType.badCertificate:
        return ServerFailure('badCertificate');

      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(e.response!);

      case DioExceptionType.cancel:
        return ServerFailure('cancel');

      case DioExceptionType.connectionError:
        return ServerFailure('no internet connection');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('receiveTimeout');

      case DioExceptionType.sendTimeout:
        return ServerFailure('sendTimeout');
      case DioExceptionType.unknown:
      default:
        return ServerFailure('e : ${e.message}');
    }
  }

  factory ServerFailure.fromBadResponse(Response response) {
    int? statusCode = response.statusCode;
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure('${response.data['error']['message']}');
    } else if (statusCode == 404) {
      return ServerFailure('Your request was not found, Try later.');
    } else if (statusCode == 500) {
      return ServerFailure('There is a problem with server, Try later.');
    }
    return ServerFailure('There is an error, Try later.');
  }
}

// class CacheFailure extends Failure {
//   CacheFailure(super.error);
// }

// class NetworkFailure extends Failure {
//   NetworkFailure(super.error);
// }
