import 'package:flutter/material.dart';
import 'package:xyz_cart/screens/auth/login_screen.dart';
import 'package:xyz_cart/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "XYZ Cart",
      home: const LoginScreen(),
      theme: appTheme,
    );
  }
}
