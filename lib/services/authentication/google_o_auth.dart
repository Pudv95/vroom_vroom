import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;


class GoogleAuth{
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final FlutterSecureStorage storage = const FlutterSecureStorage();
  BuildContext? context;
  GoogleAuth({required this.context});

  Future<void> handleSignIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;

      final String accessToken = googleSignInAuthentication.accessToken!;
      await exchangeTokenWithBackend(accessToken);


    } catch (error) {
      print("-----------------++++++++++++++++----------------------------");
      print(error);
      print("-----------------+++++++++++++++++++++----------------------------");
    }
  }
  Future<void> exchangeTokenWithBackend(String accessToken) async {
    String? baseURL = dotenv.get('BaseURL');
    final response = await http.post(
      Uri.parse('$baseURL/auth/exchange/'),
      body: {'access_token': accessToken},
    );

    if (response.statusCode == 201) {
      print('Token exchange successful: ${response.body}');
      Map data = jsonDecode(response.body);
      storage.write(key: 'refreshToken', value: data['refresh_token']);
      storage.write(key: 'accessToken', value: data['access_token']);
      context?.go('/');
    } else if(response.statusCode == 400) {
      // Handle error
      print('not akgec');
      Fluttertoast.showToast(msg: 'Please choose an akgec email');
      await _googleSignIn.signOut();
      print('signed out');
    }
    else{
      print(accessToken);
      print('---------------------------------------------------');
      print(response.body);
    }
  }

  void signOut()async{
    await _googleSignIn.signOut();
  }
}