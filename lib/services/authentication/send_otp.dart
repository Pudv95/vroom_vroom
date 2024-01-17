import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SendOtp {
  final String baseUrl = dotenv.get('BaseURL');

  sendOTP(String value) async {
    value.trim();
    if(!isEmail(value)){
      value = "+91$value";
      print(value);
    }
    final String endpoint = isEmail(value) ? '$baseUrl/auth/reset/send-otp/email/' : '$baseUrl/auth/reset/send-otp/phone/';

    final Map<String, String> headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };

    final Map<String, String> requestBody = {
      isEmail(value) ? 'email' : 'phone_number': value,
    };

    try {
      final response = await http.post(
        Uri.parse(endpoint),
        headers: headers,
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        print('OTP sent successfully to $value');
        print('Response: ${response.body}');
        Map<String,dynamic> data = jsonDecode(response.body);
        data['success'] = true;
        return data;
      } else {
        throw Exception(jsonDecode(response.body)['error']);
      }
    } catch (error) {
      print(error.toString());
      return {
        'success' : false,
        'msg' : error.toString().replaceAll('Exception: ', ''),
      };
    }
  }

  bool isEmail(String value) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(value);
  }
}
