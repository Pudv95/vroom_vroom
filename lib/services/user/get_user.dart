import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vroom_vroom/services/authentication/login.dart';
import 'package:http/http.dart' as http;

class GetUser{

  getUser() async {
    final baseURL = dotenv.get('BaseURL');
    final accessToken = await LoginUser().getAccessToken();

    final url = Uri.parse('$baseURL/details/user/');

    try {
      final response = await http.get(
        url,
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return data;
      } else {
        return null;
      }
    } catch (e) {
      print('Exception: $e');
    }
  }
}