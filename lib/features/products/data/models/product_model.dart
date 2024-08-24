// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:e_shop/features/products/data/models/dimensions_model.dart';
import 'package:e_shop/features/products/data/models/meta_model.dart';
import 'package:e_shop/features/products/data/models/review_model.dart';

class ProductModel {
  int id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double rating;
  int stock;
  List<String> tags;
  String? brand;
  String? sku;
  int? weight;
  DimensionsModel? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<ReviewModel> reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  MetaModel? meta;
  String? thumbnail;
  List<String> images;

  ProductModel({
    required this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    required this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.thumbnail,
    required this.images,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'tags': tags,
      'brand': brand,
      'sku': sku,
      'weight': weight,
      'dimensions': dimensions?.toMap(),
      'warrantyInformation': warrantyInformation,
      'shippingInformation': shippingInformation,
      'availabilityStatus': availabilityStatus,
      'reviews': reviews.map((x) => x.toMap()).toList(),
      'returnPolicy': returnPolicy,
      'minimumOrderQuantity': minimumOrderQuantity,
      'meta': meta?.toMap(),
      'thumbnail': thumbnail,
      'images': images,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      price: map['price'] != null ? map['price'] as double : null,
      discountPercentage: map['discountPercentage'] != null
          ? (map['discountPercentage']).toDouble() as double
          : null,
      rating: map['rating'] != null ? map['rating'] as double : 0,
      stock: map['stock'] != null ? map['stock'] as int : 0,
      tags: map['tags'] != null ? (map['tags']).cast<String>() : [],
      brand: map['brand'] != null ? map['brand'] as String : null,
      sku: map['sku'] != null ? map['sku'] as String : null,
      weight: map['weight'] != null ? map['weight'] as int : null,
      dimensions: map['dimensions'] != null
          ? DimensionsModel.fromMap(map['dimensions'] as Map<String, dynamic>)
          : null,
      warrantyInformation: map['warrantyInformation'] != null
          ? map['warrantyInformation'] as String
          : null,
      shippingInformation: map['shippingInformation'] != null
          ? map['shippingInformation'] as String
          : null,
      availabilityStatus: map['availabilityStatus'] != null
          ? map['availabilityStatus'] as String
          : null,
      reviews: map['reviews'] != null
          ? List<ReviewModel>.from(
              (map['reviews']).map<ReviewModel?>(
                (x) => ReviewModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
      returnPolicy:
          map['returnPolicy'] != null ? map['returnPolicy'] as String : null,
      minimumOrderQuantity: map['minimumOrderQuantity'] != null
          ? map['minimumOrderQuantity'] as int
          : null,
      meta: map['meta'] != null
          ? MetaModel.fromMap(map['meta'] as Map<String, dynamic>)
          : null,
      thumbnail: map['thumbnail'] != null ? map['thumbnail'] as String : null,
      images: map['images'] != null ? (map['images']).cast<String>() : [],
    );
  }
}
