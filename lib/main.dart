import 'package:flutter/material.dart';
import 'package:xyz_cart/providers/auth_provider.dart';
import 'package:xyz_cart/providers/loadin_provider.dart';

import 'package:xyz_cart/screens/main_container.dart';
import 'package:xyz_cart/services/auth_service.dart';
import 'package:xyz_cart/services/local_prefs.dart';
import 'package:xyz_cart/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final AuthService authService = AuthService();
  final LocalPreferences localPreferences = LocalPreferences.instance;
  await localPreferences.init();
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "XYZ Cart",
      home: const MainContainer(),
      theme: appTheme,
    );
  }
}
