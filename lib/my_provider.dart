
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {

  String language = 'en';
  ThemeMode thMode = ThemeMode.light;


  // String changeBackgroundImage() {
  //   if (thMode == ThemeMode.light) {
  //     return 'assets/images/background_app.png';
  //   }
  //   return 'assets/images/background_app_dark.png';
  // }

  void changeLanguage(String lang) {
    if (language == lang) {
      return;
    }
    language = lang;
    notifyListeners();
  }


  void changeMode(ThemeMode theme) {
    thMode = theme;
    notifyListeners();
  }
}
