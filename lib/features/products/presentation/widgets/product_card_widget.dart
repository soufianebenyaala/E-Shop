// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:e_shop/core/Routes/app_route.dart';
import 'package:e_shop/core/constants/contants.dart';
import 'package:e_shop/core/widgets/new_product_widget.dart';
import 'package:e_shop/core/widgets/vente_flash_and_discount_percentage_widget.dart';
import 'package:e_shop/features/products/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductModel product;
  const ProductCardWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    // Determine if the product is new
    bool isNew = product.meta != null &&
        DateTime.now().difference(product.meta!.createdAt).inDays <= 3;
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
                    borderRadius: BorderRadius.all(Radius.circular(12)),
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
                    product.title ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${product.price ?? 0} TND',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  StarRating(
                    size: 15,
                    color: Colors.amber,
                    mainAxisAlignment: MainAxisAlignment.start,
                    rating: product.rating,
                    allowHalfRating: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
