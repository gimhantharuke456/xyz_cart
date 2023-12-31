import 'package:flutter/material.dart';
import 'package:xyz_cart/utils/constants.dart';

ThemeData get appTheme => ThemeData(
      scaffoldBackgroundColor: secondaryColor,
      primaryColor: primaryColor,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
      ),
    );
