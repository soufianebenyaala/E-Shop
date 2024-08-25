import 'package:dartz/dartz.dart';
import 'package:e_shop/core/error/failure.dart';
import 'package:e_shop/core/use_cases/use_case.dart';
import 'package:e_shop/features/cart/data/models/cart_model.dart';
import 'package:e_shop/features/cart/domain/repositories/cart_repository.dart';

class GetCartUseCase implements UseCase<CartModel?, NoParams> {
  final CartRepository cartRepository;
  GetCartUseCase({
    required this.cartRepository,
  });

  @override
  Future<Either<Failure, CartModel?>> call(
    NoParams params,
  ) {
    return cartRepository.getCart();
  }
}
