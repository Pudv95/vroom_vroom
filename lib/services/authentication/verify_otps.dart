import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'login.dart';

class Verification {
  final String baseUrl = dotenv.get('BaseURL');

  verifyOTP(String otp,BuildContext context) async {
    final String token = LoginUser().getAccessToken();
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/reset/verify-otp/'),
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'token': token,
          'otp': otp,
        }),
      );
      print(jsonDecode(response.body));
      Map data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        data['success'] = true;
        return data;

      } else {
        // OTP verification failed
        print('OTP verification failed. Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
        return {
          'success': false,
          'msg':data['error']
        };
      }
    } catch (e) {
      print('Error during OTP verification: $e');
    }
  }
}
