import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

showMySnackBar({
  required BuildContext context,
  required String message,
  Color? color,
}){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: color?? Colors.green,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 1),
    )
    );
}