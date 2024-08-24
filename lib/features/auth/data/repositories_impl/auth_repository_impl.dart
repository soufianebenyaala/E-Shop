import 'package:dartz/dartz.dart';
import 'package:e_shop/core/error/failure.dart';
import 'package:e_shop/core/error/server_exception.dart';
import 'package:e_shop/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:e_shop/features/auth/domain/repositories/auth_repository.dart';
import 'package:e_shop/features/auth/domain/usecase/login_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<Either<Failure, UserCredential>> login(
      {required LoginParams loginParams}) async {
    try {
      final response = await authRemoteDataSource.login(
        loginParams: loginParams,
      );
      return Right(response);
    } on FirebaseAuthException {
      return Left(FirebaseAuthFailure());
    } on InvalidCredentialException {
      return Left(InvalidCredentialFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      final response = await authRemoteDataSource.logout();
      return Right(response);
    } on FirebaseAuthException {
      return Left(FirebaseAuthFailure());
    }
  }
}
