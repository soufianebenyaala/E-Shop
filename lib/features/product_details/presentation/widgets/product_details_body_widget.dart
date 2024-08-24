import 'package:e_shop/features/product_details/presentation/blocs/bloc/product_details_bloc.dart';
import 'package:e_shop/features/product_details/presentation/widgets/product_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_shop/core/widgets/widgets_show_error_or_loading/error_message_widget.dart';
import 'package:e_shop/core/widgets/widgets_show_error_or_loading/loading_data_widget.dart';

class ProductDetailsBodyWidget extends StatelessWidget {
  const ProductDetailsBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
      builder: (context, state) {
        if (state is GetProductDetailsLoadingState) {
          return const LoadingDataWidget();
        }
        if (state is GetProductDetailsErrorState) {
          return ErrorMessageWidget(
            message: state.message,
          );
        }
        if (state is GetProductDetailsLoadedState) {
          return ProductDetailsWidget(
            product: state.productModel,
          );
        }
        return const SizedBox();
      },
    );
  }
}
