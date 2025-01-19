import 'package:flutter/material.dart';
import 'package:hamroBooking/features/auth/presentation/view/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _hAnimation;
  late Animation<Offset> _bAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize Animation Controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Define Animations
    _hAnimation = Tween<Offset>(
      begin: const Offset(-2.0, 0.0), // `h` starts far from the left
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _bAnimation = Tween<Offset>(
      begin: const Offset(2.0, 0.0), // `B` starts far from the right
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Start Animation
    _controller.forward();

    // Navigate to Onboarding Screen after animation
    _navigateToOnboarding();
  }

  void _navigateToOnboarding() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const OnboardingScreen()),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Flipped `h` Letter Animation
            SlideTransition(
              position: _hAnimation,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(3.14159), // Flip horizontally
                child: const Text(
                  "h",
                  style: TextStyle(
                    fontSize: 120,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue, // Blue color for `h`
                  ),
                ),
              ),
            ),
            // `B` Letter Animation
            SlideTransition(
              position: _bAnimation,
              child: const Text(
                "B",
                style: TextStyle(
                  fontSize: 120,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF39FF14), // Neon green for `B`
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
