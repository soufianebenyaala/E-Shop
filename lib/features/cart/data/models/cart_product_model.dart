import 'package:hive/hive.dart';

part 'cart_product_model.g.dart';

@HiveType(typeId: 2)
class CartProductModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  double price;
  @HiveField(3)
  int quantity;
  @HiveField(4)
  double total;
  @HiveField(5)
  double discountPercentage;
  @HiveField(6)
  double discountedTotal;
  @HiveField(7)
  String thumbnail;

  CartProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
    required this.discountedTotal,
    required this.thumbnail,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'quantity': quantity,
      'total': total,
      'discountPercentage': discountPercentage,
      'discountedTotal': discountedTotal,
      'thumbnail': thumbnail,
    };
  }

  factory CartProductModel.fromMap(Map<String, dynamic> map) {
    return CartProductModel(
      id: map['id'] as int,
      title: map['title'] as String,
      price: map['price'] as double,
      quantity: map['quantity'] as int,
      total: map['total'] as double,
      discountPercentage: map['discountPercentage'] as double,
      discountedTotal: map['discountedTotal'] as double,
      thumbnail: map['thumbnail'] as String,
    );
  }
  CartProductModel copyWith({
    int? id,
    String? title,
    double? price,
    int? quantity,
    double? total,
    double? discountPercentage,
    double? discountedTotal,
    String? thumbnail,
  }) {
    return CartProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      total: total ?? this.total,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      discountedTotal: discountedTotal ?? this.discountedTotal,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }
}
