import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  primaryColor: const Color(0xFF006837),
  scaffoldBackgroundColor: Colors.white,
  disabledColor: const Color(0xFFDDDDDD),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    onPrimary: Colors.white,
    secondary: Colors.black,
    onSecondary: Colors.white,
    primary: const Color(0xFF006837),
    background: Colors.white,
    outline: Colors.black12,
  ),
  primaryTextTheme: const TextTheme(
    headlineLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontSize: 23,
      
    ),
    bodyLarge: TextStyle(
      color: Color(0xFF858585),
      fontWeight: FontWeight.w400,
      fontSize: 15,
    
    ),
    labelLarge: TextStyle(
      color: Colors.black,
     
      fontSize: 17,
      fontWeight: FontWeight.bold
    ),
    labelMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 15,
     
    ),
  ),
  
  inputDecorationTheme: InputDecorationTheme(
    
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: const BorderSide(
        color: Colors.black12,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: const BorderSide(
        color: Colors.black,
      ),
    ),
    contentPadding: const EdgeInsets.all(16),
    hintStyle: const TextStyle(
      color: Color(0xFF858585),
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Color(0xFF858585),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(const Color(0xFF006837)),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(const Color(0xFF006837)),
    foregroundColor: MaterialStateProperty.all(Colors.white),
    elevation: MaterialStateProperty.all(0),
    minimumSize: MaterialStateProperty.all(const Size(100, 30)),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
  ),
);
