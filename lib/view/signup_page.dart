import 'package:flutter/material.dart';
import 'login_page.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Container(
        color: Colors.tealAccent, // Background color for signup page
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Name TextField
            TextField(
              decoration: const InputDecoration(
                labelText: 'Name',
                filled: true,
                fillColor: Colors.white, // White background for input field
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            // Email TextField
            TextField(
              decoration: const InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Colors.white, // White background for input field
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            // Password TextField
            TextField(
              decoration: const InputDecoration(
                labelText: 'Password',
                filled: true,
                fillColor: Colors.white, // White background for input field
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            // Sign Up Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrangeAccent, // Button color
                minimumSize: const Size(double.infinity, 50), // Full width button
              ),
              onPressed: () {
                Navigator.pop(context); // Return to the previous page
              },
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: 20),
            // Already have an account? (Login link)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account? '),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.deepOrangeAccent), // Login text color
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
