// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mylastwords/Screens/AlarmScreen/alarm_screen.dart';
import 'package:mylastwords/Screens/GalleryScreen/gallery_screen.dart';
import 'package:mylastwords/Screens/NoteScreen/note_screen.dart';
import 'package:mylastwords/Screens/Settings/settings_screen.dart';
// import 'package:flutter_auth/Screens/AlarmScreen/gallery_screen.dart';
// import 'package:flutter_auth/Screens/AlarmScreen/settings_screen.dart';
import 'package:mylastwords/constants.dart';

class GridDashBoard extends StatelessWidget {
  Items item1 = new Items(
      id: 1, 
      title: "Alarm Clock",
      details: "No alarms",
      img: "assets/icons/alarm_clock.png");
  Items item2 = new Items(
      id: 2,
      title: "Notes",
      details: "No notes",
      img: "assets/icons/notes.png");
  Items item3 = new Items(
      id: 3,
      title: "Gallery",
      details: "No Images or Videos",
      img: "assets/icons/gallery.png");
  Items item4 = new Items(
      id: 4,
      title: "Settings",
      details: "No updates",
      img: "assets/icons/settings.png");

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4];

    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 20, right: 20),
          crossAxisCount: 2,
          crossAxisSpacing: 25,
          mainAxisSpacing: 25,
          children: myList.map((data) {
            return GestureDetector(
                onTap: () {
                  if (data.id == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return AlarmScreen();
                        },
                      ),
                    );
                  } else if (data.id == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return NoteScreen();
                        },
                      ),
                    );
                  } else if (data.id == 3) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return GalleryScreen();
                        },
                      ),
                    );
                  }
                  else if (data.id == 4) {
                    
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SettingsScreen();
                        },
                      ),
                    );
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          data.img!,
                          width: 75,
                          height: 60,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          data.title!,
                          style: TextStyle(
                              color: txtColorDark,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          data.details!,
                          style: TextStyle(
                              color: txtColorDark,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ]),
                ));
          }).toList()),
    );
  }
}

class Items {
  int? id;
  String? title;
  String? details;
  String? img;
  Items({this.id, this.title, this.details, this.img});
}
