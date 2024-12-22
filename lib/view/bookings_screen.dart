import 'package:flutter/material.dart';

import 'booking_details_screen.dart'; // Import Booking Details Screen
import 'help_center_screen.dart'; // Import Help Center Screen
import 'login_screen.dart'; // Import Login Screen

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Trips',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.white),
            onPressed: () {
              // Navigate to the Help Center Screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HelpCenterScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon:
                const Icon(Icons.cloud_download_outlined, color: Colors.white),
            onPressed: () {
              // Navigate to BookingDetailsScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BookingDetailsScreen(),
                ),
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Align(
            alignment: Alignment.centerLeft, // Align TabBar to the left
            child: TabBar(
              controller: _tabController,
              isScrollable: true, // Allow tabs to scroll
              indicator: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
              ),
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.white,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              tabs: const [
                Tab(text: 'Active'),
                Tab(text: 'Past'),
                Tab(text: 'Canceled'),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTabContent(
            imagePath: 'assets/images/active_image.png',
            title: 'No bookings yet',
            subtitle: 'Sign in or create an account to get started.',
          ),
          _buildTabContent(
            imagePath: 'assets/images/past_image.png',
            title: 'No past bookings',
            subtitle: 'Sign in or create an account to get started.',
          ),
          _buildTabContent(
            imagePath: 'assets/images/canceled_image.png',
            title: 'No canceled bookings',
            subtitle: 'Sign in or create an account to get started.',
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent({
    required String imagePath,
    required String title,
    required String subtitle,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 150,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Navigate to Login Screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Sign In',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
