import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamroBooking/features/home/presentation/view_model/home_cubit.dart';
import 'package:hamroBooking/features/home/presentation/view_model/home_state.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const SocialMediaUI(),
    );
  }
}

class SocialMediaUI extends StatelessWidget {
  const SocialMediaUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(234, 241, 248, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              'assets/icons/logo.png',
              height: 30,
              width: 30,
            ),
            const SizedBox(width: 20),
            Flexible(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: const Color.fromRGBO(234, 241, 248, 1),
                  contentPadding: const EdgeInsets.all(5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
          const SizedBox(width: 10),
          const CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: AssetImage('assets/images/avatar.png'),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.views[state.selectedIndex];
        },
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildNavItem(context, Icons.home, 0, state.selectedIndex),
                _buildNavItem(
                    context, Icons.calendar_month, 1, state.selectedIndex),
                _buildNavItem(context, Icons.map, 2, state.selectedIndex),
                _buildNavItem(
                    context, Icons.document_scanner, 3, state.selectedIndex),
                _buildNavItem(context, Icons.settings, 4, state.selectedIndex),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildNavItem(
      BuildContext context, IconData icon, int index, int currentIndex) {
    return GestureDetector(
      onTap: () => context.read<HomeCubit>().selectTab(index),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: currentIndex == index
              ? const Color.fromRGBO(243, 40, 84, 1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: currentIndex == index ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}
