import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_shop/core/error/failure.dart';
import 'package:e_shop/features/cart/data/datasource/cart_remote_data_source.dart';
import 'package:e_shop/features/cart/data/models/cart_model.dart';
import 'package:e_shop/features/cart/domain/repositories/cart_repository.dart';
import 'package:e_shop/features/cart/domain/usecase/update_product_quantity_in_cart_params_cart_use_case.dart';
import 'package:e_shop/features/products/data/models/product_model.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource cartRemoteDataSource;

  CartRepositoryImpl({required this.cartRemoteDataSource});

  @override
  Future<Either<Failure, CartModel?>> getCart() async {
    try {
      final response = await cartRemoteDataSource.getCart();
      return Right(response);
    } on DioException catch (dioException) {
      return Left(DioFailure(dioException: dioException));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteCart() async {
    try {
      final response = await cartRemoteDataSource.deleteCart();
      return Right(response);
    } on DioException catch (dioException) {
      return Left(DioFailure(dioException: dioException));
    }
  }

  @override
  Future<Either<Failure, CartModel>> updateProductQuantityInCart({
    required UpdateProductQuantityInCartParams
        updateProductQuantityInCartParams,
  }) async {
    try {
      final response = await cartRemoteDataSource.updateProductQuantityInCart(
          updateProductQuantityInCartParams: updateProductQuantityInCartParams);
      return Right(response);
    } on DioException catch (dioException) {
      return Left(DioFailure(dioException: dioException));
    }
  }

  @override
  Future<Either<Failure, bool>> saveProductToCart(
      {required ProductModel product}) async {
    try {
      final response =
          await cartRemoteDataSource.saveProductToCart(product: product);
      return Right(response);
    } on DioException catch (dioException) {
      return Left(DioFailure(dioException: dioException));
    }
  }
}
