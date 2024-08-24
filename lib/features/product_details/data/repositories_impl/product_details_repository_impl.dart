import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_shop/core/error/failure.dart';
import 'package:e_shop/features/product_details/data/datasource/products_detail_remote_data_source.dart';
import 'package:e_shop/features/product_details/domain/repositories/product_details_repository.dart';
import 'package:e_shop/features/products/data/models/product_model.dart';

class ProductDetailsRepositoryImpl implements ProductDetailsRepository {
  final ProductDetailsRemoteDataSource productDetailsRemoteDataSource;

  ProductDetailsRepositoryImpl({required this.productDetailsRemoteDataSource});

  @override
  Future<Either<Failure, ProductModel>> getProductDetails({
    required int id,
  }) async {
    try {
      final response =
          await productDetailsRemoteDataSource.getProductDetails(id: id);
      return Right(response);
    } on DioException catch (dioException) {
      return Left(DioFailure(dioException: dioException));
    }
  }
}
