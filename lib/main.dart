import 'package:flutter/material.dart';
import 'package:wizhdotcom/configuration/my_themes.dart';
import 'package:wizhdotcom/features/authentication/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wizh.com',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade700),
        useMaterial3: true,
        inputDecorationTheme: MyThemes.inputDecoration,
      ),
      home: LoginPage(),
    );
  }
}
