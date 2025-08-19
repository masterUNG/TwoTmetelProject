import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twofmetelproject/states/authen.dart';
import 'package:twofmetelproject/utility/app_constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Authen(),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: AppConstant.appColor),
      ),
    );
  }
}
