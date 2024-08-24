import 'package:dartz/dartz.dart';
import 'package:e_shop/core/error/failure.dart';

import 'package:e_shop/features/products/data/models/products_model.dart';


abstract class ProductsRepository {
  Future<Either<Failure, ProductsModel>> getProducts();
}
