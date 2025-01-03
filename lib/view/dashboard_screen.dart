import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/dashboard_bloc.dart';
import '../bloc/dashboard_event.dart';
import '../bloc/dashboard_state.dart';
import 'notification_screen.dart';
import 'widgets/category_icon.dart';
import 'widgets/offers_card.dart';
import 'widgets/promo_card.dart';
import 'widgets/search_box.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DashboardBloc(),
      child: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          final bloc = context.read<DashboardBloc>();
          int currentIndex =
              state is DashboardTabChangedState ? state.currentIndex : 0;

          final List<Widget> pages = [
            const HomePage(), // Updated Home Page
            const Center(child: Text('Profile Screen')), // Placeholder
            const Center(child: Text('Settings Screen')), // Placeholder
          ];

          return Scaffold(
            backgroundColor: Colors.black,
            body: pages[currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                bloc.add(ChangeTabEvent(index));
              },
              backgroundColor: Colors.black,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Profile'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'Settings'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          // App Bar Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'HamroBooking',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 28,
                  ),
                  onPressed: () {
                    // Navigate to Notifications Screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Horizontal Categories
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: const [
                CategoryIcon(icon: Icons.hotel, label: 'Hotels'),
                SizedBox(width: 16),
                CategoryIcon(icon: Icons.directions_car, label: 'Car Rental'),
                SizedBox(width: 16),
                CategoryIcon(icon: Icons.local_taxi, label: 'Taxi'),
                SizedBox(width: 16),
                CategoryIcon(icon: Icons.attractions, label: 'Attractions'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Search Box
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SearchBox(),
          ),
          const SizedBox(height: 16),
          // Promo Card
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: PromoCard(),
          ),
          const SizedBox(height: 16),
          // Offers Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Exclusive Offers',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const OffersCard(),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Additional Offers Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              color: Colors.grey[900],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey,
                  ),
                  child: const Icon(Icons.local_offer, color: Colors.white),
                ),
                title: const Text(
                  'Early Bird Deals',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                subtitle: const Text(
                  'Save big on early bookings for 2025.',
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: TextButton(
                  onPressed: () {
                    // Handle Offer Click
                  },
                  child: const Text(
                    'View Deals',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
