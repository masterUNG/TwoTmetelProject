import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {

  final int productSetID;
  final String productSetName;
  final String productSetDescription;
  final String productSetImagePath;
  final String productSetPriceRetailMin;
  final String productSetPriceRetailMax;
  final String productSetPriceRetailAvg;
  final String campaignPriceMin;
  final String campaignPriceMax;
  final bool productSetIsSteel;




  ProductModel({
    required this.productSetID,
    required this.productSetName,
    required this.productSetDescription,
    required this.productSetImagePath,
    required this.productSetPriceRetailMin,
    required this.productSetPriceRetailMax,
    required this.productSetPriceRetailAvg,
    required this.campaignPriceMin,
    required this.campaignPriceMax,
    required this.productSetIsSteel,
  });
  
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productSetID': productSetID,
      'productSetName': productSetName,
      'productSetDescription': productSetDescription,
      'productSetImagePath': productSetImagePath,
      'productSetPriceRetailMin': productSetPriceRetailMin,
      'productSetPriceRetailMax': productSetPriceRetailMax,
      'productSetPriceRetailAvg': productSetPriceRetailAvg,
      'campaignPriceMin': campaignPriceMin,
      'campaignPriceMax': campaignPriceMax,
      'productSetIsSteel': productSetIsSteel,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      productSetID: (map['productSetID'] ?? 0) as int,
      productSetName: (map['productSetName'] ?? '') as String,
      productSetDescription: (map['productSetDescription'] ?? '') as String,
      productSetImagePath: (map['productSetImagePath'] ?? '') as String,
      productSetPriceRetailMin: (map['productSetPriceRetailMin'] ?? '') as String,
      productSetPriceRetailMax: (map['productSetPriceRetailMax'] ?? '') as String,
      productSetPriceRetailAvg: (map['productSetPriceRetailAvg'] ?? '') as String,
      campaignPriceMin: (map['campaignPriceMin'] ?? '') as String,
      campaignPriceMax: (map['campaignPriceMax'] ?? '') as String,
      productSetIsSteel: (map['productSetIsSteel'] ?? false) as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
