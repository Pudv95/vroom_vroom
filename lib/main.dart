import 'package:flutter/material.dart';
import 'package:vroom_vroom/views/screens/authentication/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vroom Vroom',
      home: LoginPage(),
    );
  }
}

