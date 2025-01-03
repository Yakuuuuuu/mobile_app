import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final IconData icon;
  final bool obscureText;

  const CustomInputField({
    this.controller,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller, // Assign the controller for user input
      obscureText: obscureText, // Hide text for password fields
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon, color: Colors.grey),
        hintStyle: const TextStyle(color: Colors.grey),
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: Colors.grey[800], // Dark background for the input field
      ),
      style: const TextStyle(color: Colors.white), // White text for readability
    );
  }
}
