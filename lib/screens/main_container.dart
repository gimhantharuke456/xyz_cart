import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xyz_cart/providers/auth_provider.dart';
import 'package:xyz_cart/providers/loadin_provider.dart';
import 'package:xyz_cart/screens/auth/login_screen.dart';
import 'package:xyz_cart/screens/home/home_screen.dart';
import 'package:xyz_cart/services/local_prefs.dart';
import 'package:xyz_cart/widgets/loading.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({super.key});

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  bool hasLoggedIn = false;
  late LoadinProvider _loadinProvider;
  final _prefs = LocalPreferences.instance;
  @override
  void initState() {
    _loadinProvider = Provider.of<LoadinProvider>(context, listen: false);
    _loadinProvider.isLoading = true;
    _prefs.getToken().then((value) {
      if (value != null) {
        setState(() {
          hasLoggedIn = true;
        });
      }
      _loadinProvider.isLoading = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoadinProvider>(
      builder: (context, loadinProvider, child) {
        if (loadinProvider.isLoading) {
          return const Loading();
        }
        return Consumer<AuthProvider>(builder: (context, authProvider, child) {
          if (authProvider.userData != null) {
            return const HomeScreen();
          } else {
            return hasLoggedIn ? const HomeScreen() : const LoginScreen();
          }
        });
      },
    );
  }
}
