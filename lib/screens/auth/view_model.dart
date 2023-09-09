import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xyz_cart/providers/auth_provider.dart';

class ViewModel {
  BuildContext? context;
  ViewModel({required BuildContext context}) {
    this.context = context;
  }
  String email = "";
  String password = "";
  void handleLoginButtonPress() {
    print(email);
    // final authProvider = Provider.of<AuthProvider>(context!, listen: false);
    // authProvider.login(email, password);
  }
}
