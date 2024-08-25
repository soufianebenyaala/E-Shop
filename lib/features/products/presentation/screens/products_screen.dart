import 'package:e_shop/core/Routes/app_route.dart';
import 'package:e_shop/core/constants/contants.dart';
import 'package:e_shop/core/widgets/global_text_form_field_widget.dart';
import 'package:e_shop/features/auth/presentation/blocs/bloc/auth_bloc.dart';
import 'package:e_shop/features/products/presentation/blocs/bloc/products_bloc.dart';
import 'package:e_shop/features/products/presentation/widgets/products_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final TextEditingController nameTEC = TextEditingController();
  RangeValues _currentRangeValues = const RangeValues(0, 10000);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E SHOP'),
        actions: [
          IconButton(
            onPressed: () async {
              BlocProvider.of<AuthBloc>(context).add(
                LogoutEvent(),
              );
              Navigator.pushNamed(
                context,
                AppRouteName.cartScreen,
              );
            },
            icon: const Icon(
              FontAwesomeIcons.cartShopping,
            ),
          ),
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
            icon: const Icon(FontAwesomeIcons.doorOpen),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Constants.generalHorizontalPadding,
          vertical: Constants.generalVerticalPadding,
        ),
        child: Column(
          children: [
            // Filter by Name
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GlobalTextFormFieldWidget(
                labelText: 'Filter by Name',
                controller: nameTEC,
                onChanged: (_) {
                  _applyFilters();
                },
              ),
            ),
            // Filter by Min Price
            RangeSlider(
              values: _currentRangeValues,
              max: 10000,
              divisions: 10000,
              labels: RangeLabels(
                _currentRangeValues.start.round().toString(),
                _currentRangeValues.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _currentRangeValues = values;
                });
                _applyFilters();
              },
            ),
            ProductsBodyWidget(applyResetFilters: _applyResetFilters),
          ],
        ),
      ),
    );
  }

  void _applyResetFilters() {
    setState(() {
      nameTEC.clear();
      _currentRangeValues = const RangeValues(0, 10000);
    });
  }

  void _applyFilters() {
    final nameFilter = nameTEC.text;
    final minPrice = _currentRangeValues.start;
    final maxPrice = _currentRangeValues.end;

    context.read<ProductsBloc>().add(
          FilterProductsEvent(
            nameFilter: nameFilter,
            minPrice: minPrice,
            maxPrice: maxPrice,
          ),
        );
  }
}
