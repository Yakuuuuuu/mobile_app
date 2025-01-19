import 'package:flutter/material.dart';
import 'package:hamroBooking/features/auth/presentation/view/login.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Community Forum",
      "description":
          "Creating an interactive forum to share information, and engage in discussions.",
      "image": "assets/images/karyalaya.png",
    },
    {
      "title": "Simplify Paperworks",
      "description":
          "Providing step-by-step guidance and document tracking to simplify administrative procedures",
      "image": "assets/images/document.png",
    },
    {
      "title": "Integrated Map",
      "description":
          "Providing a map feature that helps users easily locate government offices",
      "image": "assets/images/Map.png",
    },
  ];

  void _onSkip() {
    // Navigate directly to the main screen
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ));
  }

  void _onNext() {
    if (_currentPage == onboardingData.length - 1) {
      _onSkip();
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                return OnboardingContent(
                  title: onboardingData[index]['title']!,
                  description: onboardingData[index]['description']!,
                  image: onboardingData[index]['image']!,
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onboardingData.length,
              (index) => _buildDot(index: index),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: _onSkip,
                  child: const Text(
                    "Skip",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
                ElevatedButton(
                  onPressed: _onNext,
                  child: Text(_currentPage == onboardingData.length - 1
                      ? "Finish"
                      : "Next"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot({required int index}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      height: 8,
      width: _currentPage == index ? 16 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  final String title, description, image;

  const OnboardingContent({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 300,
          ),
          const SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
