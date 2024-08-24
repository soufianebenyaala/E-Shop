import 'package:dartz/dartz.dart';
import 'package:e_shop/core/error/failure.dart';
import 'package:e_shop/features/products/data/models/product_model.dart';

abstract class ProductDetailsRepository {
  Future<Either<Failure, ProductModel>> getProductDetails({
    required int id,
  });
}
