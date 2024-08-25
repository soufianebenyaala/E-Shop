import 'package:dartz/dartz.dart';
import 'package:e_shop/core/error/failure.dart';
import 'package:e_shop/core/use_cases/use_case.dart';
import 'package:e_shop/features/cart/data/models/cart_model.dart';
import 'package:e_shop/features/cart/data/models/cart_product_model.dart';
import 'package:e_shop/features/cart/domain/repositories/cart_repository.dart';

class UpdateProductQuantityInCartUseCase
    implements UseCase<CartModel, UpdateProductQuantityInCartParams> {
  final CartRepository cartRepository;
  UpdateProductQuantityInCartUseCase({
    required this.cartRepository,
  });

  @override
  Future<Either<Failure, CartModel>> call(
    UpdateProductQuantityInCartParams updateProductQuantityInCartParams,
  ) {
    return cartRepository.updateProductQuantityInCart(
      updateProductQuantityInCartParams: updateProductQuantityInCartParams,
    );
  }
}

class UpdateProductQuantityInCartParams {
  final CartProductModel product;
  final int change;

  UpdateProductQuantityInCartParams(
      {required this.product, required this.change});
}
