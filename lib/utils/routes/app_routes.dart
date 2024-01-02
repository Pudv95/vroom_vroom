import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:vroom_vroom/views/screens/authentication/signup/signup.dart';


final GoRouter routes = GoRouter(
    routes: <GoRoute>[
      GoRoute(path: '/', builder: (BuildContext context,GoRouterState state){
        return SignUp();
      },routes: const [

      ]),
    ]
);