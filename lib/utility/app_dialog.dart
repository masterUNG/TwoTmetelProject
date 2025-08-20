import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twofmetelproject/widgets/widget_button.dart';

class AppDialog {
  void normalDialog({
    Widget? icon,
    Widget? title,
    Widget? content,
    Widget? firstAction,
  }) {
    Get.dialog(
      AlertDialog(
        icon: icon,
        title: title,
        content: content,
        actions: [
          firstAction ?? SizedBox(),
          WidgetButton(label: 'Cancel', onPressed: () => Get.back()),
        ],
      ),
    );
  }
}
