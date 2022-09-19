import 'package:flutter/material.dart';

class MyTheme {
  static final darkTheme = ThemeData(
      appBarTheme: AppBarTheme(backgroundColor: Colors.black),
      scaffoldBackgroundColor: Colors.black,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(primary: Colors.orange)),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.blueGrey,
      ),
      colorScheme: const ColorScheme.dark(),
      textTheme: TextTheme(
          button: TextStyle(color: Colors.grey),
          bodyText1: TextStyle(color: Colors.grey),));

  static final lightTheme = ThemeData(
      appBarTheme: AppBarTheme(backgroundColor: Colors.white),
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light(
        secondary: Colors.yellow,
      ),
      iconTheme: const IconThemeData(
        color: Colors.red,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(primary: Colors.blueGrey)),
      primaryIconTheme: const IconThemeData(color: Colors.amber),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.green,
      ),
      textTheme: TextTheme(
          button: TextStyle(color: Colors.orange),
          bodyText1: TextStyle(color: Colors.green.shade100))
    
      );


}
