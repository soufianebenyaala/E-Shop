import 'package:dartz/dartz.dart';
import 'package:e_shop/core/error/failure.dart';
import 'package:e_shop/core/use_cases/use_case.dart';
import 'package:e_shop/features/auth/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginUseCase implements UseCase<UserCredential, LoginParams> {
  final AuthRepository authRepository;
  LoginUseCase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, UserCredential>> call(
    LoginParams loginParams,
  ) {
    return authRepository.login(loginParams: loginParams);
  }
}

class LoginParams {
  final String email;
  final String password;
  bool saveCredentials;
  LoginParams({
    required this.email,
    required this.password,
    required this.saveCredentials,
  });
}
