// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidgetForm extends StatelessWidget {
  const WidgetForm({
    Key? key,
    this.hintText,
    this.suffixIcon,
    this.obscureText,
    this.validator,
  }) : super(key: key);

  final String? hintText;
  final Widget? suffixIcon;
  final bool? obscureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        filled: true,
        border: InputBorder.none,
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
