import 'package:e_shop/core/error/utils_map_failure_to_message.dart';
import 'package:e_shop/core/use_cases/use_case.dart';
import 'package:e_shop/features/cart/data/models/cart_model.dart';
import 'package:e_shop/features/cart/domain/usecase/get_cart_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_cart_event.dart';
part 'get_cart_state.dart';

class GetCartBloc extends Bloc<GetCartEvent, GetCartState> {
  final GetCartUseCase getCartUseCase;
  GetCartBloc({required this.getCartUseCase}) : super(CartInitial()) {
    on<GetCartEvent>((event, emit) async {
      if (event is GetAllCartEvent) {
        emit(GetCartLoadingState());
        final failureOrGetDealss = await getCartUseCase(NoParams());
        emit(
          failureOrGetDealss.fold(
            (failure) => GetCartErrorState(
                message: UtilsMapFailureToMessage.mapFailureToMessage(failure)),
            (cartModel) => GetCartLoadedState(
              cartModel: cartModel,
            ),
          ),
        );
      }
    });
  }
}
