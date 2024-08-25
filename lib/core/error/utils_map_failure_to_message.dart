import 'package:dio/dio.dart';
import 'package:e_shop/core/constants/contants.dart';
import 'package:e_shop/core/error/failure.dart';
import 'package:e_shop/core/error/utils_error_message.dart';

abstract class UtilsMapFailureToMessage {
  // Error message
  static String mapFailureToMessage(Failure failure) {
    switch (failure) {
      case DioFailure failure:
        return dioFailureMessage(dioFailureType: failure.dioException.type);
      case ServerFailures _:
        return Constants.SERVER_FAILURE_MESSAGE;
      case FirebaseAuthFailure _:
        return Constants.SERVER_FAILURE_MESSAGE;
      case InvalidCredentialFailure _:
        return Constants.INVALID_CREDENTIAL_FAILURE_MESSAGE;
      case WeekPasswordFailure _:
        return Constants.WEAK_PASSWORD_FAILURE_MESSAGE;
      case EmailAlreadyInFailure _:
        return Constants.EMAIL_FAILURE_MESSAGE;
      case OfflineFailure _:
        return Constants.OFFLINE_FAILURE_MESSAGE;

      default:
        return "Unexpected Error , Please try again later .";
    }
  }

  static String dioFailureMessage({required DioExceptionType dioFailureType}) {
    switch (dioFailureType) {
      case DioExceptionType.badCertificate:
        return UtilsErrorMessage.badCertificateErrorMessage;
      case DioExceptionType.badResponse:
        return UtilsErrorMessage.badResponseErrorMessage;
      case DioExceptionType.cancel:
        return UtilsErrorMessage.cancelErrorMessage;
      case DioExceptionType.receiveTimeout:
        return UtilsErrorMessage.receiveTimeoutErrorMessage;
      case DioExceptionType.connectionTimeout:
        return UtilsErrorMessage.connectionTimeoutErrorMessage;
      case DioExceptionType.connectionError:
        return UtilsErrorMessage.connectionErrorMessage;
      case DioExceptionType.sendTimeout:
        return UtilsErrorMessage.timeOutErrorMessage;
      case DioExceptionType.unknown:
        return UtilsErrorMessage.unknownErrorMessage;
      default:
        return "The server is not responding. Please try again later.";
    }
  }
}
