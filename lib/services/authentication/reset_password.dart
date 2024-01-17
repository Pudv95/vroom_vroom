import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:vroom_vroom/services/authentication/login.dart';

class CreateNewPassword {
  final String baseUrl = dotenv.get('BaseURL');

  resetPassword(String password,BuildContext context) async {
    final String token = LoginUser().getAccessToken(context);
    final String url = '$baseUrl/auth/reset/';

    final Map<String, String> headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };

    final Map<String, String> body = {
      'new_password': password,
      'token': token,
    };

    try {
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );
      Map data = jsonDecode(response.body);
      print(data);
      if (response.statusCode == 200) {
        data['success'] = true;
        return data;
      } else {
        print('Password reset failed. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return {
          'success':false,
          'msg':data['error']
        };
      }
    } catch (error) {
      print('Error during password reset: $error');
    }
  }
}