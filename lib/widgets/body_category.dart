import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twofmetelproject/models/category_model.dart';
import 'package:twofmetelproject/states/list_product_by_cat_code.dart';
import 'package:twofmetelproject/utility/app_service.dart';

class BodyCategory extends StatelessWidget {
  const BodyCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AppService().readAllCategory(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasData) {
            List<CategoryModel> categoryModles = snapshot.data!;

            if (categoryModles.isNotEmpty) {
              return GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 4),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1 / 1.2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                ),
                itemCount: categoryModles.length,
                itemBuilder: (context, index) => InkWell(onTap: () {
                  
                  Get.to(ListProductByCatCode(categoryModel: categoryModles[index]));
                },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(
                          categoryModles[index].productCategoryImagePath,
                          width: Get.width / 4,
                        ),
                        Text(categoryModles[index].productCategoryName),
                      ],
                    ),
                  ),
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
    );
  }
}
