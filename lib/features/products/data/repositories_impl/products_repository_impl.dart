import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_shop/core/error/failure.dart';
import 'package:e_shop/features/products/data/datasource/products_remote_data_source.dart';
import 'package:e_shop/features/products/data/models/products_model.dart';
import 'package:e_shop/features/products/domain/repositories/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource productsRemoteDataSource;

  ProductsRepositoryImpl({required this.productsRemoteDataSource});

  @override
  Future<Either<Failure, ProductsModel>> getProducts() async {
    try {
      final response = await productsRemoteDataSource.getProducts();
      return Right(response);
    } on DioException catch (dioException) {
      return Left(DioFailure(dioException: dioException));
    }
  }
}
