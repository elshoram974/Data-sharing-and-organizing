// ! Failure --------------------------

import 'dart:developer';

import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:http/http.dart';

import '../../utils/enums/http_exception_type_enum.dart';
import '../../utils/exceptions/http_exception.dart';
import 'failure.dart';
import 'failure_body.dart';

class ServerFailure<T> extends Failure<T> {
  ServerFailure(super.failure);
  factory ServerFailure.fromHttpException(MyHttpException e) {
    final FailureBody res = FailureBody(httpExceptionType: e.type);
    switch (e.type) {
      case HttpExceptionType.connectionTimeout:
        return ServerFailure(
          res.copyWith(
            code: 408,
            type: 'connection-timeout',
            message: S.current.serverTookTooLongToRespond,
          ),
        );

      case HttpExceptionType.badCertificate:
        return ServerFailure(
          res.copyWith(
            code: 403,
            type: 'certificate-error',
            message: S.current.sslCertificateNotTrusted,
          ),
        );

      case HttpExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
          FailureBody.fromJson((e.response as Response).body).copyWith(
            httpExceptionType: HttpExceptionType.badResponse,
          ),
        );

      case HttpExceptionType.cancel:
        return ServerFailure(
          res.copyWith(
            code: 499,
            type: 'request-canceled',
            message: S.current.cancel,
          ),
        );

      case HttpExceptionType.connectionError:
        return ServerFailure(
          res.copyWith(
            code: 503,
            type: 'connection-error',
            message: S.current.noInternetConnection,
          ),
        );

      case HttpExceptionType.receiveTimeout:
        return ServerFailure(
          res.copyWith(
            code: 504,
            type: 'receive-timeout',
            message: S.current.serverTookTooLong,
          ),
        );

      case HttpExceptionType.sendTimeout:
        return ServerFailure(
          res.copyWith(
            code: 504,
            type: 'send-timeout',
            message: S.current.clientTookTooLong,
          ),
        );
      default:
        log(e.message ?? '');
        return ServerFailure(
          res.copyWith(
            type: 'unknown-error',
            message: S.current.unknownErrorOccurred,
          ),
        );
    }
  }

  factory ServerFailure.fromBadResponse(FailureBody res) {
    int? statusCode = res.code;
    if (statusCode == 404) {
      return ServerFailure(
          res.copyWith(message: S.current.yourRequestNotFoundTryAgainLater));
    } else if (statusCode == 500) {
      return ServerFailure(res.copyWith(
          message: S.current.thereIsProblemWithServerTryAgainLater));
    } else if (statusCode == 413) {
      return ServerFailure(res.copyWith(
          message: S.current
              .theUploadedFileExceedsTheMaximumAllowedSizePleaseUploadSmallerFile));
    }
    return notValid(res);
  }

  static ServerFailure<T> notValid<T>(FailureBody res) {
    switch (res.message) {
      case 'You have to confirm your account':
        return ServerFailure(
          res.copyWith(message: S.current.youHaveToConfirmYourAccount),
        );
      case 'Error in password':
        return ServerFailure(
          res.copyWith(message: S.current.errorInPassword),
        );
      case 'The email you entered does not exist' ||
            'The userId you entered does not exist':
        return ServerFailure(
          res.copyWith(message: S.current.emailYouEnteredDoesNotExist),
        );
      case 'User created by another provider':
        return ServerFailure(
          res.copyWith(message: S.current.thisAccountExistWithAnotherProvider),
        );
      case 'This email already exists':
        return ServerFailure(
          res.copyWith(message: S.current.thisEmailAlreadyExists),
        );
      case 'The password is very weak':
        return ServerFailure(
          res.copyWith(message: S.current.thePasswordIsVeryWeak),
        );
      case 'You can\'t use the same previous password':
        return ServerFailure(
          res.copyWith(message: S.current.youCanNotUseSamePreviousPassword),
        );
      case 'Invalid verification code':
        return ServerFailure(
          res.copyWith(message: S.current.invalidVerificationCode),
        );
      case 'The verification code has expired. we sent another code':
        return ServerFailure(
          res.copyWith(
            message: S.current.theVerificationCodeHasExpiredWeSentAnotherCode,
          ),
        );
      case 'Invalid verification type.':
        return ServerFailure(
          res.copyWith(message: S.current.invalidVerificationType),
        );
      case 'User is not email_password to make new pass':
        return ServerFailure(
          res.copyWith(message: S.current.userNotEmailPasswordToNewPass),
        );
      case 'User is not email_password to send verification code.':
        return ServerFailure(
          res.copyWith(
            message: S.current.userNotEmailPasswordToSendVerificationCode,
          ),
        );
      case 'password is changed':
        return ServerFailure(
          res.copyWith(message: S.current.thePassIsChangedFromAnotherDevice),
        );
      case 'this user is not put image':
        return ServerFailure(
          res.copyWith(
            message: S.current.theImageYouAreTryingToDeleteDoesNotExist,
          ),
        );
      case 'This file is not support':
        return ServerFailure(
          res.copyWith(
            message: S.current
                .theUploadedFileTypeIsNotSupportedPleaseUploadAnImageFile,
          ),
        );
      case 'This file is larg in size':
        return ServerFailure(
          res.copyWith(
            message: S.current
                .theUploadedFileExceedsTheMaximumAllowedSizePleaseUploadSmallerFile,
          ),
        );
      case 'User is not active!':
        return ServerFailure(
          res.copyWith(
            message: S.current
                .userIsNotActivePleaseContactSupportForFurtherAssistance,
          ),
        );
      case 'User does not have permission to perform this action.':
        return ServerFailure(res.copyWith(message: S.current.userNoPermission));
      case 'Error deleting direction from database. Please try again later.':
        return ServerFailure(
          res.copyWith(message: S.current.errorDeletingDirectory),
        );
      case 'Error deleting activity from database. Please try again later.':
        return ServerFailure(
          res.copyWith(message: S.current.errorDeletingActivity),
        );
      default:
        return ServerFailure(res);
    }
  }
}
