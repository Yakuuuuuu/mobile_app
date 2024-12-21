import 'package:flutter/material.dart';
import 'package:mobile_app/view/faq_detail_screen.dart';

import 'login_screen.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  _HelpCenterScreenState createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this); // Five tabs
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Help Center',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Sign In and Continue without Account Buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to LoginScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    // Handle continue without account logic
                  },
                  child: const Text(
                    'Continue without an account',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // FAQ Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Frequently Asked Questions',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
          // TabBar for Categories
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.blue,
            indicatorWeight: 3,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(icon: Icon(Icons.hotel), text: 'Stays'),
              Tab(icon: Icon(Icons.directions_car), text: 'Car rentals'),
              Tab(icon: Icon(Icons.flight), text: 'Flights'),
              Tab(icon: Icon(Icons.local_taxi), text: 'Airport taxis'),
              Tab(icon: Icon(Icons.shield), text: 'Insurance'),
            ],
          ),
          const SizedBox(height: 8),
          // TabBar Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildTabContent('Stays', [
                  {
                    'title': 'Cancellation',
                    'details': [
                      'How to cancel?',
                      'Cancellation policies',
                      'Refund process'
                    ],
                  },
                  {
                    'title': 'Payment and fees',
                    'details': [
                      'Payment methods',
                      'Service fees',
                      'Security deposits'
                    ],
                  },
                  {
                    'title': 'Booking details',
                    'details': [
                      'Editing booking',
                      'Adding special requests',
                      'Changing guest count'
                    ],
                  },
                ]),
                _buildTabContent('Car Rentals', [
                  {
                    'title': 'Driver responsibilities',
                    'details': [
                      'Required documents',
                      'Driving age',
                      'International licenses'
                    ],
                  },
                  {
                    'title': 'Fuel and mileage',
                    'details': [
                      'Mileage limits',
                      'Fuel policies',
                      'Charges for extra mileage'
                    ],
                  },
                  {
                    'title': 'Insurance and protection',
                    'details': [
                      'Basic coverage',
                      'Additional protection',
                      'Filing claims'
                    ],
                  },
                ]),
                _buildTabContent('Flights', [
                  {
                    'title': 'Baggage and seats',
                    'details': [
                      'Checked baggage rules',
                      'Cabin baggage size',
                      'Reserving seats'
                    ],
                  },
                  {
                    'title': 'Boarding passes',
                    'details': [
                      'Getting boarding passes',
                      'Mobile passes',
                      'Reprinting boarding passes'
                    ],
                  },
                  {
                    'title': 'Flight confirmation',
                    'details': [
                      'Checking flight status',
                      'Getting e-tickets',
                      'Flight changes'
                    ],
                  },
                ]),
                _buildTabContent('Airport Taxis', [
                  {
                    'title': 'Journey',
                    'details': ['Route options', 'Driver info', 'Safety tips'],
                  },
                  {
                    'title': 'Payment info',
                    'details': [
                      'Accepted payment methods',
                      'Online payments',
                      'Receipts and invoices'
                    ],
                  },
                  {
                    'title': 'Accessibility and extras',
                    'details': [
                      'Wheelchair access',
                      'Child seats',
                      'Language preferences'
                    ],
                  },
                ]),
                _buildTabContent('Insurance', [
                  {
                    'title': 'Policy details',
                    'details': [
                      'Understanding policy terms',
                      'Renewing policies',
                      'Claiming benefits'
                    ],
                  },
                  {
                    'title': 'Coverage options',
                    'details': [
                      'Health insurance',
                      'Travel insurance',
                      'Life insurance'
                    ],
                  },
                  {
                    'title': 'File a claim',
                    'details': [
                      'Steps to file a claim',
                      'Required documents',
                      'Contacting support'
                    ],
                  },
                ]),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }

  Widget _buildTabContent(String category, List<Map<String, dynamic>> items) {
    return ListView(
      children: items.map((item) {
        return ListTile(
          title: Text(
            item['title'],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FAQDetailsScreen(
                  title: item['title'],
                  details: item['details'],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
