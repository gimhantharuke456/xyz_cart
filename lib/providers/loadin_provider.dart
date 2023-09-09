import 'package:flutter/material.dart';

class LoadinProvider extends ChangeNotifier {
  bool isLoading = false;
  void updateBoolState() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
