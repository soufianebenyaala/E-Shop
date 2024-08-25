part of 'get_cart_bloc.dart';

sealed class GetCartEvent extends Equatable {
  const GetCartEvent();

  @override
  List<Object> get props => [];
}

class GetAllCartEvent extends GetCartEvent {}
