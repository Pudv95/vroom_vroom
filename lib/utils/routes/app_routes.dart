import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:vroom_vroom/views/screens/authentication/login/details_for_otp.dart';
import 'package:vroom_vroom/views/screens/authentication/login/forgot_password.dart';
import 'package:vroom_vroom/views/screens/authentication/login/login.dart';
import 'package:vroom_vroom/views/screens/authentication/login/reset_password.dart';
import 'package:vroom_vroom/views/screens/authentication/signup/signup.dart';
import 'package:vroom_vroom/views/screens/home/dashboard.dart';
import 'package:vroom_vroom/views/screens/splash_screen.dart';

CustomTransitionPage customTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 500),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.linear;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

final GoRouter routes = GoRouter(
  routes: <GoRoute>[
    //SplashScreen
    GoRoute(path: '/',builder: (BuildContext context, GoRouterState state){
      return const SplashScreen();
    }),

    // Login
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
      pageBuilder: (context, state) => customTransition(
          context: context, state: state, child: const LoginPage()),
      routes: [
        GoRoute(
          path: 'forgot_password',
          builder: (BuildContext context, GoRouterState state) {
            return const ForgotPassword();
          },
          pageBuilder: (context, state) => customTransition(
              context: context, state: state, child: const ForgotPassword()),
          routes: [
              GoRoute(
                path: 'verify_detail_requirement',
                builder: (BuildContext context, GoRouterState state) {
                  Map extras = state.extra as Map;
                  return DetailsForOtp(isEmail: extras['isEmail'], isLoggingIn: extras['isLoggingIn'],);
                },
                pageBuilder: (context, state) => customTransition(
                    context: context, state: state, child: DetailsForOtp(isEmail: (state.extra as Map)['isEmail'],isLoggingIn: (state.extra as Map)['isLoggingIn'],)),
              ),
            GoRoute(
              path: 'reset_password',
              builder: (BuildContext context, GoRouterState state) {
                return const ResetPassword();
              },
              pageBuilder: (context, state) => customTransition(
                  context: context, state: state, child: const ResetPassword()),
            ),
          ],
        ),
      ]
    ),

    // SignUP
    GoRoute(
      path: '/signup',
      builder: (BuildContext context, GoRouterState state) {
        int? extras = state.extra as int;
        return SignUp(page: extras,);
      },
      pageBuilder: (context, state) =>
          customTransition(context: context, state: state, child: SignUp(page: state.extra as int?,)),
    ),

    // Home
    GoRoute(path: '/dashboard',builder: (BuildContext context, GoRouterState state){
      return const Dashboard();
    }),
  ],
);
