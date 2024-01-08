import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:vroom_vroom/views/screens/authentication/login/forgot_password.dart';
import 'package:vroom_vroom/views/screens/authentication/login/login.dart';
import 'package:vroom_vroom/views/screens/authentication/signup/signup.dart';
import 'package:vroom_vroom/views/screens/authentication/signup/user_details.dart';
import 'package:vroom_vroom/views/screens/authentication/signup/verify_otp.dart';
import 'package:vroom_vroom/views/screens/authentication/signup/verify_number.dart';

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
    GoRoute(
      path: '/',
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
              path: 'verify_number',
              builder: (BuildContext context, GoRouterState state) {
                return VerifyNumber();
              },
              pageBuilder: (context, state) => customTransition(
                  context: context, state: state, child: VerifyNumber()),
            ),
            GoRoute(
              path: 'reset_password',
              builder: (BuildContext context, GoRouterState state) {
                // return ResetPassword();
                return const Placeholder();
              },
              pageBuilder: (context, state) => customTransition(
                  context: context, state: state, child: const Placeholder()),
            ),
          ],
        ),
      ]
    ),

    GoRoute(
      path: '/signup',
      builder: (BuildContext context, GoRouterState state) {
        return SignUp();
      },
      pageBuilder: (context, state) =>
          customTransition(context: context, state: state, child: SignUp()),
      // routes: [
      //   GoRoute(
      //     path: 'send_otp',
      //     builder: (BuildContext context, GoRouterState state) {
      //       // return SendOTP();
      //       return const Placeholder();
      //     },
      //     pageBuilder: (context, state) => customTransition(
      //         context: context, state: state, child: const Placeholder()),
      //     routes: [
      //       GoRoute(
      //         path: 'verify_otp',
      //         builder: (BuildContext context, GoRouterState state) {
      //           return const VerifyNumber();
      //         },
      //         pageBuilder: (context, state) => customTransition(
      //             context: context, state: state, child: const VerifyNumber()),
      //       ),
      //     ],
      //   ),
      //   GoRoute(
      //     path: 'details',
      //     builder: (BuildContext context, GoRouterState state) {
      //       return const UserDetails();
      //     },
      //     pageBuilder: (context, state) => customTransition(
      //         context: context, state: state, child: const UserDetails()),
      //   ),
      // ],
    ),
  ],
);
