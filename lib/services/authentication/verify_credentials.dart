import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class VerifyCredentials{
  String otp;
  String? email;
  String? number;
  final String baseUrl = dotenv.get('BaseURL');
  final storage = const FlutterSecureStorage();


    VerifyCredentials({required this.otp,required this.email,required this.number});

  verifyPhone() async {

    final accessToken = await storage.read(key: 'refreshToken');

    final Uri uri = Uri.parse("$baseUrl/auth/verify-phone/");
    final Map<String, String> headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json',
    };

    final Map<String, dynamic> data = {
      'otp': otp,
    };

    try {
      final http.Response response = await http.post(uri, headers: headers, body: jsonEncode(data));

      if (response.statusCode == 201) {
        return null;
      } else {
        return 'Invalid OTP';
      }
    } catch (e) {
      return {'error': 'Exception during request: $e'};
    }
  }

  verifyEmail() async {

    final accessToken = await storage.read(key: 'refreshToken');
    final Uri uri = Uri.parse("$baseUrl/auth/verify-email/");
    final Map<String, String> headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json',
    };

    final Map<String, dynamic> data = {
      'otp': otp,
    };

    try {
      final http.Response response = await http.post(uri, headers: headers, body: jsonEncode(data));
      print(response.body);
      if (response.statusCode ==   201) {
        print('herere');
        return null;
      } else {
        print( {'error': 'Request failed with status: ${response.statusCode}'});

        return 'Invalid OTP';
      }
    } catch (e) {
      return {'error': 'Exception during request: $e'};
    }
  }



}