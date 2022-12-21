import 'package:flutter/material.dart';
import 'package:todo_app/shared/styles/my_theme.dart';

import 'layout/home_layout.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeLayout.routName,
      routes: {HomeLayout.routName: (context) => HomeLayout()},
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode:ThemeMode.light,
    );
  }
}
