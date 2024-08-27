import 'package:flutter/material.dart';

void afficherMessageInfo(BuildContext context ,String message, Color? color, bool icon) {
  var snackBar = SnackBar(
    showCloseIcon: icon,
    closeIconColor: Colors.white,
    duration: Duration(seconds: 6),
      padding: EdgeInsets.symmetric(vertical: 5),
    elevation: 10,
    backgroundColor: color,
      content: Text(message,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500
      ),
      textAlign: TextAlign.center,));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}