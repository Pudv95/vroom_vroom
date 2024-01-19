import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'login.dart';

addUserDetails(String name, int age, String gender,BuildContext context) async {
  final String token = await LoginUser().getAccessToken();
  if(gender == 'Male') gender = 'M';
  if(gender == 'Female') gender = 'F';
  if(gender == 'Other') gender = 'O';
  final baseURL = dotenv.get('BaseURL');

  final headers = {
    'accept': 'application/json',
    'Authorization': 'Bearer $token',
    'Content-Type': 'application/json',
  };

  final body = jsonEncode({
    'name': name,
    'age': age,
    'gender': gender,
  });

  try {
    final response = await http.put(
      Uri.parse('$baseURL/details/user/'),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      return null;
    } else {
      print('Failed to update user details. Status code: ${response.statusCode}');
      print('Response: ${response.body}');
      return 'Please try again later';
    }
  } catch (error) {
    print('Error: $error');
  }
}
