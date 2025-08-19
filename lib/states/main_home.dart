// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twofmetelproject/utility/app_controller.dart';
import 'package:twofmetelproject/utility/app_service.dart';
import 'package:twofmetelproject/widgets/body_category.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key, required this.apiKey}) : super(key: key);

  final String apiKey;

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  var titles = <String>['Category', 'Order', 'Profile'];

  var iconDatas = <IconData>[
    Icons.card_travel,
    Icons.shopping_bag,
    Icons.person,
  ];

  var bodys = <Widget>[BodyCategory(), Text('Order'), Text('Profile')];

  AppController appController = Get.put(AppController());

  List<BottomNavigationBarItem> items = [];

  @override
  void initState() {
    super.initState();

   

    for (var i = 0; i < bodys.length; i++) {
      items.add(
        BottomNavigationBarItem(icon: Icon(iconDatas[i]), label: titles[i]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(title: Text(titles[appController.indexBody.value])),
        body: bodys[appController.indexBody.value],
        bottomNavigationBar: BottomNavigationBar(
          items: items,
          type: BottomNavigationBarType.fixed,
          currentIndex: appController.indexBody.value,onTap: (value) {

            appController.indexBody.value = value;
            
          },
        ),
      );
    });
  }
}
