import 'package:flutter/material.dart';
import 'login_page.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Container(
        color: Colors.tealAccent, 
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            TextField(
              decoration: const InputDecoration(
                labelText: 'Name',
                filled: true,
                fillColor: Colors.white, 
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            // Email TextField
            TextField(
              decoration: const InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Colors.white, 
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            // Password TextField
            TextField(
              decoration: const InputDecoration(
                labelText: 'Password',
                filled: true,
                fillColor: Colors.white, 
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrangeAccent, 
                minimumSize: const Size(double.infinity, 50), 
              ),
              onPressed: () {
                Navigator.pop(context); 
              },
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: 20),

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
                    style: TextStyle(color: Colors.deepOrangeAccent), 
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
