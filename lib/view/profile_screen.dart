import 'package:flutter/material.dart';

import 'login_screen.dart'; // Replace with your LoginScreen import

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  final List<Map<String, dynamic>> profileOptions = const [
    {
      'title': 'Rewards & Wallet',
      'icon': Icons.wallet,
      'details': 'Manage your rewards, discounts, and wallet balance.'
    },
    {
      'title': 'Genius Loyalty Program',
      'icon': Icons.card_giftcard,
      'details': 'Details about your Genius loyalty benefits and status.'
    },
    {
      'title': 'Saved',
      'icon': Icons.favorite,
      'details': 'View your saved properties, trips, and preferences.'
    },
    {
      'title': 'Contact Customer Service',
      'icon': Icons.help_outline,
      'details': 'Get help from our customer service team for your queries.'
    },
    {
      'title': 'Safety Resource Center',
      'icon': Icons.security,
      'details': 'Learn about safety guidelines and resources.'
    },
    {
      'title': 'Dispute Resolution',
      'icon': Icons.gavel,
      'details': 'Resolve disputes related to your bookings or payments.'
    },
    {
      'title': 'Deals',
      'icon': Icons.percent,
      'details': 'Explore exclusive deals and discounts.'
    },
    {
      'title': 'Travel Articles',
      'icon': Icons.article,
      'details': 'Browse travel guides and helpful tips.'
    },
    {
      'title': 'Settings',
      'icon': Icons.settings,
      'details': 'Update your account settings and preferences.'
    },
    {
      'title': 'Legal',
      'icon': Icons.balance,
      'details': 'Review legal terms and policies.'
    },
    {
      'title': 'Content Guidelines',
      'icon': Icons.policy,
      'details': 'Learn about our content guidelines and standards.'
    },
    {
      'title': 'List Your Property',
      'icon': Icons.business,
      'details': 'Become a partner by listing your property with us.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notifications coming soon!')),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            _buildProfileHeader(context),
            const SizedBox(height: 20),
            const Divider(color: Colors.grey),
            // Profile Options
            ...profileOptions.map((option) {
              return ListTile(
                leading: Icon(option['icon'], color: Colors.white),
                title: Text(option['title'],
                    style: const TextStyle(color: Colors.white)),
                trailing: option['title'] == 'Rewards & Wallet'
                    ? const Icon(Icons.circle,
                        size: 8, color: Colors.red) // Notification dot
                    : null,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(
                        title: option['title'],
                        details: option['details'],
                      ),
                    ),
                  );
                },
              );
            }),
            const Divider(color: Colors.grey),
            // Log Out Option
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                'Log Out',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // Handle Log Out
                _showLogoutConfirmationDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          child: Icon(Icons.person, size: 40, color: Colors.black),
        ),
        const SizedBox(height: 16),
        const Text(
          'Sign in to manage your trips. Unlock Genius discounts and benefits.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            // Navigate to Sign In screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
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
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ],
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: const Text('Log Out', style: TextStyle(color: Colors.white)),
          content: const Text(
            'Are you sure you want to log out?',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel', style: TextStyle(color: Colors.blue)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const Text('Log Out', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}

class DetailsPage extends StatelessWidget {
  final String title;
  final String details;

  const DetailsPage({super.key, required this.title, required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(title, style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          details,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
