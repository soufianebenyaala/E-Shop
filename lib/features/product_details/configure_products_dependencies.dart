import 'package:e_shop/features/product_details/data/datasource/products_detail_remote_data_source.dart';
import 'package:e_shop/features/product_details/data/repositories_impl/product_details_repository_impl.dart';
import 'package:e_shop/features/product_details/domain/repositories/product_details_repository.dart';
import 'package:e_shop/features/product_details/domain/usecase/get_product_details_use_case.dart';
import 'package:e_shop/features/product_details/presentation/blocs/bloc/product_details_bloc.dart';
import 'package:get_it/get_it.dart';

void configureProductDetailsDependencies({required GetIt di}) async {
  //? Bloc
  di.registerFactory(
    () => ProductDetailsBloc(
      getProductDetailsUseCase: di(),
    ),
  );
  //? Repository
  di.registerLazySingleton<ProductDetailsRepository>(
    () => ProductDetailsRepositoryImpl(
      productDetailsRemoteDataSource: di(),
    ),
  );

  //? Usecases
  di.registerLazySingleton(
    () => GetProductDetailsUseCase(
      productDetailsRepository: di(),
    ),
  );

  //? Data sources
  di.registerLazySingleton<ProductDetailsRemoteDataSource>(
    () => ProductDetailsRemoteDataSourceImpl(
      httpService: di(),
    ),
  );
}
