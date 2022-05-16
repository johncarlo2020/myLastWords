import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mylastwords/Screens/Login/components/background.dart';
import 'package:mylastwords/Screens/Signup/signup_screen.dart';
import 'package:mylastwords/Services/user_service.dart';
import 'package:mylastwords/components/already_have_an_account_acheck.dart';
import 'package:mylastwords/components/rounded_button.dart';
import 'package:mylastwords/components/rounded_input_field.dart';
import 'package:mylastwords/components/rounded_password_field.dart';
import 'package:mylastwords/constants.dart';
import 'package:mylastwords/Screens/DashBoard/dashboard.dart';
import 'package:mylastwords/models/api_response.dart';
import 'package:mylastwords/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController txtEmail = TextEditingController();
  final TextEditingController txtPass = TextEditingController();

  void _loginValidate() async {
    bool isEmailvalid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(txtEmail.text);
    var errmsg = "";
    if (txtEmail.text == "") {
      errmsg = "Please enter email";
    } else if (isEmailvalid == false) {
      errmsg = "Please enter valid email";
    } else if (txtPass.text == "") {
      errmsg = "Pelase enter password";
    } else {
      ApiResponse response = await login(txtEmail.text, txtPass.text);
      print("Reponse Data: " +
          '${response.data}' +
          " Reponse Error: " +
          '${response.error}');
      if (response.error == null) {
        _saveAndRedirectToHome(response.data as User);
      } else {
        Fluttertoast.showToast(
            msg: '${response.error}',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: darkBackground,
            textColor: txtColorLight,
            fontSize: 15.0);
      }
    }
    if (errmsg != "") {
      Fluttertoast.showToast(
          msg: errmsg,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: darkBackground,
          textColor: txtColorLight,
          fontSize: 15.0);
    }
  }

  void _saveAndRedirectToHome(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('name', user.name ?? '');
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id ?? 0);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return DashBoard();
        },
      ),
    );
  }

  @override
  void initState() {
    txtEmail.text = "clarkkent@gmail.com";
    txtPass.text = "Clarkkent_007";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/images/logo.png",
              height: size.height * 0.2,
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              "Sign in to your account to access your profile, history, \nand any private pages you've been granted access to.",
              style: TextStyle(color: txtColorDark, fontSize: 13),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              controller: txtEmail,
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              hintText: "Password",
              controller: txtPass,
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                print(txtEmail.text + " " + txtPass.text);
                _loginValidate();
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
