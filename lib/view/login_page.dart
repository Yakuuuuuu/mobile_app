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
        backgroundColor: Colors.amber,
      ),
      body: Container(
        color: Colors.lightBlueAccent, 
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            TextField(
              decoration: const InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Colors.white, 
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            
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
                backgroundColor: Colors.red, 
                minimumSize: const Size(double.infinity, 50), 
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
