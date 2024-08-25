import 'package:dartz/dartz.dart';
import 'package:e_shop/core/error/failure.dart';
import 'package:e_shop/core/use_cases/use_case.dart';
import 'package:e_shop/features/products/data/models/products_model.dart';
import 'package:e_shop/features/products/domain/repositories/products_repository.dart';

class GetProductsUseCase implements UseCase<ProductsModel, NoParams> {
  final ProductsRepository productsRepository;
  GetProductsUseCase({
    required this.productsRepository,
  });

  @override
  Future<Either<Failure, ProductsModel>> call(
    NoParams params,
  ) {
    return productsRepository.getProducts();
  }
}
