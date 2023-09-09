import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension BuildContextExtension on BuildContext {
  showSnackBar(String? message,
      [Function? completion, Duration duration = const Duration(seconds: 4)]) {
    if (message != null) {
      final snackBar = SnackBar(
        content: Text(message),
        duration: duration,
      );
      ScaffoldMessenger.of(this).showSnackBar(snackBar).closed.then((value) {
        if (completion != null) {
          completion();
        }
      });
    }
  }
}

extension DateTimeExtension on DateTime {
  String formatDate() {
    DateFormat formatter = DateFormat('yyyy/MM/dd');
    return formatter.format(toLocal());
  }

  String formatTime() {
    DateFormat formatter = DateFormat('HH:mm');
    return formatter.format(toLocal());
  }
}

void navigator(BuildContext context, Widget child) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => child));
}
