import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: const Color(0xffEFF6FF),
      fontFamily: 'Lato Bold',
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.w500,
              fontFamily: 'Montserrat Bold',
            ),
            backgroundColor: const Color(0xff003D93),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            )),
      ),
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          color: Color.fromARGB(255, 255, 255, 255),
          elevation: 4,
          shadowColor: Colors.black,
          titleTextStyle: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          )));
}
