import 'package:e_shop/core/Routes/app_route.dart';
import 'package:e_shop/core/app_preference/app_preferences.dart';
import 'package:e_shop/core/constants/contants.dart';
import 'package:e_shop/features/auth/presentation/blocs/bloc/auth_bloc.dart';
import 'package:e_shop/features/product_details/presentation/blocs/bloc/product_details_bloc.dart';
import 'package:e_shop/features/product_details/presentation/widgets/product_details_body_widget.dart';
import 'package:e_shop/features/products/presentation/blocs/bloc/products_bloc.dart';
import 'package:e_shop/features/products/presentation/widgets/products_body_widget.dart';
import 'package:e_shop/injection_container.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int id;
  const ProductDetailsScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.get<ProductDetailsBloc>()
        ..add(
          GetProductDetailsEvent(id: id),
        ),
      child: Scaffold(
        appBar: AppBar(),
        body: ProductDetailsBodyWidget(),
      ),
    );
  }
}
