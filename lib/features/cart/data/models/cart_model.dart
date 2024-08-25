import 'package:e_shop/features/cart/data/models/cart_product_model.dart';
import 'package:hive/hive.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 1)
class CartModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  List<CartProductModel> products;
  @HiveField(2)
  double total;
  @HiveField(3)
  double discountedTotal;
  @HiveField(4)
  int userId;
  @HiveField(5)
  int totalProducts;
  @HiveField(6)
  int totalQuantity;

  CartModel({
    required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'products': products.map((x) => x.toMap()).toList(),
      'total': total,
      'discountedTotal': discountedTotal,
      'userId': userId,
      'totalProducts': totalProducts,
      'totalQuantity': totalQuantity,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'] as int,
      products: map['products'] != null
          ? List<CartProductModel>.from(
              (map['products']).map<CartProductModel>(
                (x) => CartProductModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
      total: map['total'] as double,
      discountedTotal: map['discountedTotal'] as double,
      userId: map['userId'] as int,
      totalProducts: map['totalProducts'] as int,
      totalQuantity: map['totalQuantity'] as int,
    );
  }
}
