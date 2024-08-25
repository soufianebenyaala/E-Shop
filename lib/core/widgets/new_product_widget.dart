// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:e_shop/features/products/data/models/product_model.dart';
import 'package:flutter/material.dart';

class NewProductWidget extends StatelessWidget {
  const NewProductWidget({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    // Determine if the product is new
    bool isNew = product.meta != null &&
        DateTime.now().difference(product.meta!.createdAt).inDays <= 3;
    return Row(
      children: [
        if (isNew)
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Text(
              'New',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
          ),
      ],
    );
  }
}
