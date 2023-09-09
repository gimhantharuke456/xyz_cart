import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool isPassword;
  final String validatingMessage;
  final bool shouldValidate;

  const CustomInputField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.isPassword = false,
    this.shouldValidate = true,
    this.validatingMessage = "Please fill this field",
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: label, hintText: hint),
      controller: controller,
      validator: shouldValidate
          ? (val) => val != null
              ? val.isEmpty
                  ? validatingMessage
                  : null
              : null
          : null,
    );
  }
}
