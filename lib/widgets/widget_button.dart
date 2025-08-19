// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidgetButton extends StatelessWidget {
  const WidgetButton({Key? key, required this.label, required this.onPressed})
    : super(key: key);

  final String label;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(4))
      ),
    );
  }
}
