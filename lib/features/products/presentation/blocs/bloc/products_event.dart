// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'products_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class GetProductsEvent extends ProductsEvent {}

class FilterProductsEvent extends ProductsEvent {
  final double? minPrice;
  final double? maxPrice;
  final String? nameFilter;

  const FilterProductsEvent({
    this.maxPrice,
    this.minPrice,
    this.nameFilter,
  });
}
