import 'package:e_shop/core/utils/utils.dart';
import 'package:e_shop/features/products/data/models/review_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class ReviewWidget extends StatelessWidget {
  final ReviewModel review;
  const ReviewWidget({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StarRating(
              size: 15,
              color: Colors.amber,
              mainAxisAlignment: MainAxisAlignment.start,
              rating: review.rating.toDouble(),
              allowHalfRating: true,
            ),
            Text(
              Utils.dateTimetoStringYearsMonthDay(review.date),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        Text(
          review.comment,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          'par ${review.reviewerName}',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.surfaceTint,
              ),
        ),
      ],
    );
  }
}
