import 'package:e_shop/core/constants/contants.dart';
import 'package:e_shop/core/utils/utils.dart';
import 'package:e_shop/core/widgets/new_product_widget.dart';
import 'package:e_shop/features/product_details/presentation/widgets/review_widget.dart';
import 'package:e_shop/features/products/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductDetailsWidget extends StatelessWidget {
  final ProductModel product;
  const ProductDetailsWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: product.images.length,
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  color: Theme.of(context).colorScheme.surface,
                ),
                margin: const EdgeInsets.all(5),
                child: Image.network(
                  product.images[index],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Constants.generalHorizontalPadding,
              vertical: Constants.generalVerticalPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NewProductWidget(
                  product: product,
                ),
                Text(
                  product.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Row(
                  children: [
                    Text(
                      '${Utils.calculatePriceAfterDiscount(product.price, product.discountPercentage!)} TND',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${product.price} TND',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .surfaceContainerHighest,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Theme.of(context)
                                .colorScheme
                                .surfaceContainerHighest,
                          ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        color: Theme.of(context).colorScheme.tertiaryContainer,
                      ),
                      padding: const EdgeInsets.all(3),
                      child: Text(
                        '- ${product.discountPercentage!.toStringAsFixed(1)}%',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onTertiaryContainer,
                            ),
                      ),
                    ),
                  ],
                ),
                Text(
                  '${product.stock} article${product.stock > 1 ? 's' : ''} (${product.availabilityStatus})',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Row(
                  children: product.tags
                      .map(
                        (tag) => Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Text(
                            '#$tag',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.surfaceTint,
                                ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                StarRating(
                  color: Colors.amber,
                  mainAxisAlignment: MainAxisAlignment.start,
                  rating: product.rating,
                  allowHalfRating: true,
                ),
                Text(product.description ?? ''),
                ListTile(
                  leading: const Icon(FontAwesomeIcons.boxesStacked),
                  title: const Text('Minimum Order Quantity'),
                  subtitle: Text('${product.minimumOrderQuantity}'),
                ),
                ListTile(
                  leading: const Icon(FontAwesomeIcons.fileShield),
                  title: const Text('Return Policy'),
                  subtitle: Text('${product.returnPolicy}'),
                ),
                ListTile(
                  leading: const Icon(FontAwesomeIcons.truckFast),
                  title: const Text('Shipping Information'),
                  subtitle: Text('${product.shippingInformation}'),
                ),
                if (product.reviews.isNotEmpty)
                  Text(
                    'reviews :',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: product.reviews.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      ReviewWidget(review: product.reviews[index]),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
