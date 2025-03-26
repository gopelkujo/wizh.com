import 'package:flutter/material.dart';

class MyThemes {
  static final inputDecoration = InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    filled: true,
    fillColor: Colors.grey.shade300,
  );

  static final elevatedButton = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      elevation: 1,
    ),
  );
}
