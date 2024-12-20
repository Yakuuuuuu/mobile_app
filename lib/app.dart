import 'package:bus_ticket/view/onboarding_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hamro Booking',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme(
          primary: const Color.fromARGB(255, 240, 240, 240),
          secondary: const Color(0xFFFF5722),
          surface: Colors.white,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black,
          onError: Colors.white,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
              fontFamily: 'Roboto', fontWeight: FontWeight.w400, fontSize: 14),
          bodyMedium: TextStyle(
              fontFamily: 'Roboto', fontWeight: FontWeight.w500, fontSize: 16),
          titleLarge: TextStyle(
              fontFamily: 'Roboto', fontWeight: FontWeight.w700, fontSize: 18),
        ),
      ),
      home: OnboardingScreen(),
    );
  }
}
