import 'package:flutter/material.dart';
import 'package:mylastwords/Screens/DashBoard/components/griddashboard.dart';
import 'package:mylastwords/Screens/Login/login_screen.dart';
import 'package:mylastwords/Services/user_service.dart';
import 'package:mylastwords/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String userName = '';

  @override
  void initState() {
    loadData();
    loadDetails();
    super.initState();
  }

  loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = (prefs.getString('name') ?? '');
    });
  }

  loadDetails() async {
    int id = await getuserId();
    String token = await getToken();
    print('User Id : ' + id.toString() + ' Token : ' + token);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: darkBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 70),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '$userName',
                      style: TextStyle(color: txtColorLight, fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      "Ironman",
                      style: TextStyle(color: txtColorLight, fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                IconButton(
                  alignment: Alignment.topCenter,
                  icon: Image.asset(
                    "assets/icons/logout.png",
                    width: size.width * 0.2,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Confirmation'),
                          content: Text('Do you really want to Logout?'),
                          backgroundColor: lightBackground,
                          actions: <Widget>[
                            new TextButton(
                              onPressed: () {
                                logout().then((value) => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return LoginScreen();
                                        },
                                      ),
                                    ));
                              },
                              child: Text(
                                'Yes',
                                style: TextStyle(
                                    color: txtColorDark, fontSize: 17),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context, rootNavigator: true).pop(
                                    false); // dismisses only the dialog and returns false
                              },
                              child: Text(
                                'No',
                                style: TextStyle(
                                    color: txtColorDark, fontSize: 15),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ),
          SizedBox(height: 80),
          GridDashBoard()
        ],
      ),
    );
  }
}
