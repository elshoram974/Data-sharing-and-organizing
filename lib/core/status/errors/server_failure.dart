// ! Failure --------------------------

import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:dio/dio.dart';

import 'failure.dart';

class ServerFailure<T> extends Failure<T> {
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
        return ServerFailure(S.current.noInternetConnection);

      case DioExceptionType.receiveTimeout:
        return ServerFailure('receiveTimeout');

      case DioExceptionType.sendTimeout:
        return ServerFailure('sendTimeout');
      case DioExceptionType.unknown:
      default:
        return ServerFailure('unknown error : ${e.message}');
    }
  }

  factory ServerFailure.fromBadResponse(Response response) {
    int? statusCode = response.statusCode;
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return loginValid(response.data['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request was not found, Try later.');
    } else if (statusCode == 500) {
      return ServerFailure('There is a problem with server, Try later.');
    }
    return ServerFailure('There is an error, Try later.');
  }

  static ServerFailure<T> loginValid<T>(String errorMessage) {
    switch (errorMessage) {
      case 'You have to confirm your account':
        return ServerFailure(S.current.youHaveToConfirmYourAccount);
      case 'Error in password':
        return ServerFailure(S.current.errorInPassword);
      case 'The email you entered does not exist':
        return ServerFailure(S.current.emailYouEnteredDoesNotExist);
      default:
        return ServerFailure(errorMessage);
    }
  }
}
