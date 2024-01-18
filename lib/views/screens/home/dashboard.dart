import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:vroom_vroom/services/authentication/google_o_auth.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ElevatedButton(onPressed: (){GoogleAuth(context: context).signOut();const FlutterSecureStorage().deleteAll();context.go('/');}, child: const Text('Logout')),),
    );
  }
}
