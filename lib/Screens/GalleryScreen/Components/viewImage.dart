import 'package:flutter/material.dart';
import 'package:mylastwords/components/header_tab.dart';
import 'package:mylastwords/components/header_tab_back.dart';
import 'package:mylastwords/constants.dart';

class ViewImage extends StatelessWidget {
final String img;

  ViewImage({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {       
    return Scaffold(
       appBar: HeaderTabBack(
        backgroundcolor: headerBackgroundColor,
       
      ),
      body: Container(child:Column(
        children: <Widget>[
          Expanded(child: Container(
            
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(0)),
            image: DecorationImage(image: NetworkImage(img),
              fit: BoxFit.contain
            ),
            ),
          ),
          )
        ],
      ),
      ),
    );
  }
}