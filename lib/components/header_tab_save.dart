import 'package:flutter/material.dart';
import 'package:mylastwords/constants.dart';

class HeaderTabSave extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final void Function() press;
  final Color? backgroundcolor;

  const HeaderTabSave({
    Key? key,
    this.title,
    this.backgroundcolor,
    required this.press,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundcolor,
      centerTitle: true,
      title: Text(title!),
      elevation: 0,
      actions: [
        TextButton(
          onPressed: press,
          child: Text(
            "Save",
            style: TextStyle(
                color: Colors.white, fontSize: 19, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
