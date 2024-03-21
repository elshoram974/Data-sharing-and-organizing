// ! Failure --------------------------

import 'dart:convert';
import 'dart:developer';

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
        log(e.message ?? '');
        return ServerFailure('unknown error');
    }
  }

  factory ServerFailure.fromBadResponse(Response response) {
    int? statusCode = response.statusCode;
    if (statusCode == 404) {
      return ServerFailure(S.current.yourRequestNotFoundTryAgainLater);
    } else if (statusCode == 500) {
      return ServerFailure(S.current.thereIsProblemWithServerTryAgainLater);
    } else if (statusCode == 413) {
      return ServerFailure(S.current.theUploadedFileExceedsTheMaximumAllowedSizePleaseUploadSmallerFile);
    }
    return loginValid(jsonDecode(response.body)['message']);
  }

  static ServerFailure<T> loginValid<T>(String errorMessage) {
    switch (errorMessage) {
      case 'You have to confirm your account':
        return ServerFailure(S.current.youHaveToConfirmYourAccount);
      case 'Error in password':
        return ServerFailure(S.current.errorInPassword);
      case 'The email you entered does not exist' ||
            'The userId you entered does not exist':
        return ServerFailure(S.current.emailYouEnteredDoesNotExist);
      case 'User created by another provider':
        return ServerFailure(S.current.thisAccountExistWithAnotherProvider);
      case 'This email already exists':
        return ServerFailure(S.current.thisEmailAlreadyExists);
      case 'The password is very weak':
        return ServerFailure(S.current.thePasswordIsVeryWeak);
      case 'You can\'t use the same previous password':
        return ServerFailure(S.current.youCanNotUseSamePreviousPassword);
      case 'Invalid verification code':
        return ServerFailure(S.current.invalidVerificationCode);
      case 'The verification code has expired. we sent another code':
        return ServerFailure(
            S.current.theVerificationCodeHasExpiredWeSentAnotherCode);
      case 'Invalid verification type.':
        return ServerFailure(S.current.invalidVerificationType);
      case 'User is not email_password to make new pass':
        return ServerFailure(S.current.userNotEmailPasswordToNewPass);
      case 'User is not email_password to send verification code.':
        return ServerFailure(
            S.current.userNotEmailPasswordToSendVerificationCode);
      case 'password is changed':
        return ServerFailure(S.current.thePassIsChangedFromAnotherDevice);
      case 'this user is not put image':
        return ServerFailure(S.current.theImageYouAreTryingToDeleteDoesNotExist);
      case 'This file is not support':
        return ServerFailure(S.current.theUploadedFileTypeIsNotSupportedPleaseUploadAnImageFile);
      case 'This file is larg in size':
        return ServerFailure(S.current.theUploadedFileExceedsTheMaximumAllowedSizePleaseUploadSmallerFile);
      default:
        return ServerFailure(errorMessage);
    }
  }
}
