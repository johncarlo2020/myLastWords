import 'package:flutter/material.dart';
import 'package:mylastwords/constants.dart';

class HeaderTabBack extends StatelessWidget implements PreferredSizeWidget { 
 
  final Color? backgroundcolor;

  const HeaderTabBack({
    Key? key,

    this.backgroundcolor,
    
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundcolor,
      centerTitle: true,
      
      elevation: 0,
      actions: [
      
      ],
    );
  }
}
