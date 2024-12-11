import 'package:batch33/onboarding_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const OnboardingPage(),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'OnBoarding Screen',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const OnboardingPage(),
    );
  }
}