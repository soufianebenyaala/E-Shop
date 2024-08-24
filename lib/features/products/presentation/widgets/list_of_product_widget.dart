// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:e_shop/core/widgets/widgets_show_error_or_loading/content_not_found_widget.dart';
import 'package:e_shop/features/products/data/models/product_model.dart';
import 'package:e_shop/features/products/presentation/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';

class ListOfProductWidget extends StatelessWidget {
  final List<ProductModel> products;
  final VoidCallback getItems;
  const ListOfProductWidget({
    super.key,
    required this.products,
    required this.getItems,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        getItems();
      },
      child: products.isNotEmpty
          ? GridView.builder(
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
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
    );
  }
}
