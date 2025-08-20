// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ShowMessage extends StatelessWidget {
  const ShowMessage({
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);

  final String title;
  final String message;


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: Column(
      children: [
        Text(title),
        Text(message),
      ],
    ),);
  }
}
