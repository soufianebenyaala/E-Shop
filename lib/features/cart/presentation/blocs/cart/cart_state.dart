part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

class SaveCartLoadedState extends CartState {
  final CartModel cart;
  const SaveCartLoadedState({
    required this.cart,
  });
}

class DeleteCartLoadedState extends CartState {}

class SaveProductToCartLoadedState extends CartState {}

class CartLoadingState extends CartState {}

class CartErrorState extends CartState {
  final String message;
  const CartErrorState({
    required this.message,
  });
}
