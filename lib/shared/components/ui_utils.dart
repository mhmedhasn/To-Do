import 'package:flutter/material.dart';

void showLoging(String mes, BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: AlertDialog(
            actions: [ Text(mes),CircularProgressIndicator(),],
          ),
        ),
      );
    },
  );
}

void hideLoging(BuildContext context) {
  Navigator.pop(context);
}

void showMessage( BuildContext  context, String message,
    String textbutton, VoidCallback buttonaction) {
  showDialog(context: context, builder: (context) {

      return AlertDialog(

        title: Text(message),

        actions: [
          TextButton(onPressed: buttonaction, child: Text(textbutton))
        ],
      );
    },
  );
}
