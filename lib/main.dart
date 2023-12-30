import 'package:flutter/material.dart';
import 'package:vroom_vroom/utils/contants/colors/app_colors.dart';
import 'package:vroom_vroom/utils/routes/app_routes.dart';

void main() {
  return runApp(
      MaterialApp.router(
        // theme: ThemeData(),
        darkTheme: ThemeData(
          fontFamily: 'lato',
          scaffoldBackgroundColor: AppColors.backgroundColor,
          textTheme: const TextTheme(
              headlineLarge: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w800,
                color: AppColors.textColor
              ),
              headlineSmall: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.textColor,
                letterSpacing: 0.3,
                height: 1.5
              ),
              displayMedium: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400, color: AppColors.textColor
              ),
              displaySmall: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                  color: AppColors.textColor
              ),
              labelLarge: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                  color: AppColors.textColor,
              ),
          )
        ),
        routerConfig: routes,
      )
  );
}

