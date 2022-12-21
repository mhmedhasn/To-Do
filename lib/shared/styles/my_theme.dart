import 'package:flutter/material.dart';

class MyThemeData {
  static Color colorgreen = Color.fromARGB(255, 223, 236, 219);
  static Color colorblue = Color.fromARGB(255, 93, 156, 236);
  static Color colorWhite = Color.fromARGB(255, 248, 248, 248);
  static Color colorYalow = Color.fromARGB(255, 250, 204, 29);
  static Color colorBlueDark = Color.fromARGB(255, 20, 26, 46);
  static Color colorRed = Color.fromARGB(255, 166, 10, 34);
  static Color colorGrey = Color.fromARGB(255, 158, 158, 158);
  //_____________________________________________________________//

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
        onBackground: colorWhite,
        surface: Colors.grey,
        onSurface: colorWhite),
    //_____________________________________________________________//

    appBarTheme: AppBarTheme(
      color:colorblue,
      iconTheme: IconThemeData(color: Colors.black),
      centerTitle: true,
      elevation: 0.0,
    ),
    //_____________________________________________________________//

    scaffoldBackgroundColor:colorgreen,
    //_____________________________________________________________//

    textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: colorgreen,
        ),

        subtitle1: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        subtitle2: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: colorgreen)),
    //_____________________________________________________________//
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: MyThemeData.colorWhite,
        selectedItemColor: MyThemeData.colorblue,
        unselectedItemColor:Colors.grey),
    //_____________________________________________________________//

    bottomSheetTheme:
        BottomSheetThemeData(backgroundColor: MyThemeData.colorWhite),
  );
  //_____________________________________________________________//
  //_____________________________________________________________//

  static ThemeData darkTheme = ThemeData(
      primaryColor: MyThemeData.colorYalow,
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: colorBlueDark,
          onPrimary: colorWhite,
          secondary: colorYalow,
          onSecondary: colorWhite,
          error: colorRed,
          onError: colorgreen,
          background: Colors.transparent,
          onBackground: colorBlueDark,
          surface: Colors.grey,
          onSurface: colorWhite),
      //_____________________________________________________________//

      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        iconTheme: IconThemeData(color: MyThemeData.colorWhite),
        centerTitle: true,
        elevation: 0.0,
      ),
      //_____________________________________________________________//

      scaffoldBackgroundColor: Colors.transparent,
      //_____________________________________________________________//

      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: colorWhite),
        subtitle1: TextStyle(
            fontSize: 25, fontWeight: FontWeight.normal, color: colorWhite),
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
          BottomSheetThemeData(backgroundColor: MyThemeData.colorGrey));
}
