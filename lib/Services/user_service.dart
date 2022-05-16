import 'dart:convert';

import 'package:mylastwords/constants.dart';
import 'package:mylastwords/models/api_response.dart';
import 'package:mylastwords/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//login
Future<ApiResponse> login(String email, String password) async {
  ApiResponse apiResponse = ApiResponse();

  try {
    final response = await http.post(Uri.parse(loginURL),
        headers: {'Accept': 'application/json'},
        body: {'email': email, 'password': password});
    switch (response.statusCode) {
      case 200:
        print(response.body);
        apiResponse.data = User.fromJson(jsonDecode(response.body));

        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)[0]];
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      default:
        apiResponse.error = "Something went wrong";
    }
  } catch (e) {
    apiResponse.error = "Server Error. Please check Internet Connection";
  }
  return apiResponse;
}

//Register
Future<ApiResponse> register(
  String email,
  String password,
) async {
  ApiResponse apiResponse = ApiResponse();

  try {
    final response = await http.post(Uri.parse(registerURL), headers: {
      'Accept': 'application/json'
    }, body: {
      'name': "New User",
      'email': email,
      'password': password,
      'type': "user",
      'subcription': "free",
    });
    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)[0]];
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      default:
        apiResponse.error = "Something went wrong";
    }
  } catch (e) {
    apiResponse.error = "Server Error";
  }
  return apiResponse;
}

//getuser
Future<ApiResponse> getuserDetails() async {
  ApiResponse apiResponse = ApiResponse();

  try {
    String token = await getToken();
    final response = await http.get(
      Uri.parse(userURL),
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    );
    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 401:
        apiResponse.error = "Unauthorized";
        break;
      default:
        apiResponse.error = "Something went wrong";
    }
  } catch (e) {
    apiResponse.error = "Server Error.";
  }
  return apiResponse;
}

//get token
Future<String> getToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('token') ?? '';
}

//get User ID
Future<int> getuserId() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getInt('userId') ?? 0;
}

//get Name
Future<String> getName() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('name') ?? '';
}

//logout
Future<bool> logout() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return await pref.remove('token');
}
