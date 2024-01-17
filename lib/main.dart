import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:vroom_vroom/utils/providers/authentication/forgot_password_provider.dart';
import 'package:vroom_vroom/utils/providers/authentication/login_provider.dart';
import 'package:vroom_vroom/utils/contants/colors/app_colors.dart';
import 'package:vroom_vroom/utils/providers/authentication/reset_password_provider.dart';
import 'package:vroom_vroom/utils/providers/authentication/signup_provider.dart';
import 'package:vroom_vroom/utils/providers/authentication/verify_otp_provider.dart';
import 'package:vroom_vroom/utils/routes/app_routes.dart';

void main() async {
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(
      MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => ForgotPasswordProvider()),
        ChangeNotifierProvider(create: (context) => VerifyOTPProvider()),
        ChangeNotifierProvider(create: (context) => ResetPasswordProvider()),
        ChangeNotifierProvider(create: (context) => SignUpProvider()),
      ],child: MaterialApp.router(
        // theme: ThemeData(),
        darkTheme: ThemeData.dark().copyWith(
          primaryColor: AppColors.textColor,
          scaffoldBackgroundColor: AppColors.backgroundColor,
          textTheme: const TextTheme(
            headlineLarge: TextStyle(
                fontSize: 40,
                fontFamily: 'lato',
                fontWeight: FontWeight.w900,
                color: AppColors.textColor
            ),
            headlineSmall: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'lato',
                color: AppColors.textColor,
                letterSpacing: 0.3,
                height: 1.5
            ),
            displayMedium: TextStyle(
                fontSize: 14,
                fontFamily: 'lato',
                fontWeight: FontWeight.w400, color: AppColors.textColor
            ),
            displaySmall: TextStyle(
                fontSize: 12,
                fontFamily: 'lato',
                fontWeight: FontWeight.w400,
                color: AppColors.textColor
            ),
            labelLarge: TextStyle(
              fontSize: 16,fontFamily: 'lato',
              fontWeight: FontWeight.w700,
              color: AppColors.textColor,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(AppColors.primaryColor),
              minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity,56)),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(horizontal: 20.0),
              ),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Set button border radius
                ),
              ),
            ),
          ),
        ),
        themeMode: ThemeMode.dark,
        routerConfig: routes,
      ),)
  );
}

