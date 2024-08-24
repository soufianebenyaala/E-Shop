import 'package:e_shop/features/products/data/datasource/products_remote_data_source.dart';
import 'package:e_shop/features/products/data/repositories_impl/products_repository_impl.dart';
import 'package:e_shop/features/products/domain/repositories/products_repository.dart';
import 'package:e_shop/features/products/domain/usecase/get_products_use_case.dart';
import 'package:e_shop/features/products/presentation/blocs/bloc/products_bloc.dart';
import 'package:get_it/get_it.dart';

void configureProductsDependencies({required GetIt di}) async {
  //? Bloc
  di.registerFactory(
    () => ProductsBloc(
      getProductsUseCase: di(),
    ),
  );
  //? Repository
  di.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(
      productsRemoteDataSource: di(),
    ),
  );

  //? Usecases
  di.registerLazySingleton(
    () => GetProductsUseCase(
      productsRepository: di(),
    ),
  );

  //? Data sources
  di.registerLazySingleton<ProductsRemoteDataSource>(
    () => ProductsRemoteDataSourceImpl(
      httpService: di(),
    ),
  );
}
