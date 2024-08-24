part of 'products_bloc.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProductsState {}

class GetProductsLoadedState extends ProductsState {
  final ProductsModel productsModel;
  const GetProductsLoadedState({
    required this.productsModel,
  });
}

class GetProductsLoadingState extends ProductsState {}

class GetProductsErrorState extends ProductsState {
  final String message;
  const GetProductsErrorState({
    required this.message,
  });
}
