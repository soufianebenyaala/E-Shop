class ServerException implements Exception {
  final String name, message;
  final int? statusCode;
  final ServerExceptionType exceptionType;

  ServerException({
    required this.message,
    this.exceptionType = ServerExceptionType.unexpectedError,
    int? statusCode,
  })  : statusCode = statusCode ?? 409,
        name = exceptionType.name;
}

class ServerIncorrectCurrentPasswordException implements Exception {
  final String name, message;
  final int? statusCode;
  final ServerExceptionType exceptionType;

  ServerIncorrectCurrentPasswordException({
    required this.message,
    this.exceptionType = ServerExceptionType.incorrectCurrentPasswordError,
    int? statusCode,
  })  : statusCode = statusCode ?? 409,
        name = exceptionType.name;
}

class UnchangePasswordException implements Exception {
  final String name, message;
  final int? statusCode;
  final ServerExceptionType exceptionType;

  UnchangePasswordException({
    required this.message,
    this.exceptionType = ServerExceptionType.unchangePasswordError,
    int? statusCode,
  })  : statusCode = statusCode ?? 409,
        name = exceptionType.name;
}

class InvalidCredentialException implements Exception {
  final String name, message;
  final int? statusCode;
  final ServerExceptionType exceptionType;

  InvalidCredentialException({
    required this.message,
    this.exceptionType = ServerExceptionType.invalidCredential,
    int? statusCode,
  })  : statusCode = statusCode ?? 409,
        name = exceptionType.name;
}

enum ServerExceptionType {
  incorrectCurrentPasswordError,
  unchangePasswordError,
  unexpectedError,
  invalidCredential,
}
