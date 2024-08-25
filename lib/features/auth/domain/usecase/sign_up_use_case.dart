import 'package:dartz/dartz.dart';
import 'package:e_shop/core/error/failure.dart';
import 'package:e_shop/core/use_cases/use_case.dart';
import 'package:e_shop/features/auth/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpUseCase implements UseCase<UserCredential, SignUpParams> {
  final AuthRepository authRepository;
  SignUpUseCase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, UserCredential>> call(
    SignUpParams signUpParams,
  ) {
    return authRepository.signUp(signUpParams: signUpParams);
  }
}

class SignUpParams {
  final String email;
  final String password;
  final String displayName;
  SignUpParams({
    required this.email,
    required this.password,
    required this.displayName,
  });
}
