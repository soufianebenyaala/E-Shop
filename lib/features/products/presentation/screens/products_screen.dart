import 'package:e_shop/core/Routes/app_route.dart';
import 'package:e_shop/core/app_preference/app_preferences.dart';
import 'package:e_shop/core/constants/contants.dart';
import 'package:e_shop/features/auth/presentation/blocs/bloc/auth_bloc.dart';
import 'package:e_shop/features/products/presentation/blocs/bloc/products_bloc.dart';
import 'package:e_shop/features/products/presentation/widgets/products_body_widget.dart';
import 'package:e_shop/injection_container.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () async {
                BlocProvider.of<AuthBloc>(context).add(
                  LogoutEvent(),
                );
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRouteName.loginScreen,
                  (route) => false,
                );
              },
              icon: Icon(FontAwesomeIcons.doorOpen),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.generalHorizontalPadding,
            vertical: Constants.generalVerticalPadding,
          ),
          child: ProductsBodyWidget(),
        ),
      
    );
  }
}
