import 'package:batch33/view/signup_page.dart';
import 'package:flutter/material.dart';
import 'dashboard_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.deepOrangeAccent, // AppBar color
      ),
      body: Container(
        color: Colors.lightBlueAccent, // Background color
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            // Login Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrangeAccent, // Button color
                minimumSize: const Size(double.infinity, 50), // Full width button
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const DashboardPage()),
                  (route) => false,
                );
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 20),
            // Sign Up Option
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account? '),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignupPage()),
                    );
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.deepOrangeAccent), // Sign Up text color
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
