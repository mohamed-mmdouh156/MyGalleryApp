import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_gallery/Presentation/resources/color_manager.dart';

class AppTheme {

  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: ColorManager.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorManager.white,
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: ColorManager.black,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: ColorManager.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorManager.white,
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: ColorManager.lightBlue,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    ),
  );

}