import 'package:e_shop/core/widgets/widgets_show_error_or_loading/content_not_found_widget.dart';
import 'package:e_shop/features/cart/data/models/cart_product_model.dart';
import 'package:e_shop/features/cart/presentation/widgets/cart_card_widget.dart';
import 'package:flutter/material.dart';

class ListOfCartProductWidget extends StatelessWidget {
  final List<CartProductModel> cartProducts;
  final VoidCallback getItems;
  const ListOfCartProductWidget({
    super.key,
    required this.cartProducts,
    required this.getItems,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          getItems();
        },
        child: cartProducts.isNotEmpty
            ? ListView.builder(
                itemCount: cartProducts.length,
                itemBuilder: (context, index) => CartProductCardWidget(
                  cartProduct: cartProducts[index],
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
