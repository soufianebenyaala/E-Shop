import 'package:e_shop/core/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorMessageWithRetryButtonWidget extends StatelessWidget {
  final String message;
  final void Function()? onTap;
  const ErrorMessageWithRetryButtonWidget({
    super.key,
    required this.message,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.serverIconError,
            width: 160,
            height: 160,
            fit: BoxFit.fill,
            allowDrawingOutsideViewBox: false,
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w700,
                ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              margin: const EdgeInsets.only(top: 20.0),
              width: 96,
              height: 40,
              decoration: BoxDecoration(
                //  color: QuestColors.serverErrorRetryBg,
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  //   color: QuestColors.serverErrorRetryBg,
                  width: 2.0,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                'Retry',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
