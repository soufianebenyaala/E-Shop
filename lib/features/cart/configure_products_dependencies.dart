import 'package:e_shop/features/cart/data/datasource/cart_remote_data_source.dart';
import 'package:e_shop/features/cart/data/repositories_impl/cart_repository_impl.dart';
import 'package:e_shop/features/cart/domain/repositories/cart_repository.dart';
import 'package:e_shop/features/cart/domain/usecase/get_cart_use_case.dart';
import 'package:e_shop/features/cart/domain/usecase/update_product_quantity_in_cart_params_cart_use_case.dart';
import 'package:e_shop/features/cart/domain/usecase/save_product_to_cart_use_case.dart';
import 'package:e_shop/features/cart/presentation/blocs/cart/cart_bloc.dart';
import 'package:e_shop/features/cart/presentation/blocs/get_cart/get_cart_bloc.dart';
import 'package:get_it/get_it.dart';

import 'domain/usecase/delete_cart_use_case.dart';

void configureCartDependencies({required GetIt di}) async {
  //? Bloc
  di.registerFactory(
    () => GetCartBloc(
      getCartUseCase: di(),
    ),
  );
  di.registerFactory(
    () => CartBloc(
      updateProductQuantityInCartUseCase: di(),
      deleteCartUseCase: di(),
      saveProductToCartUseCase: di(),
    ),
  );
  //? Repository
  di.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(
      cartRemoteDataSource: di(),
    ),
  );

  //? Usecases
  di.registerLazySingleton(
    () => GetCartUseCase(
      cartRepository: di(),
    ),
  );
  di.registerLazySingleton(
    () => UpdateProductQuantityInCartUseCase(
      cartRepository: di(),
    ),
  );
  di.registerLazySingleton(
    () => DeleteCartUseCase(
      cartRepository: di(),
    ),
  );
  di.registerLazySingleton(
    () => SaveProductToCartUseCase(
      cartRepository: di(),
    ),
  );

  //? Data sources
  di.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSourceImpl(
      httpService: di(),
    ),
  );
}
