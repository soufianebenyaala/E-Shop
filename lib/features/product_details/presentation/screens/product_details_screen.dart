import 'package:e_shop/features/product_details/presentation/blocs/bloc/product_details_bloc.dart';
import 'package:e_shop/features/product_details/presentation/widgets/product_details_body_widget.dart';
import 'package:e_shop/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        appBar: AppBar(
          title: const Text('E SHOP'),
        ),
        body: const ProductDetailsBodyWidget(),
      ),
    );
  }
}
