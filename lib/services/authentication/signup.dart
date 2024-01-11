import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SignUpUser {
  final String baseUrl = dotenv.get('BaseURL');

  Map<String, String> headers = {
    'accept': 'application/json',
    'Content-Type': 'application/json',
  };

  registerNewUser(String email, String password) async {
    final String url = '$baseUrl/auth/register/';


    final Map<String, String> body = {
      'email': email,
      'password': password,
    };

    try {
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );
      Map data = jsonDecode(response.body);
      if (response.statusCode == 201) {
        print('User registration successful');
        data['success'] = true;
        return data;
      } else {
        print('User registration failed. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return {
          'success':false,
          'message':(data['error']??false)?data['error']:(data['password']??false)?data['password'][0]:'',
        };
      }
    } catch (error) {
      print('Error during user registration: $error');
    }
  }

  updateUser(String name, int age, String gender) async {
    final String url = '$baseUrl/details/user/';


    final Map<String, dynamic> body = {
      'name': name,
      'age': age,
      'gender': gender,
    };

    try {
      final http.Response response = await http.put(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );
      Map data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('User details updated successfully');
        data['success'] = true;
        return data;
      } else {
        print('User details update failed. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        data['success'] = false;
        return data;
      }
    } catch (error) {
      print('Error during user details update: $error');
    }
  }

}
