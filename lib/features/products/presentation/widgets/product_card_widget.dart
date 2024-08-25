// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:e_shop/core/Routes/app_route.dart';
import 'package:e_shop/core/constants/contants.dart';
import 'package:e_shop/core/widgets/new_product_widget.dart';
import 'package:e_shop/core/widgets/vente_flash_and_discount_percentage_widget.dart';
import 'package:e_shop/features/cart/presentation/blocs/cart/cart_bloc.dart';
import 'package:e_shop/features/products/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating/flutter_rating.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductModel product;
  const ProductCardWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRouteName.productDetailsScreen,
          arguments: product.id,
        );
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    color:
                        Theme.of(context).colorScheme.surfaceContainerHighest,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      product.thumbnail!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 5,
                  child: NewProductWidget(
                    product: product,
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: VenteFlashAndDiscountPercentageWidget(
                    product: product,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.cardHorizontalPadding,
                vertical: Constants.cardVerticalPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${product.price} TND',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  StarRating(
                    size: 15,
                    color: Colors.amber,
                    mainAxisAlignment: MainAxisAlignment.start,
                    rating: product.rating,
                    allowHalfRating: true,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: FilledButton.tonal(
                          style: FilledButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            BlocProvider.of<CartBloc>(context).add(
                              SaveProductToCartEvent(
                                productModel: product,
                              ),
                            );
                          },
                          child: Text('Buy'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
