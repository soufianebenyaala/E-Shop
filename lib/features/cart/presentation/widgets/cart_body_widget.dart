import 'package:e_shop/features/cart/presentation/blocs/cart/cart_bloc.dart';
import 'package:e_shop/features/cart/presentation/blocs/get_cart/get_cart_bloc.dart';
import 'package:e_shop/features/cart/presentation/widgets/list_of_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_shop/core/widgets/widgets_show_error_or_loading/error_message_widget.dart';
import 'package:e_shop/core/widgets/widgets_show_error_or_loading/loading_data_widget.dart';

class CartBodyWidget extends StatelessWidget {
  const CartBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {
        if (state is SaveProductToCartLoadedState) {
          BlocProvider.of<GetCartBloc>(context).add(GetAllCartEvent());
        }
        if (state is SaveCartLoadedState) {
          BlocProvider.of<GetCartBloc>(context).add(GetAllCartEvent());
        }
      },
      child: BlocBuilder<GetCartBloc, GetCartState>(
        builder: (context, state) {
          if (state is GetCartLoadingState) {
            return const LoadingDataWidget();
          }
          if (state is GetCartErrorState) {
            return ErrorMessageWidget(
              message: state.message,
            );
          }
          if (state is GetCartLoadedState) {
            return Column(
              children: [
                ListOfCartProductWidget(
                  getItems: () => BlocProvider.of<GetCartBloc>(context).add(
                    GetAllCartEvent(),
                  ),
                  cartProducts: state.cartModel?.products ?? [],
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Discounted Total',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            'Total',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '${state.cartModel?.discountedTotal ?? 0} TND',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            '${state.cartModel?.total ?? 0} TND',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.outline,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor:
                                      Theme.of(context).colorScheme.outline,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
