

import 'package:flutter/material.dart';
import 'package:mylastwords/Screens/GalleryScreen/Components/viewImage.dart';
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
      appBar: HeaderTab(
        backgroundcolor: headerBackgroundColor,
        title: 'Gallery',
        press: () {},
      ),
      backgroundColor: darkBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[         
          Expanded(child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
             ),
             child: (
               GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 10,mainAxisSpacing: 10,),
               itemBuilder: (context, index){
                 return RawMaterialButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context) => ViewImage(img: sampleGalleryData[index].imageUrl.toString())));
                 },
                 child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(2),
                    image: DecorationImage(
                        image:NetworkImage(sampleGalleryData[index].imageUrl.toString()),
                        fit:BoxFit.cover
                    ), 
                    ),

                 ),
                 );
               },
               itemCount: sampleGalleryData.length,
               )
             ),
          ))
      ],),),
    );
  }
}
