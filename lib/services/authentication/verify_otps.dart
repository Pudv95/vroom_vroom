import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Verification {
  final String baseUrl = dotenv.get('BaseURL');

  verifyOTP(String token, String otp) async {
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
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
        print('OTP verified successfully');
      } else {
        // OTP verification failed
        print('OTP verification failed. Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
      }
    } catch (e) {
      print('Error during OTP verification: $e');
    }
  }
}
