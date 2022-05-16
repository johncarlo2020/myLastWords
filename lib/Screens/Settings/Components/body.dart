

import 'package:flutter/material.dart';
import 'package:mylastwords/Screens/GalleryScreen/Components/viewImage.dart';
import 'package:mylastwords/components/header_tab_back.dart';
import 'package:mylastwords/constants.dart';
import 'package:mylastwords/components/header_tab.dart';
import 'package:mylastwords/data.dart';
import 'package:mylastwords/models/gallery.dart';

// import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {  
 
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {  
 
  
  @override
  void initState() {
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: HeaderTabBack(
        backgroundcolor: headerBackgroundColor,
        
      ),
      backgroundColor: darkBackground,
      );
    
  }
}
