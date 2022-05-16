import 'package:flutter/material.dart';
import 'package:mylastwords/Screens/NoteScreen/Components/addNote.dart';
import 'package:mylastwords/Services/notes_services.dart';
import 'package:mylastwords/constants.dart';
import 'package:mylastwords/components/header_tab.dart';
import 'package:mylastwords/data.dart';
import 'package:mylastwords/models/api_response.dart';
import 'package:mylastwords/models/note.dart';

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
    loadNotes();
    super.initState();
  }

  void loadNotes() async {
    ApiResponse response = await getNotes();
    if (response.error == null) {
      print(response.data);
    } else {
      print(response.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: HeaderTab(
        backgroundcolor: headerBackgroundColor,
        title: 'Notes',
        press: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddNote();
              },
            ),
          );
        },
      ),
      backgroundColor: darkBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 30),
          Expanded(
              child: ListView(
            children: sampleNotesData.map((note) {
              return GestureDetector(
                onTap: () {
                  print("Tapped a Container");
                },
                child: Container(
                  margin:
                      const EdgeInsets.only(bottom: 12, left: 15, right: 15),
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [kPrimaryLightColor, lightBackground],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      boxShadow: [],
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                note.title.toString(),
                                style: TextStyle(
                                    color: txtColorDark,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "May 05, 2022",
                            style: TextStyle(
                                color: txtColorDark,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          IconButton(
                              icon: Icon(Icons.delete),
                              color: darkBackground,
                              onPressed: () {}),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          )),
        ],
      ),
    );
  }
}
