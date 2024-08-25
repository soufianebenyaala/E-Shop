part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class UpdateProductQuantityInCartEvent extends CartEvent {
  final UpdateProductQuantityInCartParams updateProductQuantityInCartParams;
  const UpdateProductQuantityInCartEvent({
    required this.updateProductQuantityInCartParams,
  });
}

class SaveProductToCartEvent extends CartEvent {
  final ProductModel productModel;
  const SaveProductToCartEvent({
    required this.productModel,
  });
}

class DeleteCartEvent extends CartEvent {}
