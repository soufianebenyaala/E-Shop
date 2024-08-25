import 'package:e_shop/core/constants/contants.dart';
import 'package:e_shop/features/auth/presentation/blocs/bloc/auth_bloc.dart';
import 'package:e_shop/features/cart/presentation/blocs/get_cart/get_cart_bloc.dart';
import 'package:e_shop/features/cart/presentation/widgets/cart_body_widget.dart';
import 'package:e_shop/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.get<GetCartBloc>()..add(GetAllCartEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('E SHOP'),
          actions: [
            IconButton(
              onPressed: () async {
                BlocProvider.of<AuthBloc>(context).add(
                  LogoutEvent(),
                );
              },
              icon: const Icon(FontAwesomeIcons.doorOpen),
            )
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Constants.generalHorizontalPadding,
            vertical: Constants.generalVerticalPadding,
          ),
          child: CartBodyWidget(),
        ),
      ),
    );
  }
}
