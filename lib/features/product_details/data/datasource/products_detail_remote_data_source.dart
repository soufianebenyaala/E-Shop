import 'package:dio/dio.dart';
import 'package:e_shop/core/services/http_service.dart';
import 'package:e_shop/features/product_details/data/datasource/product_details_end_point.dart';
import 'package:e_shop/features/products/data/models/product_model.dart';

abstract class ProductDetailsRemoteDataSource {
  Future<ProductModel> getProductDetails({
    required int id,
  });
}

class ProductDetailsRemoteDataSourceImpl
    implements ProductDetailsRemoteDataSource {
  final HttpService httpService;

  ProductDetailsRemoteDataSourceImpl({
    required this.httpService,
  });

  @override
  Future<ProductModel> getProductDetails({
    required int id,
  }) async {
    try {
      Response? response = await httpService.dio.get(
        ProductDetailsEndPoint.getProductDetailsAPI(id: id),
      );

      if (response.statusCode == 200 && response.data != null) {
        return ProductModel.fromMap(response.data);
      }
      throw DioException;
    } on DioException {
      rethrow;
    }
  }
}
