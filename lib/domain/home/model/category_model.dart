import 'dart:convert';

import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final String image;
  final String title;

  const CategoryModel({
    required this.image,
    required this.title,
  });

  factory CategoryModel.init() => const CategoryModel(image: '', title: '');

  CategoryModel copyWith({
    String? image,
    String? title,
  }) {
    return CategoryModel(
      image: image ?? this.image,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'title': title,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      image: map['image'] ?? '',
      title: map['title'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source));

  @override
  String toString() => 'CategoryModel(image: $image, title: $title)';

  @override
  List<Object> get props => [image, title];
}
