import 'package:e_shop/core/error/utils_map_failure_to_message.dart';
import 'package:e_shop/features/product_details/domain/usecase/get_product_details_use_case.dart';
import 'package:e_shop/features/products/data/models/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final GetProductDetailsUseCase getProductDetailsUseCase;
  ProductDetailsBloc({required this.getProductDetailsUseCase})
      : super(ProductDetailsInitial()) {
    on<ProductDetailsEvent>((event, emit) async {
      if (event is GetProductDetailsEvent) {
        emit(GetProductDetailsLoadingState());
        final failureOrGetDealss = await getProductDetailsUseCase(event.id);
        emit(
          failureOrGetDealss.fold(
            (failure) => GetProductDetailsErrorState(
                message: UtilsMapFailureToMessage.mapFailureToMessage(failure)),
            (productModel) => GetProductDetailsLoadedState(
              productModel: productModel,
            ),
          ),
        );
      }
    });
  }
}
