// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:e_shop/features/products/data/models/product_model.dart';
import 'package:flutter/material.dart';

class VenteFlashAndDiscountPercentageWidget extends StatelessWidget {
  const VenteFlashAndDiscountPercentageWidget({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (product.price< 10)
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              color: Theme.of(context).colorScheme.secondaryContainer,
            ),
            padding: const EdgeInsets.all(5),
            child: Text(
              'Vente Flash',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
            ),
          )
        else if (product.price< 50)
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              color: Theme.of(context).colorScheme.tertiaryContainer,
            ),
            padding: const EdgeInsets.all(5),
            child: Text(
              '- ${product.discountPercentage!.toStringAsFixed(1)}%',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                  ),
            ),
          ),
      ],
    );
  }
}
