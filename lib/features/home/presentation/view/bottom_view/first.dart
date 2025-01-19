import 'package:flutter/material.dart';
import 'package:hamroBooking/app/widget/custom_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Let's share what going...",
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
          const PostCard(
            username: "Mr_Handsome",
            time: "June 9, 2024, 7:52 A.M",
            content: "Corruption and Bribery at License Office",
            hashtag: "#Problems",
            imagePath: 'assets/images/corruption.png',
            likes: 12,
            comments: 12,
            shares: 12,
          ),
          const PostCard(
            username: "Shyame",
            time: "June 9, 2024, 7:52 A.M",
            content: "License Nikalni Procedure K ho?",
            hashtag: "#Query",
            imagePath: 'assets/images/corruption.png',
            likes: 8,
            comments: 4,
            shares: 3,
          ),
        ],
      ),
    );
  }
}
