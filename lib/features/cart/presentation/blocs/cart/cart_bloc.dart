import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_shop/core/error/utils_map_failure_to_message.dart';
import 'package:e_shop/core/use_cases/use_case.dart';
import 'package:e_shop/features/cart/data/models/cart_model.dart';
import 'package:e_shop/features/cart/domain/usecase/delete_cart_use_case.dart';
import 'package:e_shop/features/cart/domain/usecase/update_product_quantity_in_cart_params_cart_use_case.dart';
import 'package:e_shop/features/cart/domain/usecase/save_product_to_cart_use_case.dart';
import 'package:e_shop/features/products/data/models/product_model.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final UpdateProductQuantityInCartUseCase updateProductQuantityInCartUseCase;
  final SaveProductToCartUseCase saveProductToCartUseCase;
  final DeleteCartUseCase deleteCartUseCase;
  CartBloc({
    required this.updateProductQuantityInCartUseCase,
    required this.deleteCartUseCase,
    required this.saveProductToCartUseCase,
  }) : super(CartInitial()) {
    on<CartEvent>((event, emit) async {
      if (event is UpdateProductQuantityInCartEvent) {
        emit(CartLoadingState());
        final failureOrGetDealss = await updateProductQuantityInCartUseCase(
            event.updateProductQuantityInCartParams);
        emit(
          failureOrGetDealss.fold(
            (failure) => CartErrorState(
                message: UtilsMapFailureToMessage.mapFailureToMessage(failure)),
            (cart) => SaveCartLoadedState(
              cart: cart,
            ),
          ),
        );
      }
      if (event is SaveProductToCartEvent) {
        emit(CartLoadingState());
        final failureOrGetDealss =
            await saveProductToCartUseCase(event.productModel);
        emit(
          failureOrGetDealss.fold(
            (failure) => CartErrorState(
                message: UtilsMapFailureToMessage.mapFailureToMessage(failure)),
            (cart) => SaveProductToCartLoadedState(),
          ),
        );
      }

      if (event is DeleteCartEvent) {
        emit(CartLoadingState());
        final failureOrGetDealss = await deleteCartUseCase(NoParams());
        emit(
          failureOrGetDealss.fold(
            (failure) => CartErrorState(
                message: UtilsMapFailureToMessage.mapFailureToMessage(failure)),
            (_) => DeleteCartLoadedState(),
          ),
        );
      }
    });
  }
}
