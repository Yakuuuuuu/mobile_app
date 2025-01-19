import 'package:flutter/material.dart';

void showMySnackBar({
  required BuildContext context, // Correctly place 'required' once
  required String message,
  Color? color,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: color ?? const Color.fromARGB(255, 52, 63, 224),
      duration: const Duration(seconds: 1),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
