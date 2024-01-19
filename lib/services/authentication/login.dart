import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginUser {
  final String baseUrl = dotenv.get('BaseURL');
  final storage = const FlutterSecureStorage();


  Future<Map<String, dynamic>> getToken(String email, String password) async {
    email.trim();
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

  verifyToken(String token) async {
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
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print('Http error: $error');
    }
  }

  refreshAccessToken(String refresh) async {
    print('herere');
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
      Map<String,String> data  = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('Token refresh successful');
        print('New access token: ${jsonDecode(response.body)['access']}');
        return data['access'];
      } else {
        return null;
      }
    } catch (error) {
      print('Http error: $error');
    }
  }


  getAccessToken()async{
    String? token = await storage.read(key: 'accessToken');
    if(token == null){
      return null;
    }
    else{
      bool? tokenVerified = await verifyToken(token);
      if(tokenVerified != null && tokenVerified){
        return token;
      }
      else{
        String? refreshToken = await storage.read(key: 'refreshToken');
        String? accessToken = await refreshAccessToken(refreshToken!);
        if(accessToken == null){
          return null;
        }
        storage.write(key: 'accessToken', value: accessToken);
        return accessToken;
      }
    }
  }
}
