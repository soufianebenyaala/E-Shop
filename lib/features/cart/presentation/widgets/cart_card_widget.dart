// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:e_shop/core/Routes/app_route.dart';
import 'package:e_shop/core/constants/contants.dart';
import 'package:e_shop/features/cart/data/models/cart_product_model.dart';
import 'package:e_shop/features/cart/domain/usecase/update_product_quantity_in_cart_params_cart_use_case.dart';
import 'package:e_shop/features/cart/presentation/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartProductCardWidget extends StatefulWidget {
  final CartProductModel cartProduct;
  const CartProductCardWidget({
    super.key,
    required this.cartProduct,
  });

  @override
  State<CartProductCardWidget> createState() => _CartProductCardWidgetState();
}

class _CartProductCardWidgetState extends State<CartProductCardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRouteName.productDetailsScreen,
          arguments: widget.cartProduct.id,
        );
      },
      child: Card(
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  widget.cartProduct.thumbnail,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Constants.cardHorizontalPadding,
                  vertical: Constants.cardVerticalPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.cartProduct.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '${widget.cartProduct.total.toStringAsFixed(3)} TND',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                IconButton.filled(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    if (widget.cartProduct.quantity > 0) {
                      BlocProvider.of<CartBloc>(context).add(
                        UpdateProductQuantityInCartEvent(
                          updateProductQuantityInCartParams:
                              UpdateProductQuantityInCartParams(
                            product: widget.cartProduct,
                            change: -1,
                          ),
                        ),
                      );
                    }
                  },
                  icon: Icon(FontAwesomeIcons.minus),
                ),
                Text('${widget.cartProduct.quantity}'),
                IconButton.filled(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    BlocProvider.of<CartBloc>(context).add(
                      UpdateProductQuantityInCartEvent(
                        updateProductQuantityInCartParams:
                            UpdateProductQuantityInCartParams(
                          product: widget.cartProduct,
                          change: 1,
                        ),
                      ),
                    );
                  },
                  icon: Icon(FontAwesomeIcons.plus),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
