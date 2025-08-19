// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidgetTextRich extends StatelessWidget {
  const WidgetTextRich({Key? key, required this.head, required this.value})
    : super(key: key);

  final String head;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: head,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Theme.of(context).primaryColor,
        ),
        children: [
          TextSpan(text: ' : '),
          TextSpan(
            text: value,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
