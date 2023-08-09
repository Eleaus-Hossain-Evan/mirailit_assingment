import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mirailit_assingment/utils/assets/resources.dart';

import '../../utils/network_util/network_handler.dart';

import '../domain/home/home_response.dart';
import '../domain/home/model/category_model.dart';
import '../domain/home/model/product_model.dart';
import '../domain/home/story_response.dart';
import '../utils/api_routes.dart';

class HomeRepo {
  final api = NetworkHandler.instance;

  Future<Either<CleanFailure, HomeResponse>> getHomeDate() async {
    return await api.get(
      fromData: (json) => HomeResponse.fromMap(json),
      endPoint: APIRoute.HOME,
      withToken: false,
    );
  }

  Future<Either<CleanFailure, StoryResponse>> fetchStories() async {
    try {
      final jsonData =
          await rootBundle.loadString('assets/json/stories_data.json');
      final data = json.decode(jsonData) as Map<String, dynamic>;
      final res = StoryResponse.fromMap(data);

      return right(res);
    } on Exception {
      left(
        CleanFailure.withData(
          tag: "failed to get data from asste",
          url: "",
          method: "",
          statusCode: 000,
          header: const {},
          body: const {},
          error: const CleanError(message: "failed to load data from asset"),
        ),
      );
    }
    return left(
      CleanFailure.withData(
        tag: "failed to get data from asste",
        url: "",
        method: "",
        statusCode: 000,
        header: const {},
        body: const {},
        error: const CleanError(message: "failed to load data from asset"),
      ),
    );
  }

  Future<Either<CleanFailure, List<CategoryModel>>> fetchCategories() async {
    return right(
      [
        const CategoryModel(image: Images.category1, title: "Cooking"),
        const CategoryModel(image: Images.category2, title: "Meat & Fish"),
        const CategoryModel(image: Images.category3, title: "Masala & Spice"),
      ],
    );
  }

  Future<Either<CleanFailure, List<ProductModel>>> fetchTapProduct() async {
    return right([
      const ProductModel(
        image: Images.product1,
        title: "India Gate Basmati Rice Pre...",
        weight: '5kg',
        price: 2650,
        discountPrice: 2290,
        discount: 14,
      ),
      const ProductModel(
        image: Images.product2,
        title: "Chicken Whole Sadia (900g)",
        weight: '0.9kg',
        price: 510,
        discountPrice: 455,
        discount: 11,
      ),
      const ProductModel(
        image: Images.product3,
        title: "Samahan Herb Tea",
        weight: '80gm',
        price: 890,
        discountPrice: 650,
        discount: 27,
      ),
    ]);
  }
}
