// ! Failure --------------------------

import 'dart:convert';

import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:http/http.dart';

import '../../utils/enums/http_exception_type_enum.dart';
import '../../utils/exceptions/http_exception.dart';
import 'failure.dart';

class ServerFailure<T> extends Failure<T> {
  ServerFailure(super.error);
  factory ServerFailure.fromHttpException(MyHttpException e) {
    switch (e.type) {
      case HttpExceptionType.connectionTimeout:
        return ServerFailure('connectionTimeout');

      case HttpExceptionType.badCertificate:
        return ServerFailure('badCertificate');

      case HttpExceptionType.badResponse:
        return ServerFailure.fromBadResponse(e.response!);

      case HttpExceptionType.cancel:
        return ServerFailure('cancel');

      case HttpExceptionType.connectionError:
        return ServerFailure(S.current.noInternetConnection);

      case HttpExceptionType.receiveTimeout:
        return ServerFailure('receiveTimeout');

      case HttpExceptionType.sendTimeout:
        return ServerFailure('sendTimeout');
      case HttpExceptionType.unknown:
      default:
        return ServerFailure('unknown error : ${e.message}');
    }
  }

  factory ServerFailure.fromBadResponse(Response response) {
    int? statusCode = response.statusCode;
    if (statusCode == 404) {
      return ServerFailure(S.current.yourRequestNotFoundTryAgainLater);
    } else if (statusCode == 500) {
      return ServerFailure(S.current.thereIsProblemWithServerTryAgainLater);
    }
    return loginValid(jsonDecode(response.body)['message']);
  }

  static ServerFailure<T> loginValid<T>(String errorMessage) {
    switch (errorMessage) {
      case 'You have to confirm your account':
        return ServerFailure(S.current.youHaveToConfirmYourAccount);
      case 'Error in password':
        return ServerFailure(S.current.errorInPassword);
      case 'The email you entered does not exist':
        return ServerFailure(S.current.emailYouEnteredDoesNotExist);
      case 'User created by another provider':
        return ServerFailure(S.current.thisAccountExistWithAnotherProvider);
      case 'This email already exists':
        return ServerFailure(S.current.thisEmailAlreadyExists);
      case 'The password is very weak':
        return ServerFailure(S.current.thePasswordIsVeryWeak);
      default:
        return ServerFailure(errorMessage);
    }
  }
}
