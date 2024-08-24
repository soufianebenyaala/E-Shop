part of 'product_details_bloc.dart';

sealed class ProductDetailsState extends Equatable {
  const ProductDetailsState();

  @override
  List<Object> get props => [];
}

final class ProductDetailsInitial extends ProductDetailsState {}

class GetProductDetailsLoadedState extends ProductDetailsState {
  final ProductModel productModel;
  const GetProductDetailsLoadedState({
    required this.productModel,
  });
}

class GetProductDetailsLoadingState extends ProductDetailsState {}

class GetProductDetailsErrorState extends ProductDetailsState {
  final String message;
  const GetProductDetailsErrorState({
    required this.message,
  });
}
