import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:twofmetelproject/models/category_model.dart';
import 'package:twofmetelproject/models/product_model.dart';

class AppService {
  Future<List<ProductModel>> readProductByCatCode({
    required String catCode,
  }) async {
    var productModels = <ProductModel>[];

    // List<ProductModel> productModels = [];

    String urlAPI =
        'https://u1.2sonline.net/api/Product/GetProductSetsByCategoryCode?categorycode=$catCode';

    var result = await Dio().get(urlAPI);

    for (var element in result.data) {
      ProductModel productModel = ProductModel.fromMap(element);

      productModels.add(productModel);
    }

    return productModels;
  }

  Future<List<CategoryModel>> readAllCategory() async {
    var categoryModels = <CategoryModel>[];

    String urlAPI =
        'https://u1.2sonline.net/api/Product/GetProductCategorySets';

    var result = await Dio().get(urlAPI);

    for (var element in result.data) {
      CategoryModel model = CategoryModel.fromMap(element);

      debugPrint('## name --> ${model.productCategoryName}');

      categoryModels.add(model);
    }

    return categoryModels;
  }
}
