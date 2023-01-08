import 'package:flutter/material.dart';

class MyThemeData {
  static Color colorgreen = Color.fromARGB(255, 223, 236, 219);
  static Color colorblue = Color.fromARGB(255, 93, 156, 236);
  static Color colorWhite = Color.fromARGB(255, 248, 248, 248);
  static Color colorBlueDark = Color.fromARGB(255, 20, 26, 46);
  static Color colorGrey = Color.fromARGB(255, 158, 158, 158);

  //_____________________________________________________________//
  static Color colorRed = Color.fromARGB(105, 121, 191, 200);
  static Color colorblak_d_m = Color.fromARGB(255, 19, 43, 65);
  static Color colorYalow = Color.fromARGB(255, 15, 48, 73);
  static Color color4 = Color.fromARGB(255, 93, 156, 236);
  static ThemeData lightTheme = ThemeData(
    primaryColor: MyThemeData.colorblue,
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: colorblue,
        onPrimary: colorWhite,
        secondary: colorgreen,
        onSecondary: colorblue,
        error: colorRed,
        onError: colorgreen,
        background: Colors.transparent,
        onBackground: colorBlueDark,
        surface: Colors.grey,
        onSurface: colorBlueDark),
    //_____________________________________________________________//

    appBarTheme: AppBarTheme(
      color: colorblue,
      iconTheme: IconThemeData(color: Colors.black),
      centerTitle: true,
      elevation: 0.0,
    ),
    //_____________________________________________________________//

    scaffoldBackgroundColor: colorgreen,
    //_____________________________________________________________//

    textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: colorBlueDark,
        ),
        subtitle1: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        subtitle2: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: colorgreen)),
    //_____________________________________________________________//
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: MyThemeData.colorWhite,
        selectedItemColor: MyThemeData.colorblue,
        unselectedItemColor: Colors.grey),
    //_____________________________________________________________//

    bottomSheetTheme:
        BottomSheetThemeData(backgroundColor: MyThemeData.colorWhite),
  );

  //_________________________________________________________________________________________________//
  //_________________________________________________________________________________________________//

  // brightness: Brightness.light,
  // primary: colorblue,
  // onPrimary: colorWhite,
  // secondary: colorgreen,
  // onSecondary: colorblue,
  // error: colorRed,
  // onError: colorgreen,
  // background: Colors.transparent,
  // onBackground:colorBlueDark ,
  // surface: Colors.grey,
  // onSurface: colorBlueDark),
  static ThemeData darkTheme = ThemeData(
      primaryColor: MyThemeData.colorYalow,
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: colorYalow,
          onPrimary: colorblak_d_m,
          secondary: colorRed,
          onSecondary: colorBlueDark,
          error: colorRed,
          onError: colorgreen,
          background: Colors.black26,
          onBackground: colorBlueDark,
          surface: Colors.black12,
          onSurface: colorWhite),
      //_____________________________________________________________//

      appBarTheme: AppBarTheme(
        color: color4,
        iconTheme: IconThemeData(color: MyThemeData.colorWhite),
        centerTitle: true,
        elevation: 0.0,
      ),
      //_____________________________________________________________//

      scaffoldBackgroundColor: colorblak_d_m,
      //_____________________________________________________________//

      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: colorWhite),
        subtitle1: TextStyle(
            fontSize: 18, fontWeight: FontWeight.normal, color: colorWhite),
        subtitle2: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: colorYalow),
      ),
      //_____________________________________________________________//

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: MyThemeData.colorBlueDark,
          selectedItemColor: MyThemeData.colorYalow,
          unselectedItemColor: MyThemeData.colorWhite),
      //_____________________________________________________________//

      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: MyThemeData.colorRed));
}
