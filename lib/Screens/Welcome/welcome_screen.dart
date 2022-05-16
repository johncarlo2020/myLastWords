import 'package:flutter/material.dart';
import 'package:mylastwords/Screens/Welcome/components/body.dart';
import 'package:mylastwords/Services/user_service.dart';
import 'package:mylastwords/Screens/Login/login_screen.dart';
import 'package:mylastwords/models/api_response.dart';

class WelcomeScreen extends StatelessWidget {
  BuildContext? get context => null;

  void loaduserinfo() async {
    String token = await getToken();
    if (token == '') {
      Navigator.of(context!).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false);
    } else {
      ApiResponse response = await getuserDetails();
      if (response.error == null) {
        Navigator.of(context!).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => WelcomeScreen()),
            (route) => false);
      } else if (response.error == "Unauthorized") {
        Navigator.of(context!).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false);
      } else {
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: Text('${response.error}'),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
