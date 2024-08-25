import 'package:dio/dio.dart';
import 'package:e_shop/core/error/server_exception.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class DioFailure extends Failure {
  final DioException dioException;
  DioFailure({
    required this.dioException,
  });
}

class ServerFailure extends Failure {
  final ServerException exception;
  ServerFailure({
    required this.exception,
  });
}

// General failures
class ServerFailures extends Failure {}

class FirebaseAuthFailure extends Failure {}

class InvalidCredentialFailure extends Failure {}

class EmailAlreadyInFailure extends Failure {}

class WeekPasswordFailure extends Failure {}

class LockedAccountFailure extends Failure {}

class WrongCredentialsFailure extends Failure {}

class ChatToConnectFailure extends Failure {}

class SendMessageFailure extends Failure {}

class MissedDataFailure extends Failure {}

class WrongEmailOrPassword extends Failure {
  final String message;

  WrongEmailOrPassword({required this.message});

  @override
  List<Object> get props => [message];
}

class OfflineFailure extends Failure {
  final String message;

  OfflineFailure({required this.message});

  @override
  List<Object> get props => [message];
}

class UploadImageFailure extends Failure {}
