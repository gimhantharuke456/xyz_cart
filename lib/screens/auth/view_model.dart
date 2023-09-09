import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xyz_cart/providers/auth_provider.dart';
import 'package:xyz_cart/providers/loadin_provider.dart';
import 'package:xyz_cart/utils/mixins.dart';

mixin LoginDelegate implements SnackbarMixin {}

class ViewModel {
  LoginDelegate? loaginDelegate;
  LoadinProvider? loadinProvider;
  AuthProvider? authProvider;
  ViewModel(
      {required LoginDelegate loaginDelegate,
      required LoadinProvider loadinProvider,
      required AuthProvider authProvider}) {
    this.loaginDelegate = loaginDelegate;
    this.loadinProvider = loadinProvider;
    this.authProvider = authProvider;
  }
  String email = "";
  String password = "";
  void handleLoginButtonPress() async {
    loadinProvider!.updateBoolState(true);
    try {
      await authProvider!.login(email, password);
    } catch (e) {
      loaginDelegate!.showSnackbar("Error login $e");
    }
    loadinProvider!.updateBoolState(false);
  }
}
