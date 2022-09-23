import 'package:flutter/material.dart';

class MyTheme {
  static final darkTheme = ThemeData(
      appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
      scaffoldBackgroundColor: Colors.black,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: const Color.fromARGB(255, 117, 117, 117))),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.blueGrey,
      ),
      colorScheme: const ColorScheme.dark(),
      textTheme: const TextTheme(
        button: TextStyle(color: Colors.grey),
        bodyText1: TextStyle(color: Colors.grey),
      ));

  static final lightTheme = ThemeData(
      appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light(
        secondary: Colors.yellow,
      ),
      iconTheme: const IconThemeData(
        color: Colors.red,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: const Color.fromARGB(255, 189, 189, 189))),
      primaryIconTheme: const IconThemeData(color: Colors.amber),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.green,
      ),
      textTheme: TextTheme(
          button: const TextStyle(color: Colors.orange),
          bodyText1: TextStyle(color: Colors.green.shade100)));
}
