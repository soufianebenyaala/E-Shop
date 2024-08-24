import 'package:dartz/dartz.dart';
import 'package:e_shop/core/error/failure.dart';
import 'package:e_shop/core/use_cases/use_case.dart';
import 'package:e_shop/features/product_details/domain/repositories/product_details_repository.dart';
import 'package:e_shop/features/products/data/models/product_model.dart';

class GetProductDetailsUseCase implements UseCase<ProductModel, int> {
  final ProductDetailsRepository productDetailsRepository;
  GetProductDetailsUseCase({
    required this.productDetailsRepository,
  });

  @override
  Future<Either<Failure, ProductModel>> call(
    int id,
  ) {
    return productDetailsRepository.getProductDetails(id: id);
  }
}
