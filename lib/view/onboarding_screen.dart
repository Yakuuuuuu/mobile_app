import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/onboarding_bloc.dart';
import '../bloc/onboarding_event.dart';
import '../bloc/onboarding_state.dart';
import 'dashboard_screen.dart';
import 'widgets/dot_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();

    final List<Map<String, dynamic>> slides = [
      {
        'color': const Color.fromARGB(255, 230, 230, 158),
        'quote': "Welcome to Hamro Booking, your travel companion!",
        'icon': Icons.hotel,
      },
      {
        'color': Colors.blue,
        'quote': "Find the best hotels at the best prices.",
        'icon': Icons.attach_money,
      },
      {
        'color': Colors.green,
        'quote': "Your dream destination is just a click away.",
        'icon': Icons.flight_takeoff,
      },
      {
        'color': Colors.orange,
        'quote': "Experience comfort like never before.",
        'icon': Icons.king_bed,
      },
    ];

    return BlocProvider(
      create: (_) => OnboardingBloc(pageController),
      child: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          final bloc = context.read<OnboardingBloc>();
          int currentIndex =
              state is OnboardingSlideChangedState ? state.currentIndex : 0;

          return Scaffold(
            body: Stack(
              children: [
                PageView.builder(
                  controller: pageController,
                  onPageChanged: (index) {
                    bloc.add(UpdateSlideIndexEvent(index));
                  },
                  itemCount: slides.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: slides[index]['color'],
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              slides[index]['icon'],
                              size: 80,
                              color: Colors.black,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              slides[index]['quote'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                // Skip Button
                Positioned(
                  top: 40,
                  right: 20,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DashboardScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: 20,
                  right: 20,
                  child: Column(
                    children: [
                      DotIndicator(
                        itemCount: slides.length,
                        currentIndex: currentIndex,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (currentIndex > 0)
                            ElevatedButton(
                              onPressed: () {
                                bloc.add(PreviousSlideEvent());
                              },
                              child: const Text('Back'),
                            )
                          else
                            const SizedBox(
                                width: 80), // Placeholder for alignment
                          ElevatedButton(
                            onPressed: () {
                              if (currentIndex < slides.length - 1) {
                                bloc.add(NextSlideEvent(slides.length));
                              } else {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const DashboardScreen(),
                                  ),
                                );
                              }
                            },
                            child: Text(
                              currentIndex == slides.length - 1
                                  ? 'Finish'
                                  : 'Next',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
