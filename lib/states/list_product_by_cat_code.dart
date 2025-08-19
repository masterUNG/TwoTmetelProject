// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:twofmetelproject/models/category_model.dart';
import 'package:twofmetelproject/models/product_model.dart';
import 'package:twofmetelproject/utility/app_service.dart';
import 'package:twofmetelproject/widgets/widget_text_rich.dart';

class ListProductByCatCode extends StatelessWidget {
  const ListProductByCatCode({Key? key, required this.categoryModel})
    : super(key: key);

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryModel.productCategoryName)),
      body: FutureBuilder(
        future: AppService().readProductByCatCode(
          catCode: categoryModel.productCategoryCode,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasData) {
              List<ProductModel> productModels = snapshot.data!;

              if (productModels.isNotEmpty) {
                return ListView.builder(
                  itemCount: productModels.length,
                  itemBuilder: (context, index) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Image.network(
                              productModels[index].productSetImagePath,
                            ),
                          ),

                          SizedBox(width: 16),

                          Expanded(
                            flex: 3,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(productModels[index].productSetName),
                                WidgetTextRich(
                                  head: 'PriceRetailMin',
                                  value: productModels[index]
                                      .productSetPriceRetailMin,
                                ),
                                WidgetTextRich(
                                  head: 'PriceRetailMax',
                                  value: productModels[index]
                                      .productSetPriceRetailMax,
                                ),
                                WidgetTextRich(
                                  head: 'PriceRetailAvg',
                                  value: productModels[index]
                                      .productSetPriceRetailAvg,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(color: Colors.grey,),
                    ],
                  ),
                );
              } else {
                return SizedBox();
              }
            } else {
              return SizedBox();
            }
          }
        },
      ),
    );
  }
}
