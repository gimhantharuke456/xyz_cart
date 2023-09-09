import 'package:flutter/material.dart';
import 'package:xyz_cart/providers/auth_provider.dart';
import 'package:xyz_cart/screens/auth/login_screen.dart';
import 'package:xyz_cart/services/auth_service.dart';
import 'package:xyz_cart/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  final AuthService authService = AuthService();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(authService),
        ),
      ],
      child: const MyApp(),
    ),
  );
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
