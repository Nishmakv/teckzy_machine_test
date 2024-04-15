import 'package:flutter/material.dart';
import 'package:teckzy_machine_test/presentation/screens/auth/login_screen.dart';
import 'package:teckzy_machine_test/utils/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
