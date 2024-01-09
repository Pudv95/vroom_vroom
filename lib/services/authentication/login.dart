import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';

class LoginUser{
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String baseUrl = DotEnv().get('BaseURL');
  Dio dio = Dio();

  Future<void> getToken(String email, String password) async {
    try {
      Response response = await dio.post(
        '$baseUrl/auth/token/generate/',
        options: Options(
          headers: {
            'accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        log('Login successful');
        log('Token: ${response.data['token']}');
        storage.write(key: 'accessToken', value: response.data['accessToken']);
        storage.write(key: 'refreshToken', value: response.data['refreshToken']);
      } else {
        log('Login failed');
        log('Error: ${response.data}');
      }
    } catch (error) {
      log('Dio error: $error');
    }
  }

  Future<void> verifyToken(String token) async {
    try {
      Response response = await dio.post(
        '$baseUrl/auth/token/verify/',
        options: Options(
          headers: {
            'accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'token': token,
        },
      );
      if (response.statusCode == 200) {
        log('Token verification successful');
      } else {
        log('Token verification failed');
        log('Error: ${response.data}');
        //check for refresh token
        String? token = await storage.read(key: 'refreshToken');
        if(token != null){
          await refreshToken(token);
        }
        else{
          log('Try to login again');
        }
      }
    } catch (error) {
      log('Dio error: $error');
    }
  }

  Future<void> refreshToken(String refresh) async {
    try {
      Response response = await dio.post(
        '$baseUrl/auth/token/refresh/',
        options: Options(
          headers: {
            'accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'refresh': refresh,
        },
      );

      if (response.statusCode == 200) {
        log('Token refresh successful');
        log('New access token: ${response.data['access']}');
      } else {
        log('Token refresh failed');
        log('Error: ${response.data}');
      }
    } catch (error) {
      log('Dio error: $error');
    }
  }
}