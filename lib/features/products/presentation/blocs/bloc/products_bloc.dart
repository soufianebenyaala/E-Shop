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
  ProductsBloc({required this.getProductsUseCase}) : super(ProductsInitial()) {
    on<ProductsEvent>((event, emit) async {
      if (event is GetProductsEvent) {
        emit(GetProductsLoadingState());
        final failureOrGetDealss = await getProductsUseCase(NoParams());
        emit(
          failureOrGetDealss.fold(
            (failure) => GetProductsErrorState(
                message: UtilsMapFailureToMessage.mapFailureToMessage(failure)),
            (productsModel) => GetProductsLoadedState(
              productsModel: productsModel,
            ),
          ),
        );
      }
    });
  }
}
