import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twofmetelproject/states/main_home.dart';
import 'package:twofmetelproject/utility/app_constant.dart';
import 'package:twofmetelproject/utility/app_controller.dart';
import 'package:twofmetelproject/widgets/widget_button.dart';
import 'package:twofmetelproject/widgets/widget_form.dart';
import 'package:twofmetelproject/widgets/widget_icon_button.dart';

class Authen extends StatefulWidget {
  const Authen({super.key});

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  //สร้าง Instant หรือ Dependency สำหรับเรียก redEye
  AppController appController = Get.put(AppController());

  //Globle Key สำหรับการ ส่อง Form
  final keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.asset('images/authen3.png'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: Get.width * 0.75,
                child: Form(
                  key: keyForm,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      WidgetForm(
                        hintText: 'User :',
                        suffixIcon: Icon(Icons.person),
                        validator: (String? string) {
                          if (string?.isEmpty ?? true) {
                            return 'Please Fill User';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 16),

                      Obx(() {
                        return WidgetForm(
                          hintText: 'Password :',
                          obscureText: appController.redEye.value,
                          suffixIcon: WidgetIconButton(
                            iconData: appController.redEye.value
                                ? Icons.remove_red_eye
                                : Icons.remove_red_eye_outlined,
                            onPressed: () {
                              appController.redEye.value =
                                  !appController.redEye.value;
                            },
                          ),

                          validator: (String? string) {
                            if (string?.isEmpty ?? true) {
                              return 'Please Fill Password';
                            } else {
                              return null;
                            }
                          },
                        );
                      }),

                      SizedBox(height: 16),

                      SizedBox(
                        width: Get.width * 0.75,
                        child: WidgetButton(label: 'Login', onPressed: () {


                          if (keyForm.currentState!.validate()) {
                            
                            //กระบวนการเช็ค Login

                            Get.offAll(MainHome(apiKey: AppConstant.testAPIkey,));


                          }



                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
