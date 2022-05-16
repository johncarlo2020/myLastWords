import 'package:flutter/material.dart';
import 'package:mylastwords/Screens/DashBoard/dashboard.dart';
import 'package:mylastwords/Screens/Login/login_screen.dart';
import 'package:mylastwords/Screens/AlarmScreen/alarm_screen.dart';
import 'package:mylastwords/Screens/Signup/signup_screen.dart';
import 'package:mylastwords/Screens/Welcome/components/background.dart';
import 'package:mylastwords/components/rounded_button.dart';
import 'package:mylastwords/constants.dart';
import 'package:package_info/package_info.dart';
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
  String token = '';

  @override
  void initState() {
    checkToken();
    super.initState();
  }

  checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = (prefs.getString('token') ?? '');
    });
    if (token != "") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return DashBoard();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {});

    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            Image.asset(
              "assets/images/logo_white.png",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            Text(
              "WELCOME!",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: txtColorLight),
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              "Passing on your Last Words \nto your love ones upon your demise!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: txtColorLight),
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              color: kPrimaryLightColor,
              text: "Get Started",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.06),
            FutureBuilder(
              future: PackageInfo.fromPlatform(),
              builder:
                  (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
                if (snapshot.hasData)
                  return Column(
                    children: [
                      Text(
                        "Version " +
                            snapshot.data!.version +
                            "." +
                            snapshot.data!.buildNumber,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: txtColorLight),
                      ),
                    ],
                  );
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
