import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginUser {
  final String baseUrl = dotenv.get('BaseURL');
  final storage = const FlutterSecureStorage();




  Future<Map<String, dynamic>> getToken(String email, String password) async {
    final String tokenGenerateUrl = '$baseUrl/auth/token/generate/';
    try {
      final response = await http.post(
        Uri.parse(tokenGenerateUrl),
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        print('Login successful');
        print('Token: ${response.body}');
        final Map<String, dynamic> data = jsonDecode(response.body);
        data['success'] = true;
        return data;
      } else if (response.statusCode == 401) {
        print('Login failed');
        final Map<String, dynamic> data = jsonDecode(response.body);
        data['success'] = false;
        return {
          'success': false,
          'msg': data['detail'],
        };
      } else {
        throw Exception('Failed to login: ${response.body}');
      }
    } catch (error) {
      print('error: $error');
      return {
        'success': false,
        'msg': error.toString(),
      };
    }
  }

  Future<void> verifyToken(String token) async {
    final String tokenVerifyUrl = '$baseUrl/auth/token/verify/';
    try {
      final response = await http.post(
        Uri.parse(tokenVerifyUrl),
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'token': token,
        }),
      );

      if (response.statusCode == 200) {
        print('Token verification successful');
      } else {
        print('Token verification failed');
        print('Error: ${response.body}');
        // check for refresh token
        final refreshtoken = await storage.read(key: 'refreshToken');
        if (refreshtoken != null) {
          await refreshToken(refreshtoken);
        } else {
          print('Try to login again');
        }
      }
    } catch (error) {
      print('Http error: $error');
    }
  }

  Future<void> refreshToken(String refresh) async {
    final String tokenRefreshUrl = '$baseUrl/auth/token/refresh/';
    try {
      final response = await http.post(
        Uri.parse(tokenRefreshUrl),
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'refresh': refresh,
        }),
      );

      if (response.statusCode == 200) {
        print('Token refresh successful');
        print('New access token: ${jsonDecode(response.body)['access']}');
      } else {
        print('Token refresh failed');
        print('Error: ${response.body}');
      }
    } catch (error) {
      print('Http error: $error');
    }
  }
}
