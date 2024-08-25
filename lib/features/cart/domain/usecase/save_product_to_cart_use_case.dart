import 'package:dartz/dartz.dart';
import 'package:e_shop/core/error/failure.dart';
import 'package:e_shop/core/use_cases/use_case.dart';
import 'package:e_shop/features/cart/domain/repositories/cart_repository.dart';
import 'package:e_shop/features/products/data/models/product_model.dart';

class SaveProductToCartUseCase implements UseCase<bool, ProductModel> {
  final CartRepository cartRepository;
  SaveProductToCartUseCase({
    required this.cartRepository,
  });

  @override
  Future<Either<Failure, bool>> call(
    ProductModel product,
  ) {
    return cartRepository.saveProductToCart(product: product);
  }
}
