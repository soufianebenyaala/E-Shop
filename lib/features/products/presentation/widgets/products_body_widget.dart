// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_shop/features/products/presentation/widgets/list_of_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_shop/core/widgets/widgets_show_error_or_loading/error_message_widget.dart';
import 'package:e_shop/core/widgets/widgets_show_error_or_loading/loading_data_widget.dart';
import 'package:e_shop/features/products/data/models/product_model.dart';
import 'package:e_shop/features/products/presentation/blocs/bloc/products_bloc.dart';

class ProductsBodyWidget extends StatelessWidget {
  final VoidCallback applyResetFilters;
  const ProductsBodyWidget({super.key, required this.applyResetFilters});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        print(state);
        if (state is GetProductsLoadingState) {
          return const LoadingDataWidget();
        }
        if (state is GetProductsErrorState) {
          return ErrorMessageWidget(
            message: state.message,
          );
        }
        if (state is GetProductsLoadedState) {
          return ListOfProductWidget(
            applyResetFilters: applyResetFilters,
            getItems: () {
              BlocProvider.of<ProductsBloc>(context).add(
                GetProductsEvent(),
              );
              applyResetFilters();
            },
            products: state.productsModel.products,
          );
        }
        return const SizedBox();
      },
    );
  }
}
