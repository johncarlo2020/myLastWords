import 'package:flutter/material.dart';
import 'package:mylastwords/constants.dart';

class HeaderTab extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final void Function() press;
  final Color? backgroundcolor;

  const HeaderTab({
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
        IconButton(
          icon: Icon(Icons.add),
          onPressed: press,
          iconSize: 35,
        ),
      ],
    );
  }
}
