import 'package:dartz/dartz.dart';
import 'package:e_shop/core/error/failure.dart';
import 'package:e_shop/core/use_cases/use_case.dart';
import 'package:e_shop/features/cart/domain/repositories/cart_repository.dart';

class DeleteCartUseCase implements UseCase<bool, NoParams> {
  final CartRepository cartRepository;
  DeleteCartUseCase({
    required this.cartRepository,
  });

  @override
  Future<Either<Failure, bool>> call(
    NoParams params,
  ) {
    return cartRepository.deleteCart();
  }
}
