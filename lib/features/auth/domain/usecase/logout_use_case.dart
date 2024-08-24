import 'package:dartz/dartz.dart';
import 'package:e_shop/core/error/failure.dart';
import 'package:e_shop/core/use_cases/use_case.dart';
import 'package:e_shop/features/auth/domain/repositories/auth_repository.dart';

class LogoutUseCase implements UseCase<bool, NoParams> {
  final AuthRepository authRepository;
  LogoutUseCase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, bool>> call(
    NoParams params,
  ) {
    return authRepository.logout();
  }
}
