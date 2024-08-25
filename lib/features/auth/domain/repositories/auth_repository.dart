import 'package:dartz/dartz.dart';
import 'package:e_shop/core/error/failure.dart';
import 'package:e_shop/features/auth/domain/usecase/login_use_case.dart';
import 'package:e_shop/features/auth/domain/usecase/sign_up_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserCredential>> login({
    required LoginParams loginParams,
  });
  Future<Either<Failure, bool>> logout();

  Future<Either<Failure, UserCredential>> signUp({
    required SignUpParams signUpParams,
  });
}
