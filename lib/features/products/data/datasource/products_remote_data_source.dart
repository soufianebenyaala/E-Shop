import 'package:dio/dio.dart';
import 'package:e_shop/core/services/http_service.dart';
import 'package:e_shop/features/products/data/datasource/products_end_point.dart';
import 'package:e_shop/features/products/data/models/products_model.dart';

abstract class ProductsRemoteDataSource {
  Future<ProductsModel> getProducts();
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final HttpService httpService;

  ProductsRemoteDataSourceImpl({
    required this.httpService,
  });

  @override
  Future<ProductsModel> getProducts() async {
    try {
      Response? response = await httpService.dio.get(
        ProductsEndPoint.getProductsAPI(),
      );

      if (response.statusCode == 200 && response.data != null) {
        return ProductsModel.fromMap(response.data);
      }
      throw DioException;
    } on DioException {
      rethrow;
    }
  }
}
