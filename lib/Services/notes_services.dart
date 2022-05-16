import 'dart:convert';

import 'package:mylastwords/Services/user_service.dart';
import 'package:mylastwords/constants.dart';
import 'package:mylastwords/models/api_response.dart';
import 'package:mylastwords/models/note.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//addNote
Future<ApiResponse> addNote(String title, String body) async {
  ApiResponse apiResponse = ApiResponse();
  String token = await getToken(); 
  int id = await getuserId();  
  try {           
    final response = await http.post(Uri.parse(addNoteURL), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    }, body: {
      'userId': id,
      'title': title,
      'body': body,
    });
    
    switch (response.statusCode) {
      case 200:
       print(response.body);
        apiResponse.data = Note.fromJson(jsonDecode(response.body));
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
   
  apiResponse.error = '$e' + '. Server Error.';
  }
  return apiResponse;
}

//getNotes
Future<ApiResponse> getNotes() async {
  ApiResponse apiResponse = ApiResponse();

  try {
    int id = await getuserId();
    String token = await getToken();
    
    final response = await http.post(Uri.parse(getNotesURL+'/$id'), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    switch (response.statusCode) {
      case 200:
        print(response.body);
        apiResponse.data = Note.fromJson(jsonDecode(response.body));
        break;
      case 401:
        apiResponse.error = "Unauthorized";
        break;
      default:
        apiResponse.error = "Something went wrong";
    }
  } catch (e) {
    apiResponse.error = '$e' + '. Server Error.';
  }
  return apiResponse;
}

// //get token
// Future<String> getToken() async {
//   SharedPreferences pref = await SharedPreferences.getInstance();
//   return pref.getString('token') ?? '';
// }

// //get User ID
// Future<int> getuserId() async {
//   SharedPreferences pref = await SharedPreferences.getInstance();
//   return pref.getInt('userId') ?? 0;
// }
