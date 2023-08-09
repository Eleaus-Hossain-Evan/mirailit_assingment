import 'dart:convert';

import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String image;
  final String title;
  final String weight;
  final int price;
  final int discountPrice;
  final int discount;

  const ProductModel({
    required this.image,
    required this.title,
    required this.weight,
    required this.price,
    required this.discountPrice,
    required this.discount,
  });

  factory ProductModel.init() => const ProductModel(
      image: '',
      title: '',
      weight: '',
      price: 0,
      discountPrice: 0,
      discount: 0);

  ProductModel copyWith({
    String? image,
    String? title,
    String? weight,
    int? price,
    int? discountPrice,
    int? discount,
  }) {
    return ProductModel(
      image: image ?? this.image,
      title: title ?? this.title,
      weight: weight ?? this.weight,
      price: price ?? this.price,
      discountPrice: discountPrice ?? this.discountPrice,
      discount: discount ?? this.discount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'title': title,
      'weight': weight,
      'price': price,
      'discountPrice': discountPrice,
      'discount': discount,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      image: map['image'] ?? '',
      title: map['title'] ?? '',
      weight: map['weight'] ?? '',
      price: map['price']?.toInt() ?? 0,
      discountPrice: map['discountPrice']?.toInt() ?? 0,
      discount: map['discount']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(image: $image, title: $title, weight: $weight, price: $price, discountPrice: $discountPrice, discount: $discount)';
  }

  @override
  List<Object> get props {
    return [
      image,
      title,
      weight,
      price,
      discountPrice,
      discount,
    ];
  }
}
