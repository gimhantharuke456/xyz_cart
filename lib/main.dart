import 'package:flutter/material.dart';
import 'package:xyz_cart/providers/auth_provider.dart';
import 'package:xyz_cart/providers/loadin_provider.dart';
import 'package:xyz_cart/screens/auth/login_screen.dart';
import 'package:xyz_cart/services/auth_service.dart';
import 'package:xyz_cart/utils/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:xyz_cart/widgets/loading.dart';

void main() {
  final AuthService authService = AuthService();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(authService),
        ),
        ChangeNotifierProvider<LoadinProvider>(
          create: (_) => LoadinProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late LoadinProvider _loadingProvider;
  @override
  void initState() {
    _loadingProvider = Provider.of<LoadinProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "XYZ Cart",
      home: _loadingProvider.isLoading ? const Loading() : const LoginScreen(),
      theme: appTheme,
    );
  }
}
