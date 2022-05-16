import 'package:flutter/material.dart';
import 'package:mylastwords/components/text_field_container.dart';
import 'package:mylastwords/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  final TextEditingController controller;
  RoundedPasswordField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: hintText,
          icon: Icon(
            Icons.lock_outline,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility_outlined,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
