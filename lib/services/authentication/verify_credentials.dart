import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'login.dart';

class VerifyCredentials{
  String otp;
  String? email;
  String? number;
  final String baseUrl = dotenv.get('BaseURL');
  final storage = const FlutterSecureStorage();


  VerifyCredentials({required this.otp,required this.email,required this.number});

  Future<String?> sendVerificationOTPToNumber(BuildContext context) async {
    final String token = await LoginUser().getAccessToken(context);
    number = "+91$number";
    print(number);
    print(token);
    final url = '$baseUrl/auth/send-phone-verification/';

    final headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      'phone_number': number,
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        print('OTP sent successfully to $number');
        print('Response: ${response.body}');
        return null;
      } else {
        print('Failed to send OTP to $number. Status code: ${response.statusCode}');
        print('Response: ${response.body}');
        return 'Number Already verified';
      }
    } catch (error) {
      print('Error: $error');
    }
    return null;
  }

  verifyPhone(BuildContext context) async {

    final String accessToken = await LoginUser().getAccessToken(context);

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

      if (response.statusCode == 200) {
        return null;
      } else {
        print(response.body);
        return 'Invalid OTP';
      }
    } catch (e) {
      return {'error': 'Exception during request: $e'};
    }
  }

  verifyEmail(BuildContext context) async {

    final String accessToken = await LoginUser().getAccessToken(context);

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
      if (response.statusCode ==  200 || response.statusCode == 400 && jsonDecode(response.body)['message'] == 'Email is Already Verified.' ) {
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