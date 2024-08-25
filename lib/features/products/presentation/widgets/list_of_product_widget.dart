// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:e_shop/core/widgets/widgets_show_error_or_loading/content_not_found_widget.dart';
import 'package:e_shop/features/products/data/models/product_model.dart';
import 'package:e_shop/features/products/presentation/blocs/bloc/products_bloc.dart';
import 'package:e_shop/features/products/presentation/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListOfProductWidget extends StatelessWidget {
  final List<ProductModel> products;
  final VoidCallback applyResetFilters;

  final VoidCallback getItems;
  const ListOfProductWidget({
    super.key,
    required this.products,
    required this.getItems,
    required this.applyResetFilters,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          getItems();
          applyResetFilters();
        },
        child: products.isNotEmpty
            ? GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.55,
                ),
                itemBuilder: (context, index) => ProductCardWidget(
                  product: products[index],
                ),
              )
            : ListView(
                children: const [
                  ContentNotFoundWidget(),
                ],
              ),
      ),
    );
  }
}
