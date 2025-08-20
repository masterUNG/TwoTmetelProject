import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:twofmetelproject/firebase_options.dart';
import 'package:twofmetelproject/states/authen.dart';
import 'package:twofmetelproject/states/main_home.dart';
import 'package:twofmetelproject/utility/app_constant.dart';

String? initialRoute;

List<GetPage<dynamic>>? getPages = [
  GetPage(name: '/authen', page: () => Authen()),
  GetPage(name: '/mainHome', page: () => MainHome()),
];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) async {
    await GetStorage.init().then((value) {
      var data = GetStorage().read('user');

      debugPrint('## data ที่อ่านได้จาก GetStorage --> $data');

      if (data == null) {
        //ยังไม่ได้ login
        initialRoute = '/authen';
        runApp(MyApp());
      } else {
        //login แล้ว
        initialRoute = '/mainHome';
        runApp(MyApp());
      }
    });
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // home: Authen(),
      getPages: getPages,

      initialRoute: initialRoute,

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: AppConstant.appColor),
      ),
    );
  }
}
