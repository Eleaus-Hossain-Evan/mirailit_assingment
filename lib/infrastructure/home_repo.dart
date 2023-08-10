import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mirailit_assingment/utils/assets/resources.dart';

import '../../utils/network_util/network_handler.dart';

import '../domain/home/model/category_model.dart';
import '../domain/home/model/product_model.dart';
import '../domain/home/story_response.dart';

class HomeRepo {
  final api = NetworkHandler.instance;

  Future<Either<CleanFailure, List<String>>> getHomeDate() async {
    return right(
      [
        Images.banner1,
        Images.banner2,
        Images.banner3,
      ],
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

  Future<Either<CleanFailure, List<ProductModel>>> fetchTopProduct() async {
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

  Future<Either<CleanFailure, List<ProductModel>>> fetchHotProduct() async {
    return right([
      const ProductModel(
        image: Images.hotProduct1,
        title: "Haldiram’s Methi Crispy Puffs",
        weight: '200gm',
        price: 250,
        discountPrice: 0,
        discount: 0,
      ),
      const ProductModel(
        image: Images.hotProduct2,
        title: "Current Cheese Ball",
        weight: '100gm',
        price: 180,
        discountPrice: 0,
        discount: 0,
      ),
      const ProductModel(
        image: Images.hotProduct3,
        title: "Instant Rice Noodles Vifon",
        weight: '1kg',
        price: 115,
        discountPrice: 98,
        discount: 12,
      ),
    ]);
  }

  Future<Either<CleanFailure, List<ProductModel>>>
      fetchNewArrivalProduct() async {
    return right([
      const ProductModel(
        image: Images.newArrivalProduct1,
        title: "Finest Pomegra-nate Juice",
        weight: '2ltr',
        price: 550,
        discountPrice: 0,
        discount: 0,
      ),
      const ProductModel(
        image: Images.newArrivalProduct2,
        title: "Shan Punjabi Yakhni Pilau",
        weight: '50g',
        price: 190,
        discountPrice: 0,
        discount: 0,
      ),
      const ProductModel(
        image: Images.newArrivalProduct3,
        title: "Aci Pure Suji (500g)",
        weight: '0.5kg',
        price: 250,
        discountPrice: 0,
        discount: 0,
      ),
    ]);
  }
}
