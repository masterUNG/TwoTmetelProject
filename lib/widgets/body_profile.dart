import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:twofmetelproject/states/authen.dart';
import 'package:twofmetelproject/utility/app_dialog.dart';
import 'package:twofmetelproject/widgets/widget_button.dart';

class BodyProfile extends StatelessWidget {
  const BodyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetButton(
      label: 'SignOut',
      onPressed: () {
        AppDialog().normalDialog(
          title: Text('SignOut ?'),
          content: Text('Please Confire for SignOut'),firstAction: WidgetButton(label: 'Confirm', onPressed: ()async {
            
            await GetStorage().erase().then((value) {
              
              Get.offAll(Authen());
            },);
          },)
        );
      },
    );
  }
}
