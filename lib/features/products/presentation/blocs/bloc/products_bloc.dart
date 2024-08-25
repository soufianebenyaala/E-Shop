import 'package:e_shop/core/error/utils_map_failure_to_message.dart';
import 'package:e_shop/core/use_cases/use_case.dart';
import 'package:e_shop/features/products/data/models/products_model.dart';
import 'package:e_shop/features/products/domain/usecase/get_products_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProductsUseCase getProductsUseCase;
  ProductsModel _originalProducts = ProductsModel(
    products: [],
    total: 0,
    skip: 0,
    limit: 0,
  );
  ProductsBloc({required this.getProductsUseCase}) : super(ProductsInitial()) {
    on<ProductsEvent>((event, emit) async {
      if (event is GetProductsEvent) {
        emit(GetProductsLoadingState());
        final failureOrGetDealss = await getProductsUseCase(NoParams());
        emit(
          failureOrGetDealss.fold(
              (failure) => GetProductsErrorState(
                  message:
                      UtilsMapFailureToMessage.mapFailureToMessage(failure)),
              (productsModel) {
            _originalProducts = productsModel;
            return GetProductsLoadedState(
              productsModel: productsModel,
            );
          }),
        );
      }
      if (event is FilterProductsEvent) {
        emit(GetProductsLoadingState());
        final filteredProducts = _originalProducts.products.where((product) {
          final matchesName = event.nameFilter == null ||
              product.title
                  .toLowerCase()
                  .contains(event.nameFilter!.toLowerCase());
          final matchesMinPrice =
              event.minPrice == null || product.price >= event.minPrice!;
          final matchesMaxPrice =
              event.maxPrice == null || product.price <= event.maxPrice!;
          return matchesName && matchesMinPrice && matchesMaxPrice;
        }).toList();
        emit(
          GetProductsLoadedState(
            productsModel: ProductsModel(
              products: filteredProducts,
              total: filteredProducts.length,
              skip: 0,
              limit: 0,
            ),
          ),
        );
      }
    });
  }
}
