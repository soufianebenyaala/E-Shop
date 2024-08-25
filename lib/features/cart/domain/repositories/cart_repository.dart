import 'package:dartz/dartz.dart';
import 'package:e_shop/core/error/failure.dart';

import 'package:e_shop/features/cart/data/models/cart_model.dart';
import 'package:e_shop/features/cart/domain/usecase/update_product_quantity_in_cart_params_cart_use_case.dart';
import 'package:e_shop/features/products/data/models/product_model.dart';

abstract class CartRepository {
  Future<Either<Failure, CartModel?>> getCart();

  Future<Either<Failure, bool>> deleteCart();

  Future<Either<Failure, CartModel>> updateProductQuantityInCart({
    required UpdateProductQuantityInCartParams updateProductQuantityInCartParams,
  });

  Future<Either<Failure, bool>> saveProductToCart({
    required ProductModel product,
  });
}
