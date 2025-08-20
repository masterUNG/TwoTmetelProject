// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twofmetelproject/states/show_message.dart';
import 'package:twofmetelproject/states/show_webview.dart';
import 'package:twofmetelproject/utility/app_controller.dart';
import 'package:twofmetelproject/utility/app_service.dart';
import 'package:twofmetelproject/widgets/body_category.dart';
import 'package:twofmetelproject/widgets/body_profile.dart';
import 'package:twofmetelproject/widgets/widget_button.dart';
import 'package:upgrader/upgrader.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key, this.apiKey}) : super(key: key);

  final String? apiKey;

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

  var bodys = <Widget>[BodyCategory(), Text('Order'), BodyProfile()];

  AppController appController = Get.put(AppController());

  List<BottomNavigationBarItem> items = [];

  @override
  void initState() {
    super.initState();

    checkSingInFirebase();

    createItem();
  }

  Future<void> checkSingInFirebase() async {
    var user = FirebaseAuth.instance.currentUser;

    debugPrint('## user จาก Firebase ---> $user');

    if (user == null) {
      //ยังไม่ได้ SignIn

      await FirebaseAuth.instance.signInAnonymously().then((value) {
        findTokenMessage();
      });
    } else {
      // sign In แล้ว
      findTokenMessage();
    }
  }

  Future<void> findTokenMessage() async {
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

    String? tokenMessage = await firebaseMessaging.getToken();

    debugPrint('## tokenMessage ---> $tokenMessage');

    //update Current Token => Database

    activeAfterReceiveMessage();
  }

  Future<void> activeAfterReceiveMessage() async {
    //Open App
    FirebaseMessaging.onMessage.listen((event) {
      String? title = event.notification!.title;
      String? body = event.notification!.body;

      String? catCode = body!.split('#').last;

      Get.snackbar(title!, 'ส่งข้อความให้ กลุ่ม $catCode');

      Get.to(ShowMessage(title: title, message: body));
    });

    //Off App
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      String? title = event.notification!.title;
      String? body = event.notification!.body;

      Get.snackbar(title!, body!);
    });
  }

  void createItem() {
    for (var i = 0; i < bodys.length; i++) {
      items.add(
        BottomNavigationBarItem(icon: Icon(iconDatas[i]), label: titles[i]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return UpgradeAlert(
        child: Scaffold(
          appBar: AppBar(
            title: Text(titles[appController.indexBody.value]),
            actions: [WidgetButton(label: 'Promotion', onPressed: () {
              Get.to(ShowWebview());
            }), SizedBox(width: 16)],
          ),
          body: bodys[appController.indexBody.value],
          bottomNavigationBar: BottomNavigationBar(
            items: items,
            type: BottomNavigationBarType.fixed,
            currentIndex: appController.indexBody.value,
            onTap: (value) {
              appController.indexBody.value = value;
            },
          ),
        ),
      );
    });
  }
}
