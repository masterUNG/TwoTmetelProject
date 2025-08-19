import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoryModel {

  final bool isSteel;
  final String productCategoryCode;
  final String productCategoryName;
  final String productCategoryImageFileName;
  final String productCategoryImagePath;
  CategoryModel({
    required this.isSteel,
    required this.productCategoryCode,
    required this.productCategoryName,
    required this.productCategoryImageFileName,
    required this.productCategoryImagePath,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isSteel': isSteel,
      'productCategoryCode': productCategoryCode,
      'productCategoryName': productCategoryName,
      'productCategoryImageFileName': productCategoryImageFileName,
      'productCategoryImagePath': productCategoryImagePath,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      isSteel: (map['isSteel'] ?? false) as bool,
      productCategoryCode: (map['productCategoryCode'] ?? '') as String,
      productCategoryName: (map['productCategoryName'] ?? '') as String,
      productCategoryImageFileName: (map['productCategoryImageFileName'] ?? '') as String,
      productCategoryImagePath: (map['productCategoryImagePath'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) => CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
