part of 'get_cart_bloc.dart';

sealed class GetCartState extends Equatable {
  const GetCartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends GetCartState {}

class GetCartLoadedState extends GetCartState {
  final CartModel? cartModel;
  const GetCartLoadedState({
    required this.cartModel,
  });
}

class GetCartLoadingState extends GetCartState {}

class GetCartErrorState extends GetCartState {
  final String message;
  const GetCartErrorState({
    required this.message,
  });
}
