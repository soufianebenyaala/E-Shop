import 'package:e_shop/core/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContentNotFoundWidget extends StatelessWidget {
  final String? message;
  const ContentNotFoundWidget({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SvgPicture.asset(
            Assets.noDataFound,
            width: 128,
            height: 128,
            allowDrawingOutsideViewBox: true,
          ),
          Text(
            message ?? 'No Data Found',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ],
      ),
    );
  }
}
